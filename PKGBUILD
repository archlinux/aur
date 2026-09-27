# Maintainer: fenuks

pkgname=vimls
_pkgname="${pkgname}-go"
pkgver=0.1.6
pkgrel=1
pkgdesc='Vim script language server written in go.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/neoclide/vimls-go'
license=('MIT')
depends=()
optdepends=()
makedepends=(go)
# options=(!buildflags)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99bee36af8e2c5da877f4af906b7c740368ba83562147956cbf6bee7aa76ef7e')
privides=("${pkgname}")
conflicts=("${pkgname}")

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -modcacherw
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build ./cmd/vimls
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSES/MIT.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
