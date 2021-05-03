# Maintainer: aksr <aksr at t-com dot me>
pkgname=edwood-git
pkgver=v0.2.0.r81.g70e9289
pkgrel=1
pkgdesc="Go version of Plan9 Acme Editor "
arch=('i686' 'x86_64')
url="https://github.com/rjkroege/edwood"
license=('BSD 3-Clause')
depends=('plan9port')
makedepends=('git' 'go')
provides=()
conflicts=("${pkgname%-*}")
source=(git+$url)
_gourl=github.com/rjkroege/edwood

pkgver() {
   cd edwood
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir edwood/go-build
  cd edwood
 export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o go-build .
}

#check() {
#  GOPATH="$srcdir" go test -v -x ${_gourl}
#}

package() {
  cd "$srcdir/edwood"
  install -Dm755 go-build/edwood "$pkgdir/usr/bin/edwood"
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

sha256sums=('SKIP')
