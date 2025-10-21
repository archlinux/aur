# Maintainer: syhanjin <syhanjin666@gmail.com>

pkgname=vesc_tool-git
epoch=1
pkgver=r1690.8a6de0dd
pkgrel=1
pkgdesc="VESC ESC graphical configuration tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://vesc-project.com/vesc_tool"
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-connectivity' 'qt5-serialport' 'qt5-location' 'qt5-gamepad' 'xdg-utils' 'qt5-declarative' 'glibc')
makedepends=('git' 'mold')
conflicts=('vesc-tool')
source=("$pkgname"::"git+https://github.com/vedderb/vesc_tool.git"
        'vesc-tool.desktop')
sha256sums=('SKIP'
            'a0d31826279e900ab614744afad1a26b849440c298d8a5e6e318df554beebdde')
options=(!debug)
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${srcdir}/${pkgname}"
  qmake -config release "CONFIG += release_lin build_original exclude_fw"
  make -j$(nproc)
}
package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 build/lin/vesc_tool* "$pkgdir/usr/bin/vesc-tool"
  install -Dm644 ../vesc-tool.desktop \
    "$pkgdir/usr/share/applications/vesc-tool.desktop"
  install -Dm644 'res/+theme_light/icons/v_icon-256.png' \
    "$pkgdir/usr/share/icons/vesc-tool.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
