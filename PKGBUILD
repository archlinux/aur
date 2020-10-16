# Maintainer: ml <ml@visu.li>
pkgname=helm-push
pkgver=0.9.0
pkgrel=1
pkgdesc='Helm plugin to pushing charts to chartmuseum'
arch=('x86_64')
url='https://github.com/chartmuseum/helm-push'
license=('Apache')
install=helm-push.install
depends=('helm')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6c87d6bb2685b05182e380e81d5317a53263d2422c3bb7157397511ff4f659c9')

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
  go build -o bin/helmpush -ldflags "-linkmode=external" ./cmd/helmpush
}
# check(): Go tests require special test environment

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/helmpush -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
}
