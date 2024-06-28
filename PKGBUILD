# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_binname="gmd"
pkgname="gomanagedocker"
pkgver=1.2
pkgrel=1
pkgdesc="A TUI tool to manage docker objects"
arch=('any')
url="https://github.com/ajayd-san/${pkgname}"
license=('MIT')
depends=('glibc' 'docker')
makedepends=('go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b09885922ec5bedd659cc336b9e18d46a759c4d2bc56a8132da9aae2f6d6342d')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "build" ] || mkdir "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${_binname}" .
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
