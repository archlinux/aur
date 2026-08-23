# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

: "${MAKEPKG_MATLAB_PREFIX:=/opt}"
: "${MAKEPKG_MATLAB_ROOT:=${MAKEPKG_MATLAB_PREFIX}/MATLAB}"

pkgname="matlab-mcp-server"
pkgver=0.12.0
pkgrel=1
pkgdesc="Run MATLAB® using AI applications with the official MATLAB MCP Server from MathWorks®"
arch=(
  'x86_64' # glnxa64
)
url="https://www.mathworks.com/products/matlab-mcp-server.html"
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
provides=(
  "matlab-mcp-core-server=${pkgver}"
)
conflicts=(
  "matlab-mcp-core-server"
)
replaces=(
  "matlab-mcp-core-server<=0.11.0-1"
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
  "${pkgname}.sh"
  # "${pkgname}_disable_telemetry.patch"
)
sha256sums=('66422a392dab3c8a934af636d1b5d133fde00cf596cdd74ce79826dc139c0533'
            'baf366fb285ace6191a4abef69f003b3135c16ff9df043b274abaa4edc8df1bf')

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
  export MATLAB_MCP_SERVER_BUILD_DIR="${srcdir}/${_pkgsrc}/build"
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
