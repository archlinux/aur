pkgname=startheme-git
pkgver=v1.1.0
pkgrel=1
pkgdesc="a Starship theming tool in Go"
arch=("any")
url=https://github.com/isoextension/startheme
license=("none")
sha256sums=("SKIP")
depends=("starship")
makedepends=("go")
source=("git+https://github.com/isoextension/startheme")

# Define environment variables
APP="startheme"
PKG="./..."
GO="go"
CGO_ENABLED=0
OUTDIR="bin"
BUILD_TAGS=""
LDFLAGS="-s -w"
TIME=$(date -u +%Y-%m-%dT%H:%M:%SZ)
GIT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo unknown)
GOVERSION=$($GO version | awk '{print $3}')

# ldflags injection for version info
LDFLAGS_VERSION="-X 'main.buildTime=$TIME' -X 'main.commit=$GIT_COMMIT' -X 'main.goVersion=$GOVERSION'"

build() {
  cd "${srcdir}/startheme"
  mkdir -p "${OUTDIR}"
  $GO build -o -trimpath -ldflags="-s -w $LDFLAGS_VERSION" "${OUTDIR}/${APP}" ./src/main.go
}

package() {
  cd "${srcdir}/startheme"
  install -Dm755 "${OUTDIR}/${APP}" "${pkgdir}/usr/bin/${APP}"
}
