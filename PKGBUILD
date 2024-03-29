# Maintainer: Vasiliy Bukharev <b dot v dot p at outlook dot com>

pkgname=gomason
pkgver=2.13.0
pkgrel=1
pkgdesc="A tool for testing, building, signing, and publishing binaries"
arch=('x86_64')
url='https://github.com/nikogura/gomason'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nikogura/gomason/archive/${pkgver}.tar.gz")
sha256sums=('4e3cd5f1a80e70f3d06eaacf59fce6e9076a9847927d24fa0cb543df3bb27598')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/gomason "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
