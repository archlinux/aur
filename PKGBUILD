# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: ml <ml@visu.li>

pkgname=helm-s3
pkgver=0.10.0
pkgrel=1
pkgdesc="Helm plugin that allows to set up a chart repository in AWS S3"
arch=(x86_64)
url=https://github.com/hypnoglow/helm-s3
license=(MIT)
install=helm-s3.install
depends=(helm)
makedepends=(go)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0828ba5f4024a9cb98a5a41f42805fa93c7ed0734881d40e7e41ec74727764e0')

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
    -ldflags "-linkmode=external -X main.version=${pkgver}" ./cmd/helms3
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
