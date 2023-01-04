# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Kevin Morris <kevr at 0cost dot org>
pkgname=system76-kbd-led-git
pkgver=0.1.r14.gba5bbd7
pkgrel=1
pkgdesc="System76 keyboard backlight LED controller."
arch=('x86_64')
url="https://github.com/kevr/system76-kbd-led"
license=('MIT')
depends=('boost-libs' 'system76-dkms')
makedepends=('git' 'boost' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/kevr/system76-kbd-led.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DPKG_VERSION="$pkgver" \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install

  cd "$srcdir/${pkgname%-git}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
