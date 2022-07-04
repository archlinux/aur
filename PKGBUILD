# Maintainer: ml <>
pkgname=helm-2to3
pkgver=0.10.1
pkgrel=1
pkgdesc='Migrates and cleans up Helm v2 configuration and releases in-place to Helm v3'
arch=('x86_64' 'aarch64')
url='https://github.com/helm/helm-2to3'
license=('Apache')
install=helm-2to3.install
depends=('kubectl')
makedepends=('go')
groups=('helm-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8836fb3501fa0d34a9f1b01d4109e8b0f38d55618e0397c5296d33be47f65a26')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '/^hooks:$/Q' plugin.yaml
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
