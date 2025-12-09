# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=say
pkgdesc='Terminal based voice and video call utility written in go'
pkgver=0.0.4
pkgrel=1
arch=(x86_64)
license=('MIT')
url='https://github.com/svanichkin/say'
depends=("glibc")
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/svanichkin/say/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ec6d9f7b08e3f57f35fbc8d087d178ef4f76b34a0b147aac770e1f7f7a2d6f5')

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
