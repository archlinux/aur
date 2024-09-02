pkgname=jq-lsp
pkgver=0.1.4
pkgrel=1
pkgdesc="jq language server"
arch=(i686 x86_64 arm aarch64)
url="https://github.com/wader/jq-lsp"
license=('MIT')
makedepends=("go")
# LTO renders GO BUILDID unreproducible: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108534
options=(!lto)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('709ce6485e53d84e8e4c5f993277633966da9676920a867995e19528be3500b1')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" ${_BUILDINFO}" \
    -o build/jq-lsp \
    .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "build/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
