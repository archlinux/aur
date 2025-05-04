# Maintainer: Ian Young <ian at iangreenleaf dot com>
# Contributor: Gunnar Bretthauer <taijian@posteo.de>

pkgname=duplicacy
pkgver=3.2.5
pkgrel=1
pkgdesc="A new generation cloud backup tool based on lock-free deduplication"
arch=('x86_64' 'i686')
url="https://duplicacy.com/"
license=('custom')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gilbertchen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e289409b884d0c20f5b2e8b2fec64a019534fd394167346a3677ba785809b4c')

export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
prepare() {
 cd "$pkgname-$pkgver/$pkgname"

 mkdir -p "src/github.com/gilbertchen"
 ln -sf "$srcdir/$pkgname-$pkgver" "src/github.com/gilbertchen/$pkgname"

 GOPATH="$srcdir/$pkgname-$pkgver/$pkgname" go get -d -v
}

build() {
  cd "$pkgname-$pkgver/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  GOPATH="$srcdir/$pkgname-$pkgver/$pkgname" go build -x
}

check() {
  cd "$pkgname-$pkgver/$pkgname"

  GOPATH="$srcdir/$pkgname-$pkgver/$pkgname" go test -v -x
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
