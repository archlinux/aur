# Maintainer: ml <ml@visu.li>
pkgname=helm-2to3
pkgver=0.10.2
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
sha256sums=('ffeb217778d222b724c27c07c4f4982d007af76a63285f0b090896df154193ed')

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
