pkgname=invoice
pkgdesc='Command line invoice generator'
arch=("any")
url="https://github.com/maaslalani/${pkgname}"
pkgver=0.1.0
pkgrel=1
license=("MIT")
makedepends=("go")
provides=($pkgname)
conflicts=($pkgname)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("f34f20f6491f42c0e94dbde433a578f0dba98938f2e3186018d3e16d050abdaf")
sha512sums=("534350bcfae7226888295e9227582be5c1a5bb64100f9465af74a991d6406466df9305f1a2fe1f64065bb90b458afe3dc8fb925090032ba22d62c16fe4183696")
b2sums=("245d317c82306e70047545b0914e76aa7b69a2e7958387bb0bdbe76d1a77f4e9e873a8a206efec0a0996f614f647c5c918aa871efd301e5b2cfcd4b55b630998")

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "$pkgname" .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
