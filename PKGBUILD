# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>

_nanopbver=0.3.7

pkgbase=grpc-dev
_pkgname=grpc
pkgname=('grpc-dev' 'php-grpc-dev')
pkgver=1.1.0_pre1
_pkgprefix=v
_pkgver="$(echo "$pkgver" | tr _ -)"
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
makedepends=('re2c' 'openssl' 'protobuf>=3' 'php')
source=(
    https://github.com/$_pkgname/$_pkgname/archive/$_pkgprefix$_pkgver.tar.gz
    https://github.com/nanopb/nanopb/archive/nanopb-$_nanopbver.tar.gz
)
noextract=("nanopb-$_nanopbver.tar.gz")
md5sums=('d281eeb6dcbd7344a84dbe8572dee363'
         '3b3141b1eaba4feb614314659da2d8f1')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # Patch
  sed -r 's|GetUmbrellaClassName|GetReflectionClassName|g' -i src/compiler/csharp_generator.cc
  sed -r 's|^PROTOBUF_CHECK_CMD = \$\(PKG_CONFIG\) --atleast-version=[^[:space:]]+ protobuf|PROTOBUF_CHECK_CMD = $(PKG_CONFIG) --atleast-version=3.0.0 protobuf|' -i Makefile

  # Nanopb missing
  tar xf "$srcdir/nanopb-$_nanopbver.tar.gz" -C third_party
  rm -rf third_party/nanopb
  mv third_party/"nanopb-nanopb-$_nanopbver" third_party/nanopb
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # Core
  # Avoid collision with yaourt's environment variable
  env --unset=BUILDDIR make $MAKEFLAGS prefix=/usr

  # PHP
  cd "$srcdir/$_pkgname-$_pkgver/src/php/ext/$_pkgname"
  phpize
  LDFLAGS=-L"$srcdir/$_pkgname-$_pkgver/libs/opt" ./configure --enable-grpc="$srcdir/$_pkgname-$_pkgver"
  make $MFLAGS
}

check() {
  true
  # PHP
  cd "$srcdir/$_pkgname-$_pkgver/src/php/ext/$_pkgname"
  yes n | make test # Do not send reports.
  echo # Fix end of line.
}

_install_dir() (
  cd "$2"
  find . -type f -exec install "-Dm$1" '{}' "$pkgdir/$3/{}" ';'
  find . -type l -exec cp -a '{}' "$pkgdir/$3/{}" ';'
)

package_grpc-dev() {
  depends=('openssl' 'protobuf>=3')
  provides=('grpc')
  conflicts=('grpc')

  cd "$srcdir/$_pkgname-$_pkgver"
  _install_dir 755 bins/opt usr/bin
  _install_dir 755 libs/opt usr/lib
  _install_dir 644 include usr/include
  install -Dm644 etc/roots.pem "$pkgdir/usr/share/grpc/roots.pem"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

package_php-grpc-dev() {
  depends=("grpc-dev=${pkgver}-${pkgrel}" 'php')
  provides=('php-grpc')
  conflicts=('php-grpc')

  cd "$srcdir/$_pkgname-$_pkgver/src/php/ext/$_pkgname"
  make install "INSTALL_ROOT=$pkgdir"
  cd "$srcdir/$_pkgname-$_pkgver/src/php"
  # Do we need to install something else? Contributions are welcome.
}
