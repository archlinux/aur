# Copyright 2015 Aleksey Filippov

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Victor Aurélio Santos <victoraur.santos@gmail.com>

pkgbase=grpc
pkgname=('grpc' 'php-grpc')
pkgver=1.4.2
#_pkgver=release-$(echo $pkgver | tr . _)
_pkgprefix=v
_pkgver="$(echo "$pkgver" | tr _ -)"
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
makedepends=('re2c' 'openssl-1.0' 'protobuf>=3' 'php' 'c-ares'
             'chrpath'
)
source=(
    https://github.com/$pkgname/$pkgname/archive/$_pkgprefix$_pkgver.tar.gz
)
noextract=("nanopb-$_nanopbver.tar.gz")
md5sums=('de84c023389b7c36025f4bd0703c5a1e')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"

  # We are not interested in being strict here
  # regardless of warning type.
  sed -r 's|-Werror||g' -i Makefile
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  # gRPC is not compatible yet with openssl-1.1
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig

  # Core
  # Avoid collision with yaourt's environment variable
  env --unset=BUILDDIR make $MAKEFLAGS prefix=/usr

  # PHP
  cd "$srcdir/$pkgbase-$_pkgver/src/php/ext/$pkgbase"
  phpize
  LDFLAGS=-L"$srcdir/$pkgname-$_pkgver/libs/opt" ./configure --enable-grpc="$srcdir/$pkgname-$_pkgver"
  make $MFLAGS
}

check() {
  true
  # PHP
  cd "$srcdir/$pkgbase-$_pkgver/src/php/ext/$pkgbase"
  yes n | make test # Do not send reports.
  echo # Fix end of line.
}

_install_dir() (
  cd "$2"
  find . -type f -exec install "-Dm$1" '{}' "$pkgdir/$3/{}" ';'
  find . -type l -exec cp -a '{}' "$pkgdir/$3/{}" ';'
)

package_grpc() {
  depends=('c-ares' 'openssl-1.0' 'protobuf>=3')

  cd "$srcdir/$pkgname-$_pkgver"
  _install_dir 755 bins/opt usr/bin
  _install_dir 755 libs/opt usr/lib
  _install_dir 644 include usr/include
  install -Dm644 etc/roots.pem "$pkgdir/usr/share/grpc/roots.pem"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_php-grpc() {
  depends=("grpc=${pkgver}-${pkgrel}" 'php')

  # Install PHP extension.
  cd "$srcdir/$pkgbase-$_pkgver/src/php/ext/$pkgbase"
  make install "INSTALL_ROOT=$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Fix wrong RPATH.
  chrpath -r '/usr/lib' "$pkgdir/usr/lib/php/modules/grpc.so"
  # Do we need to install something else? Contributions are welcome.
  cd "$srcdir/$pkgbase-$_pkgver/src/php"
}
