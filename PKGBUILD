# Maintainer: ml <mlævisu.li>
pkgname=helm-2to3
pkgver=0.8.2
pkgrel=1
pkgdesc='Migrates and cleans up Helm v2 configuration and releases in-place to Helm v3'
arch=('x86_64' 'aarch64')
url='https://github.com/helm/helm-2to3'
license=('Apache')
install=helm-2to3.install
depends=('helm')
makedepends=('go')
groups=('helm-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('19106d88802f2c73d8b4f49c1f718f2dd95fdedf1697af8d09448bd94ec38455')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod edit \
    -dropreplace gotest.tools \
    -dropreplace github.com/Azure/go-autorest \
    -dropreplace github.com/docker/distribution
  go mod tidy
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
  go build -ldflags="-linkmode=external -X=main.version=$pkgver" -o bin/2to3
}

# check(): 2to3 has no tests

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/2to3 -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 {completion,plugin}.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
}
