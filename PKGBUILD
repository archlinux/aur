# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Aliaksandr Mianzhynski <amenzhinsky@gmail.com>

pkgname="protoc-gen-go-grpc"
pkgver=1.4.0
pkgrel=1
pkgdesc="gRPC bindings generator for Go language"
arch=('any')
url="https://github.com/grpc/grpc-go"
license=('Apache-2.0')
depends=('protoc-gen-go')
makedepends=('go')
_pkgsrc="grpc-go-cmd-${pkgname}-v${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/cmd/${pkgname}/v${pkgver}.tar.gz")
sha256sums=('e932b9ceb1a338eabdb3a421b7e3bbc871f85d359d31955a5e4627ee1132f882')

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
  go build -o "build/${pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  # go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "AUTHORS"    "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
  install -Dm644 "NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
