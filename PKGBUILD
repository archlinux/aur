# Arch's steam, but bootstrapping the 64-bit (SteamRT3) client beta so nothing needs lib32.
# Update the client: curl -fsSO "$_cdn/$_manifest", then rebuild.
# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: K900 <k0009000@gmail.com>

pkgname=steam-beta
_launcher=1.0.0.87
_branch=publicbeta
_manifest=steam_client_${_branch}_ubuntu12
_cdn=https://client-update.steamstatic.com
_reaper64=/usr/lib/steam/reaper64
_binfmt=steam-reaper
# Prints every value the pinned manifest gives key $1, in manifest order.
_manifest_values() { awk -F'"' -v k="$1" '$2 == k {print $4}' $_manifest; }
# smell: zips and hashes paired by position — kept, mirrors makepkg's parallel source/sha256sums.
# A manifest entry without sha2 shifts them; makepkg's checksum failure is the tripwire.
mapfile -t _client_zips < <(_manifest_values file)
mapfile -t _client_sha256 < <(_manifest_values sha2)
pkgver=${_launcher}.$(_manifest_values version)
pkgrel=4
pkgdesc="Valve's digital software delivery system (64-bit client beta, no lib32)"
url='https://steampowered.com/'
arch=('x86_64')
license=('LicenseRef-steam-subscriber-agreement')
provides=("steam=$_launcher")
conflicts=(steam)
# the beta directory is a superset of stable and also contains the stable releases
source=(
  https://repo.steampowered.com/steam/archive/beta/steam_${_launcher}{.tar.gz,.dsc}
  steam.sh
  reaper64.c
  $_manifest
  "${_client_zips[@]/#/$_cdn/}"
)
noextract=("${_client_zips[@]}")
sha256sums=('649375d2f9377f8009aaf3e2ff09978041eb9114897d9c5a3886f1d82e27ba1f'
            '39f27cb743899372b790be1601e748e9e2c5f3140e80b19723fc421d3081e3fb'
            SKIP
            SKIP
            SKIP
            "${_client_sha256[@]}")
validpgpkeys=('BA1816EF8E75005FCF5E27A1F24AEA9FB05498B7') # linux@steampowered.com

# Passes on those of the NUL-separated paths on stdin that are ELF binaries or scripts.
_programs() {
  local f magic
  while IFS= read -rd '' f; do
    IFS= read -rd '' -n4 magic < "$f" || true # files under 4 bytes hit EOF
    case $magic in $'\177ELF' | '#!'*) printf '%s\0' "$f" ;; esac
  done
}

# Builds reaper64, which stands in for exactly the i386 reaper at $1.
_build_reaper64() {
  local crc
  crc=$(python3 -c 'import sys, zlib; print(zlib.crc32(open(sys.argv[1], "rb").read()))' "$1")
  ${CC:-cc} $CPPFLAGS $CFLAGS $LDFLAGS -DSTEAM_REAPER_SIZE=$(stat -c %s "$1") -DSTEAM_REAPER_CRC32=${crc}u \
    -o reaper64 reaper64.c -lz
}

# Prints the binfmt_misc rule that sends the i386 reaper at $1 to reaper64.
_binfmt_rule() {
  # the whole ELF header: its entry point and section layout single the reaper out among i386 programs
  local magic
  magic=$(head -c 52 "$1" | od -An -v -tx1 | tr -d '\n' | sed 's/ /\\x/g')
  echo ":$_binfmt:M::$magic::$_reaper64:P"
}

build() {
  set -o pipefail
  local tree=client
  rm -rf $tree
  mkdir $tree
  for f in "${_client_zips[@]}"; do
    bsdtar -xf "$f" -C $tree
  done
  # the zips carry no mode bits; the client marks programs executable
  find $tree -type f -print0 | _programs | xargs -0 chmod +x
  tar -C $tree --owner=0 --group=0 -cf - . | xz -T0 -0 > steam-launcher/bootstraplinux_ubuntu12_32.tar.xz
  local reaper=$tree/steamrt64/reaper
  _build_reaper64 $reaper
  _binfmt_rule $reaper > $_binfmt.conf
}

package() {
  depends=(
    bash
    coreutils
    curl
    dbus
    desktop-file-utils
    diffutils
    freetype2
    gdk-pixbuf2
    glibc
    hicolor-icon-theme
    libgcc
    libxcrypt
    libxcrypt-compat
    libxkbcommon-x11
    lsb-release
    lsof
    nss
    python
    steam-devices
    ttf-font
    usbutils
    vulkan-driver
    vulkan-icd-loader
    xdg-user-dirs
    xorg-xrandr
    xz
    zenity
    zlib
  )
  local lib32=(
    lib32-alsa-plugins
    lib32-fontconfig
    lib32-gcc-libs
    lib32-glibc
    lib32-libgl
    lib32-libgpg-error
    lib32-libnm
    lib32-libva
    lib32-libx11
    lib32-libxcrypt
    lib32-libxcrypt-compat
    lib32-libxinerama
    lib32-libxss
    lib32-nss
    lib32-pipewire
    lib32-systemd
    lib32-vulkan-driver
    lib32-vulkan-icd-loader
  )
  optdepends=(
    'ntsync-autoload: for NTSync support'
    'polkit: to setup SteamVR without root access'
    'xdg-desktop-portal-impl: file & folder picker'
    'xorg-fonts-misc: for non-latin locales'
    "${lib32[@]/%/: 32-bit native games, or Proton with PROTON_USE_WOW64=0}"
  )

  cd steam-launcher
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}/usr/bin/steam" "${pkgdir}/usr/lib/steam/steam"
  sed "s/@BRANCH@/$_branch/" "${srcdir}/steam.sh" | install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/steam"
  if grep -n '@[A-Z]*@' "${pkgdir}/usr/bin/steam"; then
    error "steam.sh has a placeholder package() does not fill"
    return 1
  fi

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../doc/steam/steam_subscriber_agreement.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 debian/changelog -t "${pkgdir}/usr/share/doc/steam"

  # steamrt64/reaper, which starts every game, is still i386: ValveSoftware/steam-for-linux#13015
  install -Dm 755 "${srcdir}/reaper64" "${pkgdir}${_reaper64}"
  install -Dm 644 "${srcdir}/${_binfmt}.conf" -t "${pkgdir}/usr/lib/binfmt.d"

  # blank steamdeps because apt-get
  ln -sf true "${pkgdir}/usr/bin/steamdeps"
}

# vim: ts=2 sw=2 et:
