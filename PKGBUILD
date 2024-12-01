# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
# Contributor: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.9.12
pkgrel=1
pkgdesc="Helm plugin that shows a diff explaining what a helm upgrade would change"
arch=("x86_64")
url="https://github.com/databus23/helm-diff"
license=("Apache-2.0")
install=helm-diff.install
depends=("glibc")
makedepends=("go")
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=("af417191ad1d580b6ae0d919bd82380024c64d39c1eb6100e4da0769b21a3f6986496dadf709b1cfeb85d5617291f7da01d8955134e3a310e673aafe3bb09e20")

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
