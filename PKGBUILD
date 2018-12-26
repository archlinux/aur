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
pkgname=('grpc' 'php-grpc' 'grpc-cli')
pkgver=1.17.2
_gtestver=1.8.0
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
makedepends=('re2c' 'protobuf>=3' 'php' 'c-ares' 'openssl-1.0'
             'chrpath' 'gflags'
)
source=(
    https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz
    https://github.com/google/googletest/archive/release-$_gtestver.tar.gz
)
noextract=()
md5sums=('346ecc9a9162664f7f50aadcdb4eac8e'
         '16877098823401d1bf2ed7891d7dce36')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # We are not interested in being strict here
  # regardless of warning type.
  sed -r 's|-Werror||g' -i Makefile

  # Put googletest
  ln -sf "$srcdir/googletest-release-$_gtestver/"{googlemock,googletest} \
      third_party/googletest
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # gRPC is not compatible yet with openssl-1.1
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig

  # Core
  # Avoid collision with yaourt's environment variable
  env --unset=BUILDDIR make $MAKEFLAGS prefix=/usr

  # grpc_cli
  env --unset=BUILDDIR make $MAKEFLAGS prefix=/usr grpc_cli
  # Don't install it as part of main package
  mv bins/opt/grpc_cli .

  # PHP
  cd "$srcdir/$pkgbase-$pkgver/src/php/ext/$pkgbase"
  phpize
  LDFLAGS=-L"$srcdir/$pkgname-$pkgver/libs/opt" ./configure --enable-grpc="$srcdir/$pkgname-$pkgver"
  make $MFLAGS
}

check() {
  # PHP
  cd "$srcdir/$pkgbase-$pkgver/src/php/ext/$pkgbase"
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

  cd "$srcdir/$pkgname-$pkgver"
  _install_dir 755 bins/opt usr/bin
  _install_dir 755 libs/opt usr/lib
  chmod 644 "$pkgdir/usr/lib/"*.a
  _install_dir 644 include usr/include
  install -Dm644 etc/roots.pem "$pkgdir/usr/share/grpc/roots.pem"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_php-grpc() {
  depends=("grpc=${pkgver}-${pkgrel}" 'php')

  # Install PHP extension.
  cd "$srcdir/$pkgbase-$pkgver/src/php/ext/$pkgbase"
  make install "INSTALL_ROOT=$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Fix wrong RPATH.
  chrpath -r '/usr/lib' "$pkgdir/usr/lib/php/modules/grpc.so"
  # Do we need to install something else? Contributions are welcome.
  cd "$srcdir/$pkgbase-$pkgver/src/php"
}

package_grpc-cli() {
  depends=('c-ares' 'gflags' 'protobuf>=3' 'openssl-1.0')

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 grpc_cli "$pkgdir"/usr/bin/grpc_cli
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
