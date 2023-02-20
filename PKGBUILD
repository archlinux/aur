# Maintainer: Donn <me@donn.website>
pkgname=cemu-bin
pkgver=2.0.25
pkgrel=1
pkgdesc="Nintendo Wii U Emulator"
arch=('x86_64')
url="https://cemu.info"
license=('MPL2')
depends=('glu' 'graphite' 'gtk3' 'libice' 'libsm' 'pcre' 'vulkan-driver')
makedepends=('patchelf')
provides=('cemu')
conflicts=('cemu' 'cemu-git')
options=(!strip !docs libtool emptydirs)
source=("https://github.com/cemu-project/Cemu/releases/download/v${pkgver%.*}-${pkgver##*.}/cemu-${pkgver%.*}-${pkgver##*.}-ubuntu-20.04-x64.zip"
        "cemu.desktop::https://raw.githubusercontent.com/cemu-project/Cemu/main/dist/linux/info.cemu.Cemu.desktop"
        "cemu.png::https://github.com/cemu-project/Cemu/raw/main/dist/linux/info.cemu.Cemu.png"
)
sha256sums=('c1f4c7438752c876bb6cadaf74bee1c783edad41ebd2402bed2c0fb046240bb6'
            '3e9380eb47646fede56c0de59ddab872627c00629820ef5f974be0d07e4f3490'
            '6458a99b8bd54e44857efa0f82bfd6035e7e072e7e080e3330e4e2cfe89cbd33')

package() {
  CEMU_BIN_PATH="$srcdir/Cemu_${pkgver%.*}-${pkgver##*.}/Cemu"

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
  cp -r "$srcdir/Cemu_${pkgver%.*}-${pkgver##*.}"/* "$pkgdir/usr/share/cemu"

  install -Dm644 -t "$pkgdir"/usr/share/applications cemu.desktop
  install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/128x128/apps cemu.png
}
