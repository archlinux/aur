# Maintainer: Aleksey Filippov <sarum9in@gmail.com>

_nanopbver=0.3.6

pkgbase=grpc
# PHP is disabled until https://github.com/grpc/grpc/issues/4337 is fixed
#pkgname=('grpc' 'php-grpc')
pkgname=('grpc')
pkgver=0.15.2
#_pkgver=release-$(echo $pkgver | tr . _)
_pkgprefix=v
_pkgver=$pkgver
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
makedepends=('re2c' 'openssl' 'protobuf3' 'php')
source=(
    https://github.com/$pkgname/$pkgname/archive/$_pkgprefix$_pkgver.tar.gz
    https://github.com/nanopb/nanopb/archive/nanopb-$_nanopbver.tar.gz
)
noextract=("nanopb-$_nanopbver.tar.gz")
md5sums=('a78e72e0ba0fd516be0ea4bbd17e7e31'
         '91457d973b48e3e71f4cbcee7761cdb1')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"

  # Patch
  sed -r 's|GetUmbrellaClassName|GetReflectionClassName|g' -i src/compiler/csharp_generator.cc
  sed -r 's|^PROTOBUF_CHECK_CMD = \$\(PKG_CONFIG\) --atleast-version=[^[:space:]]+ protobuf|PROTOBUF_CHECK_CMD = $(PKG_CONFIG) --atleast-version=3.0.0 protobuf|' -i Makefile

  # Nanopb missing
  tar xf "$srcdir/nanopb-$_nanopbver.tar.gz" -C third_party
  rm -rf third_party/nanopb
  mv third_party/"nanopb-nanopb-$_nanopbver" third_party/nanopb
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  # Core
  # Avoid collision with yaourt's environment variable
  env --unset=BUILDDIR make $MAKEFLAGS prefix=/usr

  # PHP
  #cd "$srcdir/$pkgbase-$_pkgver/src/php/ext/$pkgbase"
  #phpize
  #LDFLAGS=-L"$srcdir/$pkgname-$_pkgver/libs/opt" ./configure --enable-grpc="$srcdir/$pkgname-$_pkgver"
  #make $MFLAGS
}

check() {
  true
  # PHP
  #cd "$srcdir/$pkgbase-$_pkgver/src/php/ext/$pkgbase"
  #make test
}

_install_dir() (
  cd "$2"
  find . -type f -exec install "-Dm$1" '{}' "$pkgdir/$3/{}" ';'
  find . -type l -exec cp -a '{}' "$pkgdir/$3/{}" ';'
)

package_grpc() {
  depends=('openssl' 'protobuf3')

  cd "$srcdir/$pkgname-$_pkgver"
  _install_dir 755 bins/opt usr/bin
  _install_dir 755 libs/opt usr/lib
  _install_dir 644 include usr/include
  install -Dm644 etc/roots.pem "$pkgdir/usr/share/grpc/roots.pem"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_php-grpc() {
  depends=("grpc=${pkgver}-${pkgrel}" 'php')

  cd "$srcdir/$pkgbase-$_pkgver/src/php/ext/$pkgbase"
  make install "INSTALL_ROOT=$pkgdir"
  cd "$srcdir/$pkgbase-$_pkgver/src/php"
  # Do we need to install something else? Contributions are welcome.
}
