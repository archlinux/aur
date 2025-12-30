# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=say
pkgdesc='Terminal based voice and video call utility written in go'
pkgver=0.1.0
pkgrel=1
arch=(x86_64)
license=('MIT')
url='https://github.com/svanichkin/say'
depends=("glibc")
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/svanichkin/say/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('71a7263c7d5295614865b89f11631acc9af6a29b12e5e833ea9d14edf960dbb3')

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
  go build -o "build/${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
