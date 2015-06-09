# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Based on PKGBUILD by Aleksey Filippov <sarum9in@gmail.com>
pkgname=grpc-git
_pkgname=${pkgname/-git/}
pkgver=0.9.0.r84.g12bde00
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
conflicts=('grpc')
depends=('openssl' 'protobuf3>=3.0.0_alpha_3')
makedepends=('gtest' 'gflags')
options=(!makeflags)
source=('git+https://github.com/grpc/grpc.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags|sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g;s/^release.//'
}

build() {
  cd $_pkgname
  # Avoid collision with yaourt's environment variable
  env --unset=BUILDDIR make $MAKEFLAGS shared plugins prefix=/usr
}

check() {
  cd $_pkgname
  make test
}

_install_dir() (
  cd "$2"
  find . -type f -exec install "-Dm$1" '{}' "$pkgdir/$3/{}" ';'
  find . -type l -exec cp -a '{}' "$pkgdir/$3/{}" ';'
)

package() {
  cd $_pkgname
  make install prefix="$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
