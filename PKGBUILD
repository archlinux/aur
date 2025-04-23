# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go-grpc"
pkgname="${_pkgname}-git"
pkgver=1.5.1.r369.gec2d624
pkgrel=1
pkgdesc="gRPC bindings generator for Go language"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/grpc/grpc-go"
license=('Apache-2.0')
depends=('glibc' 'protoc-gen-go')
makedepends=('git' 'go')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="grpc-go"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local latest_tag="$(git tag -l "cmd/protoc-gen-go-grpc/*" --sort=-v:refname | head -n1)"
  local version="${latest_tag#cmd/protoc-gen-go-grpc/v}"
  local rev_count="$(git rev-list "${latest_tag}"..HEAD --count)"
  local short_hash="$(git rev-parse --short=7 HEAD)"

  printf "%s.r%s.g%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}/cmd/${_pkgname}"
  mkdir -p "build"

  go mod download -x
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}/cmd/${_pkgname}"
  go build -v -o "build/${_pkgname}" .
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   ./"cmd/${_pkgname}/${_pkgname}_test.sh"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "AUTHORS"    "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "NOTICE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/NOTICE"

  cd "cmd/${_pkgname}"
  install -vDm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
