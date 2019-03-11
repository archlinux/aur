# Maintainer: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.6.1
pkgrel=1
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('go')
_gourl="github.com/docker/docker-credential-helpers"
source=("docker-credential-helpers-$pkgver.tar.gz::https://$_gourl/archive/v$pkgver.tar.gz")
sha512sums=('57d7d8039c980974a568be2f4b557227ab2df0dbb48e9ba4f4729826a9d96604170dc8782e4b9baca06337be254ecb118c51911ffd6812e7d01895561e78abd2')
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

