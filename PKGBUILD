# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: Magnus Bjerke Vik <mbvett@gmail.com>
pkgname=docker-credential-pass
pkgver=0.8.0
pkgrel=1
pkgdesc="program to use pass to keep Docker credentials safe"
arch=(x86_64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('pass')
makedepends=('go')
_gourl="github.com/docker/docker-credential-helpers"
source=("docker-credential-helpers-$pkgver.tar.gz::https://$_gourl/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('c8d52b05744d4bd5f0e4f8fab3eb382315013b8b7ae11a4b54e25bfb7fbf05a056f2725d7a3e0df8f06823bdccb7a76f8958c388a6fd65ebd11ce5cb76f13e0e')
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
