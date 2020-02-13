# Maintainer: Ashymad <ashymad@posteo.net>

pkgname=hantek6022api-git
pkgver=r196.0dc39ab
pkgrel=1
pkgdesc="Hantek 6022BE Python API"
arch=('any')
url="https://github.com/Ho-Ro/Hantek6022API"
source=("$pkgname::git+$url.git")
provides=("${pkgname%-git}")
license=('GPL2')
depends=('python' 'python-libusb1')
makedepends=('python-setuptools' 'sdcc' 'git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package () {
  cd "$srcdir/$pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 60-hantek-6022-usb.rules $pkgdir/etc/udev/rules.d/60-hantek-6022-usb.rules
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
