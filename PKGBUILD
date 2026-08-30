# Maintainer:
# Contributor: bigshans <wo199710@hotmail.com>

: ${_install_path:=opt}

_pkgname="logseq-og"
pkgname="$_pkgname-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge management and collaboration"
url="https://github.com/logseq/og"
license=('AGPL-3.0-or-later')
arch=('x86_64' 'aarch64')

provides=("$_pkgname")
conflicts=(
  'logseq'
  'logseq-appimage'
  'logseq-desktop'
  'logseq-desktop-bin'
  'logseq-desktop-electron-bin'
  'logseq-desktop-git'
  'logseq-desktop-nightly-bin'
)

options=('!debug' '!strip')

install="$_pkgname.install"

_pkgsrc="Logseq-OG-linux-x64"
[[ "$CARCH" == "aarch64" ]] && _pkgsrc="Logseq-OG-linux-arm64"

_pkgext="zip"
source_x86_64=("$url/releases/download/$pkgver/Logseq-OG-linux-x64-$pkgver.$_pkgext")
source_aarch64=("$url/releases/download/$pkgver/Logseq-OG-linux-arm64-$pkgver.$_pkgext")

sha256sums_x86_64=('eef58b152b48fbf12630c67c53b0f9083d67b406c2a9005eac5455f9539e1e79')
sha256sums_aarch64=('124761276437d3a838e1bc28a0f2914fc516eedc92813232cf1f39160f0adcae')

# appimage - missing icon
if [[ "${_pkgext::1}" == "A" ]]; then
  source+=("$_pkgname-$pkgver.png"::"$url/raw/$pkgver/resources/icons/logseq.png")
fi

prepare() {
  # appimage - extract
  if [[ "${_pkgext::1}" == "A" ]]; then
    chmod +x "$_pkgsrc-$pkgver.$_pkgext"
    "./$_pkgsrc-$pkgver.$_pkgext" --appimage-extract
    ln -sf "squashfs-root" "$_pkgsrc"
  fi
}

package() {
  depends=(
    alsa-lib
    at-spi2-core
    bash
    cairo
    curl
    dbus
    expat
    glib2
    gtk3
    libcups
    libpulse
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxrandr
    mesa
    nodejs
    nspr
    nss
    pango
    perl
    systemd-libs
    zlib
  )

  if [[ "${_pkgext::1}" == "A" ]]; then
    # appimage - icons
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

    # appimage - remove unneeded
    rm -- "$_pkgsrc/AppRun"
    rm -- "$_pkgsrc/Logseq.desktop"
    rm -- "$_pkgsrc/Logseq.png"
  else
    # zip - icons
    install -Dm644 "$_pkgsrc/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  fi

  # main files
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  cp -a "$_pkgsrc"/* "$pkgdir/$_install_path/$_pkgname/"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Logseq OG
Comment=$pkgdesc
Exec=$_pkgname %u
Icon=$_pkgname
Terminal=false
StartupNotify=true
Categories=Office;
MimeType=x-scheme-handler/logseq;
StartupWMClass=Logseq OG
END

  # script
  local _electron_version=$(strings "$pkgdir/$_install_path/$_pkgname/Logseq-OG" | grep -Pom1 'Electron/[0-9\.]+')
  local _warning_eol="${_electron_version:+Logseq OG uses ${_electron_version}.  To check whether this version of Electron still receives security updates, see https://endoflife.date/electron}"

  printf 'WARNING: %s\n' "${_warning_eol:-see https://endoflife.date/electron}"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash

name=$_pkgname
flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/\${name}-flags.conf"

lines=()
if [[ -f "\${flags_file}" ]]; then
    mapfile -t lines < "\${flags_file}"
fi

flags=()
for line in "\${lines[@]}"; do
  if [[ ! "\${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "\${line}" ]]; then
    flags+=("\${line}")
  fi
done

: \${ELECTRON_IS_DEV:=0}
export ELECTRON_IS_DEV
: \${ELECTRON_FORCE_IS_PACKAGED:=true}
export ELECTRON_FORCE_IS_PACKAGED

printf 'WARNING: %s\n' "${_warning_eol:-see https://endoflife.date/electron}"

exec "/$_install_path/$_pkgname/Logseq-OG" "\${flags[@]}" "\$@"
END

  # permissions
  chmod -R u=rwX,go=rX "$pkgdir"
}
