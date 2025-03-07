# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name=("protoc-gen-grpc-gateway" "protoc-gen-openapiv2")
_pkgname="grpc-gateway"
pkgname="${_pkgname}-git"
pkgver=2.26.3.r19.g0bd409a
pkgrel=1
pkgdesc="gRPC to JSON proxy generator following the gRPC HTTP spec"
arch=('aarch64' 'x86_64')
url="https://grpc-ecosystem.github.io/grpc-gateway/"
_url="https://github.com/grpc-ecosystem/${_pkgname}"
license=('BSD-3-Clause')
depends=('glibc' 'protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc')
makedepends=('go' 'git')
provides=("${_pkgname}=${pkgver%%.r*}" "${_name[@]/%/=${pkgver%%.r*}}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  for _binary in "${_name[@]}"; do
    go build -o ./"build/${_binary}" ./"${_binary}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  for _binary in "${_name[@]}"; do
    install -vDm755 "build/${_binary}" "${pkgdir}/usr/bin/${_binary}"
  done

  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
