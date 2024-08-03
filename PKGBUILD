# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="gomphotherium"
pkgver=0.4.0
pkgrel=2
pkgdesc="A command line Mastodon client"
arch=('any')
url="https://github.com/mrusme/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('go>=1.19')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b72f85b49dde6566644469c2c9727892d8b811333b32329c53dd66e9cd2e065')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
  go mod download
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${url#https://}/cli.VERSION=${pkgver}" \
    .
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
