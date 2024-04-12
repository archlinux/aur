# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=jj-git
pkgver=1.9.2.r3.gab3eb1e
pkgrel=1
pkgdesc="JSON Stream Editor (command line utility)"
arch=('x86_64')
url="https://github.com/tidwall/jj"
license=('MIT')
makedepends=('git' 'go')
provides=('jj')
conflicts=('jj')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X main.version=$pkgver" -o jj cmd/jj/main.go
}

package() {  
  install -Dm755 "$srcdir/$pkgname/jj" "$pkgdir/usr/bin/jj"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
