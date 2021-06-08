# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=time_warrior
pkgver=1.3.2
pkgrel=1
pkgdesc="A CLI-based time tracking tool"
arch=(x86_64)
url=https://github.com/mrcook/time_warrior
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(https://github.com/mrcook/time_warrior/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a8b80082d62f464edc21f00faa98fa4a917f85e0b0878898a2f87ccddc2e971c')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="${srcdir}/gopath"
  go mod vendor
}

build() {
  cd $pkgname-$pkgver

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"

  export GOPATH="${srcdir}/gopath"

  go build -o tw/tw -trimpath -buildmode=pie -mod=readonly \
    -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" tw/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 tw/tw "$pkgdir/usr/bin/tw"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
