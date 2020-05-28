# Maintainer: ml <ml@visu.li>
pkgname=helm-push
pkgver=0.8.1
pkgrel=2
pkgdesc='Helm plugin to pushing charts to chartmuseum'
arch=('x86_64')
url='https://github.com/chartmuseum/helm-push'
license=('Apache')
install=helm-push.install
depends=('helm')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5aaf1941d004000dd7a83b24e3fc9e7a93e64f4fa2e108af824d3b81b7d68b46')

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
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o bin/helmpush ./cmd/helmpush
}
# check(): Go tests require special test environment

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/helmpush -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
}
