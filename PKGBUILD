# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

: "${MAKEPKG_MATLAB_PREFIX:=/opt}"
: "${MAKEPKG_MATLAB_ROOT:=${MAKEPKG_MATLAB_PREFIX}/MATLAB}"

pkgname="matlab-mcp-core-server"
pkgver=0.10.1
pkgrel=1
pkgdesc="Run MATLAB® using AI applications with the official MATLAB MCP Server from MathWorks®"
arch=(
  'x86_64' # glnxa64
)
url="https://www.mathworks.com/products/matlab-mcp-core-server.html"
_url="https://github.com/matlab/${pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  'matlab-release>=R2020b'
  'sh'
)
makedepends=(
  'go'
  'git'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
  "${pkgname}.sh"
  # "${pkgname}_disable_telemetry.patch"
)
sha256sums=('ccde133577b7370cf832109eb110ea2ca02c64a5664285576f290a43031b2828'
            '49d0f8ed16c0828abccb82839263013eb86b664340f46352021f9374574143e7')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  # patch -Np1 -i "${srcdir}/${pkgname}_disable_telemetry.patch"

  go mod download -modcacherw -x
  go mod verify
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
  go build -v -o "build/glnxa64/${pkgname}" ./"cmd/${pkgname}"
}

check() {
  export MATLAB_MCP_CORE_SERVER_BUILD_DIR="${srcdir}/${_pkgsrc}/build"
  export MCP_MATLAB_PATH="$(printf '%s\n' ${MAKEPKG_MATLAB_ROOT}/*/bin | sort -V | tail -n1)"

  cd "${srcdir}/${_pkgsrc}"
  # go test ./...
  go test ./internal/... ./pkg/... ./tests/testutils/... ./tests/integration/...
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm755 "build/glnxa64/${pkgname}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
