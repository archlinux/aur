# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=blacksheepwall
pkgver=3.3.0
pkgrel=2
pkgdesc="A hostname reconnaissance tool"
arch=('x86_64')
url="https://github.com/tomsteele/${pkgname}"
license=(MIT)
makedepends=(go)
source=(${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('29dcd50ccaa1edd3e57f5b5d30d0f6372e517261efa6b5633931e786b791d5f99714a7506a969a9a64fea66a35ca790bc642cc66453c01ae5a36762d072a492b')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod init "${url#https://}"
  go mod tidy
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o ${pkgname} .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
