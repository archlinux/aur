# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
# Contributor: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.12.5
pkgrel=1
pkgdesc="Helm plugin that shows a diff explaining what a helm upgrade would change"
arch=("x86_64")
url="https://github.com/databus23/helm-diff"
license=("Apache-2.0")
install=helm-diff.install
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("6c4d272b9611796b0296065d932a386440d760d6abbd2d8e3908f716ed7466e48b5298e344ff196d305f6683b3198719bc9370d3797afd402a3cbb78cdd4879b")

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
