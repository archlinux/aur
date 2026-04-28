# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
pkgname=cloud-nuke
pkgver=0.50.0
pkgrel=1
pkgdesc="AWS cloud account cleaning tool"
url="https://github.com/gruntwork-io/${pkgname}"
arch=(x86_64 i686 aarch64)
license=(MIT)
depends=(glibc)
makedepends=(go)
install=${pkgname}.install
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('80041b17d331844d72205f4e34ad26984a649f8553c8c874824318fb3f7e4e73e4856e16d4d31195bf9a32d663f9610c82181d38565840132ef57b2a0835a980')

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
