# Maintainer: charles940316 <charles940316@gmail.com>
#
# Repackages the official EUSOFT "德语助手 / Eudic German Helper" (dehelper) .deb
# for Arch Linux. The upstream binary is a self-contained Qt5 WebEngine bundle:
# it ships its own Qt5, GTK3, GStreamer, etc. under /usr/share/eusoft-dehelper,
# so only the base system libraries below need to come from Arch.

pkgname=dehelper-bin
pkgver=13.5.2
pkgrel=1
pkgdesc="德语助手 (Eudic German Helper) by EUSOFT — self-contained repackage of the official .deb (bundles its own Qt, no compilation)"
arch=('x86_64')
url="https://www.eudic.net"
license=('custom:Proprietary')
provides=('dehelper' 'eusoft-dehelper')
conflicts=('dehelper' 'eusoft-dehelper')

# Real runtime dependencies, derived from the ELF NEEDED entries of the main
# binary and every bundled .so (after subtracting what the bundle already ships).
depends=(
  'glibc'           # libc/libm/libdl/libpthread/libresolv/librt/libmvec/ld-linux
  'gcc-libs'        # libstdc++ libgcc_s
  'nss'             # libnss3 libnssutil3 (Qt WebEngine / Chromium)
  'alsa-lib'        # libasound
  'libdrm'          # libdrm
  'libglvnd'        # libGL libEGL
  'mesa'            # libgbm
  'expat'           # libexpat
  'fontconfig'      # libfontconfig
  'freetype2'       # libfreetype
  'harfbuzz'        # libharfbuzz
  'libthai'         # libthai
  'gmp'             # libgmp
  'libgpg-error'    # libgpg-error
  'p11-kit'         # libp11-kit
  'e2fsprogs'       # libcom_err
  'util-linux-libs' # libuuid
  'libx11'          # libX11
  'libxcb'          # libxcb libxcb-dri3
  'zlib'            # libz
)

optdepends=(
  'xdg-utils: open external links in the system browser'
  'jack2: JACK audio output via the bundled GStreamer plugin'
  'pulseaudio: PulseAudio audio output'
  'libsecret: store credentials in the system keyring'
  'libnotify: desktop notifications'
)

# Official .deb from EUSOFT's CDN. The query string pins the upstream build
# date; bump it (and the sha256 below) together with pkgver on each update.
source=("dehelper-${pkgver}.deb::https://static.frdic.com/pkg/dehelper.deb?v=2026-04-09")
noextract=("dehelper-${pkgver}.deb")
sha256sums=('fc47e56b3907522a8d3dbd906a4e4117991e0aed772c08547b0214c8b08fcccc')

package() {
  cd "$srcdir"

  # A .deb is an 'ar' archive containing data.tar.xz; bsdtar (libarchive,
  # pulled in by makepkg) can read the ar wrapper directly.
  bsdtar -xOf "dehelper-${pkgver}.deb" data.tar.xz | bsdtar -xpf - -C "$pkgdir"

  # The shipped /usr/bin is empty — add a launcher symlink so the app can be
  # started from a terminal as `dehelper`.
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/share/eusoft-dehelper/AppRun "$pkgdir/usr/bin/dehelper"

  # Upstream's .desktop has only a Chinese Name and no keywords, so KRunner /
  # app launchers can't find it by its Latin name. Show "dehelper" by default
  # (keeping the Chinese name under zh_CN) and add GenericName + Keywords so
  # "dehelper", "eudic", "german", etc. all match.
  local desktop="$pkgdir/usr/share/applications/eusoft-dehelper.desktop"
  sed -i -e '/^Comment=/d' -e 's/^Name=.*/Name=dehelper/' "$desktop"
  cat >> "$desktop" <<'EOF'
Name[zh_CN]=德语助手
GenericName=German Dictionary
GenericName[zh_CN]=德语词典
Comment=German Helper (dehelper) by EUSOFT
Comment[zh_CN]=德语助手
Keywords=dehelper;eusoft;german;deutsch;dictionary;dict;词典;德语;德语助手;
EOF
}
