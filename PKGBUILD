# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=say
pkgdesc='Terminal based voice and video call utility written in go'
pkgver=0.1.2
pkgrel=1
arch=(x86_64)
license=('MIT')
url='https://github.com/svanichkin/say'
depends=("glibc")
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/svanichkin/say/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5ea565c295167010e041ac8566e7607966c7c3ecb1914b1db104d8e92bcc5afe')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X main.version=${pkgver}" -o "build/${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
