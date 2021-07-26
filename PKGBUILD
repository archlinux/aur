# Maintainer: Vasiliy Bukharev <b dot v dot p at outlook dot com>

pkgname=gomason
pkgver=2.9.0
pkgrel=1
pkgdesc="A tool for testing, building, signing, and publishing binaries"
arch=('x86_64')
url='https://github.com/nikogura/gomason'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nikogura/gomason/archive/${pkgver}.tar.gz")
sha256sums=('528c2f21c6a05518bc2d5f28f6341aceba95295bef454792e646a9ef457b1d2e')

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
