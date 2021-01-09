# Maintainer: ml <ml@visu.li>
pkgname=helm-s3
pkgver=0.10.0
pkgrel=1
pkgdesc='Helm plugin that allows to use AWS S3 as a [private] chart repository'
arch=('x86_64')
url='https://github.com/hypnoglow/helm-s3'
license=('MIT')
install=helm-s3.install
groups=('helm-plugins')
depends=('helm')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0828ba5f4024a9cb98a5a41f42805fa93c7ed0734881d40e7e41ec74727764e0')

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
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o bin/helms3 -ldflags "-linkmode=external -X main.version=${pkgver}" ./cmd/helms3
}

check() {
  cd "${pkgname}-${pkgver}"
  make test-unit
  # grep -Fqm1 "$pkgver" bin/helms3
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/helms3 -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}/bin"
  install -m644 plugin.yaml -t "${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
