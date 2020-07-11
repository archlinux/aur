# Maintainer: ml <ml@visu.li>
pkgname=helm-2to3
pkgver=0.6.0
pkgrel=1
pkgdesc='Migrates and cleans up Helm v2 configuration and releases in-place to Helm v3'
arch=('x86_64' 'aarch64')
url='https://github.com/helm/helm-2to3'
license=('Apache')
install=helm-2to3.install
depends=('helm')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('46a88ef48fc8914f0886e37f16541add14727b2483d89aba314135428ccf6a87')

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
  go build -o bin/2to3
}

# check(): 2to3 has no tests

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/2to3 -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 {completion,plugin}.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
}
