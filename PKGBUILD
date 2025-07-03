# Maintainer: Marcus Ziade <marcusziade@users.noreply.github.com>
pkgname=igscraper-git
pkgver=2.0.1.r0.gcd55bcb
pkgrel=1
pkgdesc="A powerful Instagram photo downloader with cyberpunk aesthetics, built in Go (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/marcusziade/igscraper"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('igscraper')
conflicts=('igscraper')
source=("${pkgname}::git+https://github.com/marcusziade/igscraper.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    # Create go module directory
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    # Get version info
    VERSION=$(git describe --tags --always --dirty)
    COMMIT=$(git rev-parse --short HEAD)
    BUILD_TIME=$(date -u '+%Y-%m-%d_%H:%M:%S')
    
    # Build the binary
    go build -v -ldflags "-w -s -X main.version=${VERSION} -X main.buildTime=${BUILD_TIME} -X main.commitHash=${COMMIT}" -o build/igscraper ./cmd/igscraper
}

check() {
    cd "${srcdir}/${pkgname}"
    go test ./...
}

package() {
    cd "${srcdir}/${pkgname}"
    
    # Install binary
    install -Dm755 build/igscraper "${pkgdir}/usr/bin/igscraper"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}