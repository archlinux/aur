# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="ghfs"
pkgname="go-http-file-server"
pkgver=1.20.2
pkgrel=1
pkgdesc="Simple command line based HTTP file server to share local file system"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64' 'i686' 'armv7h')
url="https://github.com/mjpclab/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6d7e3557996bb4b36c3dc8c2e5bbb90ae794b3faede61493d3d7522dfe7e9de')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
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
  install -vDm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
