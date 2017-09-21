# Maintainer: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.6.0
pkgrel=1
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('go')
_gourl="github.com/docker/docker-credential-helpers"
source=("docker-credential-helpers-$pkgver.tar.gz::https://$_gourl/archive/v$pkgver.tar.gz")
sha512sums=('359e8ec700f423ce0687f13ce02946007f90456abe86659a87c59419ebde5e79adb4d28ee5e6a9762a44cfd65648c247629a5273326abf18a8880bee637e74d8')
noextract=("docker-credential-helpers-$pkgver.tar.gz")
install=$pkgname.install

prepare() {
  mkdir -p "$srcdir/src/$_gourl"
  tar -x --strip-components=1 -C "$srcdir/src/$_gourl" -f "$srcdir/docker-credential-helpers-$pkgver.tar.gz"
}

build() {
  cd "$srcdir/src/$_gourl"
  GOPATH="$srcdir" go install -v -x ./credentials
  GOPATH="$srcdir" make secretservice
}

package() {
  cd "$srcdir/src/$_gourl"
  install -D -m 0755 bin/docker-credential-secretservice "$pkgdir/usr/bin/docker-credential-secretservice"
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:

