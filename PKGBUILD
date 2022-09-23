# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: Magnus Bjerke Vik <mbvett@gmail.com>
pkgname=docker-credential-pass
pkgver=0.7.0
pkgrel=1
pkgdesc="program to use pass to keep Docker credentials safe"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('pass')
makedepends=('go')
_gourl="github.com/docker/docker-credential-helpers"
source=("docker-credential-helpers-$pkgver.tar.gz::https://$_gourl/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('99e7ad4eb5868b98ad27eb379d7bcd346850ec9f794bf1a218a217f19247f096e301bad2d320c99cad463049edef31086be3198ace98a9969e5aa956244513f2')
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
  install -D -m 0755 bin/build/docker-credential-pass "$pkgdir/usr/bin/docker-credential-pass"
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
