# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: Magnus Bjerke Vik <mbvett@gmail.com>
pkgname=docker-credential-pass
pkgver=0.6.4
pkgrel=1
pkgdesc="program to use pass to keep Docker credentials safe"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('pass')
makedepends=('go')
_gourl="github.com/docker/docker-credential-helpers"
source=("docker-credential-helpers-$pkgver.tar.gz::https://$_gourl/archive/v$pkgver.tar.gz")
sha512sums=('4e8c97c529e18e700aef77ba0ebfb1d432ca8f96bd0efddc0336e9fca5a5f8e98cb058dfaaee289dc4515dcf48d26d54df86120ce94648a8d87b291a14bae0d5')
noextract=("docker-credential-helpers-$pkgver.tar.gz")
install=$pkgname.install

prepare() {
  mkdir -p "$srcdir/src/$_gourl"
  tar -x --strip-components=1 -C "$srcdir/src/$_gourl" -f "$srcdir/docker-credential-helpers-$pkgver.tar.gz"
}

build() {
  cd "$srcdir/src/$_gourl"
  GO111MODULE=off GOPATH="$srcdir" go install -v -x ./credentials
  GO111MODULE=off GOPATH="$srcdir" make pass
}

package() {
  cd "$srcdir/src/$_gourl"
  install -D -m 0755 bin/docker-credential-pass "$pkgdir/usr/bin/docker-credential-pass"
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
