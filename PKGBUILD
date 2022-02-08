# Maintainer: ml <>
pkgname=helm-2to3
pkgver=0.10.0
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
sha256sums=('d4fc4dfcccc8c4b02ebb49dcb16eb20167d405675c63495aa6aa34ed6fa05b2e')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '/^hooks:$/Q' plugin.yaml
  go mod edit \
    -dropreplace gotest.tools \
    -dropreplace github.com/Azure/go-autorest \
    -dropreplace github.com/docker/distribution
  go mod tidy
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -ldflags="-linkmode=external -X=main.version=$pkgver" -o bin/2to3
}

# check(): 2to3 has no tests

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/2to3 -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 {completion,plugin}.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
}
