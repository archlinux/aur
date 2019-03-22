# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=proxygen
pkgver=2019.03.18.00
pkgrel=1
pkgdesc="A collection of C++ HTTP libraries including an easy to use HTTP server."
arch=('x86_64')
url="https://github.com/facebook/proxygen"
license=('BSD')
depends=('folly' 'fbthrift' 'libcap')
makedepends=('autoconf-archive' 'wget' 'ruby' 'gperf' 'gperftools' 'wangle' 'python' 'unzip')
conflicts=('proxygen-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b697bc6c2d3f564461a597a323272c0473b5ad624925ff5612525dba7d976850')

prepare() {
  cd "$pkgname-$pkgver/$pkgname"
  autoreconf -ivf
}

build() {
  cd "$pkgname-$pkgver/$pkgname"
  ./configure --prefix=/usr \
    --with-sysconfdir=/etc \
    --with-sysroot=/usr \
    --with-gnu-ld=yes
  make
}

check() {
  cd "$pkgname-$pkgver/$pkgname"
  make check
}

package() {
  cd "$pkgname-$pkgver/$pkgname"
  make DESTDIR="$pkgdir/" install

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # By default, 'make install' skips 'external' directory
  for i in http_parser_cpp.cpp http_parser.{c,h}; do
    install -Dm644 external/http_parser/$i $pkgdir/usr/include/external/http_parser/$i
  done
}
