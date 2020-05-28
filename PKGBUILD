# Maintainer: ml <ml@visu.li>
pkgname=helm-edit
pkgver=0.4.0
pkgrel=2
pkgdesc='Helm plugin to edit releases'
arch=('x86_64')
url='https://github.com/mstrzele/helm-edit'
license=('MIT')
install=helm-edit.install
depends=('bash' 'helm>=3.0.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('97a0bb6573f886738665de6c3ff355debf541378dfe01443bf456bc60778c6aa')

prepare() {
  cd "${pkgname}-${pkgver}"
  #go mod download
  go mod tidy # required for -mod=readonly due to missing checksums
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
  go build -o helm-edit
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 helm-edit -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
  install -m755 plugin.complete -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
