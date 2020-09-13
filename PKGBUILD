# Maintainer: Hao Long <aur@esd.cc>

pkgname=terminal-to-html
pkgver=3.4.0
pkgrel=1
pkgdesc="Converts arbitrary shell output (with ANSI) into beautifully rendered HTML"
arch=("x86_64" "i686")
url="https://github.com/buildkite/terminal-to-html"
license=('MIT')
provides=('terminal-to-html')
conflicts=('terminal-to-html')
depends=('glibc')
makedepends=('go' 'go-bindata')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('bd6584245c1224d139e9a5b57e9326bbd68b0961dad85374cdbe5ad36fd70356'
            'ad8a919cd390f9475ed22addad10d283539f5b9afec268b03427c667e60b9ae5')

build() {
  cd ${pkgname}-${pkgver}
  go-bindata -o ./cmd/bindata.go assets/
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/${pkgname}
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
