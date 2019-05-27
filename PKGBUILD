# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=wlr-brightness-git
pkgver=r5.b498003
pkgrel=1
pkgdesc='Adjust the brightness of wlroots-based compositors such as sway.'
arch=('x86_64')
license=('MIT')
url='https://github.com/mherzberg/wlr-brightness'
depends=('glib2' 'wayland' 'wlroots')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/mherzberg/${pkgname%-git}.git")
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
  install -Dm644 res/wlr-brightness.service "$pkgdir/usr/lib/systemd/user/wlr-brightness.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
