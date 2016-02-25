# Maintainer: Aleksey Filippov <sarum9in@gmail.com>

pkgbase=grpc
# PHP is disabled until https://github.com/grpc/grpc/issues/4337 is fixed
#pkgname=('grpc' 'php-grpc')
pkgname=('grpc')
pkgver=0.13.0
_pkgver=$(echo $pkgver | tr . _)
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
makedepends=('re2c' 'openssl' 'protobuf3' 'php')
source=(https://github.com/$pkgname/$pkgname/archive/release-$_pkgver.tar.gz)
md5sums=('f272d55b8ed4368bdc0d76ad27bfc2ad')

build() {
  cd "$srcdir/$pkgname-release-$_pkgver"

  # Patch
  sed -r 's|GetUmbrellaClassName|GetReflectionClassName|g' -i src/compiler/csharp_generator.cc

  # Core
  # Avoid collision with yaourt's environment variable
  env --unset=BUILDDIR make $MAKEFLAGS prefix=/usr

  # PHP
  #cd "$srcdir/$pkgbase-release-$_pkgver/src/php/ext/$pkgbase"
  #phpize
  #LDFLAGS=-L"$srcdir/$pkgname-release-$_pkgver/libs/opt" ./configure --enable-grpc="$srcdir/$pkgname-release-$_pkgver"
  #make $MFLAGS
}

check() {
  true
  # PHP
  #cd "$srcdir/$pkgbase-release-$_pkgver/src/php/ext/$pkgbase"
  #make test
}

_install_dir() (
  cd "$2"
  find . -type f -exec install "-Dm$1" '{}' "$pkgdir/$3/{}" ';'
  find . -type l -exec cp -a '{}' "$pkgdir/$3/{}" ';'
)

package_grpc() {
  depends=('openssl' 'protobuf3')

  cd "$srcdir/$pkgname-release-$_pkgver"
  _install_dir 755 bins/opt usr/bin
  _install_dir 755 libs/opt usr/lib
  _install_dir 644 include usr/include
  install -Dm644 etc/roots.pem "$pkgdir/usr/share/grpc/roots.pem"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_php-grpc() {
  depends=("grpc=${pkgver}-${pkgrel}" 'php')

  cd "$srcdir/$pkgbase-release-$_pkgver/src/php/ext/$pkgbase"
  make install "INSTALL_ROOT=$pkgdir"
  cd "$srcdir/$pkgbase-release-$_pkgver/src/php"
  # Do we need to install something else? Contributions are welcome.
}
