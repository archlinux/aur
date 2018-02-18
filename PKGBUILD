# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu-git
pkgver=1.4.0r825.1e73a64
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=('i686' 'x86_64')
url="https://bitbucket.org/PascalRD/nemu"
license=('custom:BSD')
groups=()
depends=('qemu' 'glibc' 'ncurses' 'sqlite' 'udev' 'libusb' 'libarchive')
makedepends=('git')
provides=('nemu')
conflicts=('nemu')
source=("git+https://bitbucket.org/PascalRD/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%sr%s.%s" $(git describe | tr -d v) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname%-git}"
  [[ -d build ]] || mkdir build
  cd build
  cmake ../
  make
}

package() {
  cd "${pkgname%-git}"/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
