# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
# Contributor: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.15.11
pkgrel=1
pkgdesc="Helm plugin that shows a diff explaining what a helm upgrade would change"
arch=("x86_64")
url="https://github.com/databus23/helm-diff"
license=("Apache-2.0")
install=helm-diff.install
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("d0d7449d7f788ed4c75a3f9c8211112e6796a6b0e23ec373ef410e1ee0ef9256646a1cce4cf8b869e91824bf06e274c3b5ec94077e33d0a19f4d1bbc7b11ef49")

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
