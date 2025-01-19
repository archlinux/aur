# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
# Contributor: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.9.14
pkgrel=1
pkgdesc="Helm plugin that shows a diff explaining what a helm upgrade would change"
arch=("x86_64")
url="https://github.com/databus23/helm-diff"
license=("Apache-2.0")
install=helm-diff.install
depends=("glibc")
makedepends=("go")
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=("b9595ced7b858a8698f21d911632e4864b3db17eb80b532d5c6484325b63de10d096dd915f6c31f223b1fa8c02a8d39c3284066f49aad1df4e800ebff6b9445b")

prepare() {
  sed -i '/^hooks:$/Q' "$pkgname-$pkgver"/plugin.yaml
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o bin/diff -ldflags "-linkmode=external -X github.com/databus23/helm-diff/cmd.Version=${pkgver}" main.go
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -ldflags "-linkmode=external" ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  # /usr/lib/helm/plugins is my own choice and not a standard. feedback welcome
  install -Dm755 bin/diff -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
}
