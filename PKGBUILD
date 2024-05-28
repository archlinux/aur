# Maintainer: Serg Podtynnyi <serg@podtynnyi.com>
pkgname=knotidx
pkgver=0.0.1
pkgrel=2
pkgdesc="Fast object indexer"
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64')
_base_path="github.com/shtirlic"
url="https://${_base_path}/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
_soruce_dir=""
license=("MIT")
depends=("glibc")
makedepends=("go" "protobuf")
sha256sums=('7b04e092392ad0596075252e091281a6865971d3cdf8e1520ab0c3b7b1bea29f')
_commit="f0c6abf861040edd2442aeb5da0f154f3cc1db6d"

prepare() {
  mkdir -p "${srcdir}/src/${_base_path}"
  ln -rTsf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/${_base_path}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o "${pkgname}.bin" -ldflags "-s -w \
  -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ) \
  -X main.version=${pkgver} \
  -X main.commit=${_commit} \
  -X main.buildSource=binaryRelease" \
  cmd/${pkgname}/*
  go clean --modcache
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.bin" ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _file in "${srcdir}/${pkgname}-${pkgver}/"*.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
