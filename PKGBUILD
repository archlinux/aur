# Maintainer: George Bereveskos <report@hellas.dev>
pkgname=godash
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal Personal Productivity Dashboard - Task management, notes, calendar & weather in a beautiful TUI"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/HellasDev/GoDash"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=(
    'firefox: For better browser integration with calendar links'
    'google-chrome: Alternative browser for calendar integration'
    'chromium: Alternative browser for calendar integration'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/HellasDev/GoDash/archive/v${pkgver}.tar.gz")
sha256sums=('c0d5efb8cf171b07049741ec197454d86fdc4ba0225b8d7e5787655ee46c684e')

prepare() {
    cd "GoDash-${pkgver}"
    
    # Download Go modules
    go mod download
    go mod verify
}

build() {
    cd "GoDash-${pkgver}"
    
    # Build with optimization flags
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build \
        -ldflags="-s -w -linkmode=external -extldflags=${LDFLAGS}" \
        -o ${pkgname} .
}

check() {
    cd "GoDash-${pkgver}"
    
    # Run tests if available
    go test -short ./... || true
}

package() {
    cd "GoDash-${pkgver}"
    
    # Install binary
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop file
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Install icon
    install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Install man page
    install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}