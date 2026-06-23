# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

: "${MAKEPKG_MATLAB_PREFIX:=/opt}"
: "${MAKEPKG_MATLAB_ROOT:=${MAKEPKG_MATLAB_PREFIX}/MATLAB}"

_pkgname="matlab-mcp-server"
pkgname="${_pkgname}-git"
pkgver=0.11.0.r0.g1545405
pkgrel=1
pkgdesc="Run MATLAB® using AI applications with the official MATLAB MCP Server from MathWorks®"
arch=(
  'x86_64' # x64
)
url="https://www.mathworks.com/products/matlab-mcp-server.html"
_url="https://github.com/matlab/${_pkgname}"
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
  "${_pkgname}=${pkgver%.r0.g*}"
  "matlab-mcp-core-server=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "matlab-mcp-core-server"
)
replaces=(
  "matlab-mcp-core-server-git<=0.11.0.r0.g1545405-1"
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git"
  # "${_pkgname}_disable_telemetry.patch"
  "${_pkgname}.sh"
)
sha256sums=('SKIP'
            'baf366fb285ace6191a4abef69f003b3135c16ff9df043b274abaa4edc8df1bf')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  # patch -Np1 -i "${srcdir}/${_pkgname}_disable_telemetry.patch" || true

  go mod download -modcacherw -x
  go mod verify
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  go build -v -o "build/glnxa64/${_pkgname}" ./"cmd/${_pkgname}"
}

check() {
  export MATLAB_MCP_SERVER_BUILD_DIR="${srcdir}/${_pkgsrc}/build"
  export MCP_MATLAB_PATH="$(printf '%s\n' ${MAKEPKG_MATLAB_ROOT}/*/bin | sort -V | tail -n1)"

  cd "${srcdir}/${_pkgsrc}"
  # go test ./...
  go test ./internal/... ./pkg/... ./tests/testutils/... ./tests/integration/...
}

package() {
  install -vDm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${_pkgsrc}"
  install -vDm755 "build/glnxa64/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
