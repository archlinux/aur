# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: ml <ml@visu.li>

pkgname=helm-s3
pkgver=0.14.0
pkgrel=1
pkgdesc="Helm plugin that allows to set up a chart repository in AWS S3"
arch=(x86_64)
url=https://github.com/hypnoglow/helm-s3
license=(MIT)
install=helm-s3.install
depends=(helm)
makedepends=(go)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cba7a7eab600d0dc72ca48b8f7bbd3654265ba063facf5b0e626c0410076a12c')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download
  sed -i '/^hooks:$/Q' plugin.yaml
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o bin/helms3 \
    -ldflags "-linkmode=external -X main.version=${pkgver}" ./cmd/helm-s3
}

check() {
  cd "${pkgname}-${pkgver}"
  make test-unit
}

package() {
  cd "${pkgname}-${pkgver}"

  # /usr/lib/helm/plugins follows other helm plugins on the AUR (e.g., helm-diff)
  install -Dm0755 bin/helms3 -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m0644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
