# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
pkgname=cloud-nuke
pkgver=0.45.0
pkgrel=1
pkgdesc="AWS cloud account cleaning tool"
url="https://github.com/gruntwork-io/${pkgname}"
arch=(x86_64 i686 aarch64)
license=(MIT)
depends=(glibc)
makedepends=(go)
install=${pkgname}.install
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('254d6af92ec79d72d6fb3096ec3398564b2be2ca03eedbfb0bf5bd934e64c0980e1e18cb95ed6293b93d08e7c6ee1d95bbd4de148192dba1da3134732a9ed705')

prepare() {
  cd ${pkgname}-${pkgver}
  go mod download
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd ${pkgname}-${pkgver}
  go build
}

check() {
  cd ${pkgname}-${pkgver}
  ## don't test aws; requires an actual account
  go test ./commands ./config ./logging ./util
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dv ${pkgname} -t "${pkgdir}"/usr/bin/
  install -Dvm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
