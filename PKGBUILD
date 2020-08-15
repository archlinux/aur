# Maintainer: ml <ml@visu.li>
pkgname=helm-diff
pkgver=3.1.3
pkgrel=2
pkgdesc='Helm plugin that shows a diff explaining what a helm upgrade would change'
arch=('x86_64')
url='https://github.com/databus23/helm-diff'
license=('Apache')
install=helm-diff.install
depends=('helm')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('db5be9cfb14c811a0145900ab995586821625090c28180900e0e49f51d65778f')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
  sed -i '/^hooks:$/Q' plugin.yaml
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  go build -o bin/diff -ldflags "-linkmode=external -X github.com/databus23/helm-diff/cmd.Version=${pkgver}"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  # /usr/lib/helm/plugins is my own choice and not a standard. feedback welcome
  install -Dm755 bin/diff -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
}
