# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="matlab-mcp-core-server"
pkgver=0.6.1
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
)
makedepends=(
  'go'
  'git'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
  "${pkgname}_disable_telemetry.patch"
)
sha256sums=('a6077b735cce09c2fec8de5342c231865033122de22082ce97dec4fdd594dbd8'
            '7a56f149840e0f1cdc592c7de5f261c8a03d1ce48a1adcf4fc03c7f1b059ce18')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_disable_telemetry.patch"

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

# check() {
#   export MATLAB_MCP_CORE_SERVER_BUILD_DIR="${srcdir}/${_pkgsrc}/build"
#   export MCP_MATLAB_PATH=""

#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/glnxa64/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
