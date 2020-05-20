# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=grapes
pkgver=0.3.1
pkgrel=1
pkgdesc="Easy way to distribute commands over SSH"
arch=('x86_64')
url='https://github.com/yaronsumel/grapes'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('856e1c801df46a78bc089a089192aacce4cc8755dd83bcb95da896bdc205ac74')

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
  install -Dm755 build/grapes "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}