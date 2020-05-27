# Maintainer: ml <ml@visu.li>
pkgname=helm-s3
pkgver=0.9.2
pkgrel=1
pkgdesc='Helm plugin that allows to use AWS S3 as a [private] chart repository'
arch=('x86_64')
url='https://github.com/hypnoglow/helm-s3'
license=('MIT')
install=helm-s3.install
depends=('helm')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a601ebde9d881da832189fa4cf75e88a2c402fb5b1081e00e56bff3ee854b2e8')

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
  go build -o bin/helms3 -ldflags "-X main.version=${pkgver}" ./cmd/helms3
}

check() {
  cd "${pkgname}-${pkgver}"
  make test-unit
  grep -Fqm1 "$pkgver" bin/helms3
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/helms3 -t "${pkgdir}/usr/lib/helm/plugins/${pkgname}/bin"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
