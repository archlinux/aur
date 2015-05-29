# Maintainer: Aleksey Filippov <sarum9in@gmail.com>

pkgname=grpc
pkgver=0.9.0
_pkgver=$(echo $pkgver | tr . _)
pkgrel=2
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first."
arch=('i686' 'x86_64')
url='http://www.grpc.io/'
license=('BSD')
depends=('openssl' 'protobuf3')
source=(https://github.com/$pkgname/$pkgname/archive/release-$_pkgver.tar.gz)
md5sums=('e500db71cb1f114c4a15a5d6d141df7a')

build() {
  cd $pkgname-release-$_pkgver
  # Avoid collision with yaourt's environment variable
  env --unset=BUILDDIR make $MAKEFLAGS prefix=/usr
}

_install_dir() (
  cd "$2"
  find . -type f -exec install "-Dm$1" '{}' "$pkgdir/$3/{}" ';'
  find . -type l -exec cp -a '{}' "$pkgdir/$3/{}" ';'
)

package() {
  cd $pkgname-release-$_pkgver
  _install_dir 755 bins/opt usr/bin
  _install_dir 755 libs/opt usr/lib
  _install_dir 644 include usr/include
  install -Dm644 etc/roots.pem "$pkgdir/usr/share/grpc/roots.pem"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
