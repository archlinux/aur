# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
# Contributor: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.12.2
pkgrel=1
pkgdesc="Helm plugin that shows a diff explaining what a helm upgrade would change"
arch=("x86_64")
url="https://github.com/databus23/helm-diff"
license=("Apache-2.0")
install=helm-diff.install
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("905d1e2cd0c7e7aedeea22dd5cc62e02ecdccf6891df3bdc675852bba053d5ec349736f16391334726b81d2f8b29a16e13034a59617715963eb0443fab1b2e93")

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
