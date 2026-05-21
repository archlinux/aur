# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=say
pkgdesc='Terminal based voice and video call utility written in go'
pkgver=0.1.3
pkgrel=2
arch=(x86_64)
license=('MIT')
url='https://github.com/svanichkin/say'
depends=("glibc")
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8eb494f4ef27dca7488c71adf226e744bc98cc18b4b7026daaf744658146f997')

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
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
