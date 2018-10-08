# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=proxygen
pkgver=2018.10.08.00
pkgrel=1
pkgdesc="A collection of C++ HTTP libraries including an easy to use HTTP server."
arch=('i686' 'x86_64')
url="https://github.com/facebook/proxygen"
license=('BSD')
depends=('folly' 'fbthrift' 'libcap')
source=("$url/archive/v$pkgver.tar.gz")
makedepends=('autoconf-archive' 'wget' 'ruby' 'gperf' 'gperftools' 'wangle')
conflicts=('proxygen-git')
sha256sums=('0845266d95c7d9709882c13bf13f03b0350277bbcdf304455831106529007d34')

prepare() {
    cd "$pkgname-$pkgver/$pkgname"
    autoreconf -ivf
}

build() {
  cd "$pkgname-$pkgver/$pkgname"
  # ./configure LDFLAGS="-Wl,--no-as-needed -ldl" --prefix=/usr \
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

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -Dm755 httpserver/samples/echo/echo_server $pkgdir/usr/bin/echo_server
  # By default, 'make install' skips 'external' directory
  for i in http_parser_cpp.cpp http_parser.{c,h}; do
    install -Dm644 external/http_parser/$i $pkgdir/usr/include/external/http_parser/$i
  done
}

# vim:set ts=4 sw=4 et:
