# Maintainer: Ber Zoidberg <{firstname}.{lastname}@gmail.com>

pkgname=wlr-gamma-service-git
pkgver=r9.d1654d1
pkgrel=1
pkgdesc='Adjust the brightness and color temperature of wlroots-based compositors such as sway.'
arch=('x86_64')
license=('MIT')
url='https://github.com/berzoidberg/wlr-gamma-service'
depends=('glib2' 'wayland' 'wlroots')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/berzoidberg/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make INSTALL_PATH="$pkgdir/usr" install
  install -Dm644 res/wlr-gamma-service.service "$pkgdir/usr/lib/systemd/user/wlr-gamma-service.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
