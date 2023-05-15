# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=helm-gcs
pkgver=0.4.3
pkgrel=1
pkgdesc="Helm plugin to manage chart repositories on GCS"
arch=(x86_64)
url=https://github.com/hayorov/helm-gcs
license=(MIT)
install=helm-gcs.install
depends=(bash helm)
makedepends=(go)
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b621e5b915627ae82d023aefc35c76eba52491df46d413287c991cd14f23e026')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download
  sed -i '/^hooks:$/Q' plugin.yaml
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  go build -o bin/helm-gcs -ldflags "-linkmode=external -X github.com/hayorov/helm-gcs/cmd/helm-gcs/cmd.version=${pkgver}" cmd/helm-gcs/main.go
}

package() {
  cd "${pkgname}-${pkgver}"

  # /usr/lib/helm/plugins follows other helm plugins on the AUR (e.g., helm-diff)
  install -Dm0755 bin/helm-gcs -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m0644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
  install -Dm0755 scripts/pull.sh -t "${pkgdir}/usr/lib/helm/plugins/${pkgname#helm-}/scripts"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
