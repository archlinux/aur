# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_modules=(
  "protoc-gen-go-ttrpc"
  "protoc-gen-gogottrpc"
)
pkgbase="ttrpc"
pkgname=(
  "${pkgbase}-common"
  "${_modules[@]}"
)
pkgver=1.2.7
pkgrel=1
pkgdesc="GRPC for low-memory environments"
arch=('x86_64')
url="https://github.com/containerd/${pkgbase}"
license=('Apache-2.0')
makedepends=(
  'go'
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('647c74fa44cc19ccb2f89d01283f4488c7cac7578b14b3d537fbd19b92146abf')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
  for _module in "${_modules[@]}"; do
    go build -v -o "build/${_module}" ./"cmd/${_module}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package_ttrpc-common() {
  pkgdesc+=" (common files)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_protoc-gen-go-ttrpc() {
  depends+=(
    "${pkgbase}-common=${pkgver}"
    'glibc'
    'protobuf'
    'protoc-gen-go'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -vd "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"
  ln -vsf "/usr/share/doc/${pkgbase}" "${pkgdir}/usr/share/doc/${pkgname}"
  ln -vsf "/usr/share/licenses/${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_protoc-gen-gogottrpc() {
  depends+=(
    "${pkgbase}-common=${pkgver}"
    'glibc'
    'protobuf'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -vd "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"
  ln -vsf "/usr/share/doc/${pkgbase}" "${pkgdir}/usr/share/doc/${pkgname}"
  ln -vsf "/usr/share/licenses/${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
