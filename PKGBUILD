# Maintainer: Marcus Ziade <marcusziade@users.noreply.github.com>
pkgname=pomme-git
pkgver=2.0.0.r0.g0000000
pkgrel=1
pkgdesc="Beautiful App Store Connect CLI for sales reports, analytics, and reviews (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/marcusziade/pomme"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('pomme')
conflicts=('pomme')
source=("${pkgname}::git+https://github.com/marcusziade/pomme.git")
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
    go build -v -ldflags "-w -s -X main.version=${VERSION} -X main.buildTime=${BUILD_TIME} -X main.commitHash=${COMMIT}" -o build/pomme ./cmd/pomme
}

check() {
    cd "${srcdir}/${pkgname}"
    go test ./...
}

package() {
    cd "${srcdir}/${pkgname}"
    
    # Install binary
    install -Dm755 build/pomme "${pkgdir}/usr/bin/pomme"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 docs/CLI_MANUAL.md "${pkgdir}/usr/share/doc/${pkgname}/CLI_MANUAL.md"
}