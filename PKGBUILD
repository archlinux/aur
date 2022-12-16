# Maintainer: Donn <me@donn.website>
pkgname=cemu-bin
pkgver=2.0
pkgrel=22
pkgdesc="Nintendo Wii U Emulator"
arch=('x86_64')
url="https://cemu.info"
license=('MPL-2.0')
groups=()
depends=(
  'pugixml'
  'pulseaudio'
  'opengl-driver'
  'vulkan-driver'
  'icu'
  'gtk3'
  'graphite'
  'pcre'
  'systemd'
  'libffi'
)
makedepends=(
  'patchelf'
)
provides=('cemu')
conflicts=('cemu' 'cemu-git')
options=(!strip !docs libtool emptydirs)
install=
changelog=
source=(
  "https://github.com/cemu-project/Cemu/releases/download/v${pkgver}-${pkgrel}/cemu-${pkgver}-${pkgrel}-ubuntu-20.04-x64.zip"
  "info.cemu.Cemu.desktop"
  "info.cemu.Cemu.metainfo.xml"
  "info.cemu.Cemu.png"
)
noextract=()
sha256sums=(
  '1a7d06c3fc96827d6be4d87b83b8bcd6cc1c6dca1e88fcd5312a9367e0b92617'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  CEMU_BIN_PATH="$srcdir/Cemu_${pkgver}-${pkgrel}/Cemu"

  # Patch
  patchelf --replace-needed libpcre.so.3 libpcre.so $CEMU_BIN_PATH
  patchelf --replace-needed libffi.so.7 libffi.so $CEMU_BIN_PATH

  patchelf --replace-needed libicuuc.so.71 libicuuc.so $CEMU_BIN_PATH
  patchelf --replace-needed libicui18n.so.71 libicui18n.so $CEMU_BIN_PATH
  patchelf --replace-needed libicudata.so.71 libicudata.so $CEMU_BIN_PATH

  patchelf --remove-needed libsepol.so.1 $CEMU_BIN_PATH
  patchelf --remove-needed libselinux.so.1 $CEMU_BIN_PATH

  # Chmod
  chmod +x $CEMU_BIN_PATH

  mkdir -p "$pkgdir/usr/share/cemu"
  cp -r "$srcdir/Cemu_${pkgver}-${pkgrel}"/* "$pkgdir/usr/share/cemu"

  install -Dm644 -t "$pkgdir"/usr/share/applications info.cemu.Cemu.desktop
  install -Dm644 -t "$pkgdir"/usr/share/metainfo info.cemu.Cemu.metainfo.xml
  install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/128x128/apps info.cemu.Cemu.png
}