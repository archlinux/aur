# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu-git
pkgver=3.0.0.r14.gd54ff1e
pkgrel=1
epoch=1
pkgdesc="ncurses interface for QEMU"
arch=('i686' 'x86_64')
url="https://github.com/nemuTUI/nemu"
license=('custom:BSD')
depends=('sqlite' 'json-c' 'systemd-libs' 'libusb' 'libarchive' 'libxml2' 'qemu-headless')
makedepends=('git')
optdepends=('tigervnc: for vncviewer' 'virt-viewer: for remote-viewer')
provides=('nemu')
conflicts=('nemu')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe | tr -d v |sed 's+-+.r+' | tr - .
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
  mv "$pkgdir"/usr/local/* "$pkgdir"/usr
  rmdir "$pkgdir"/usr/local
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
