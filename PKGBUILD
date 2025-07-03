# Maintainer: Marcus Ziade <marcusziade@users.noreply.github.com>
pkgname=igscraper
pkgver=2.0.1
pkgrel=1
pkgdesc="A powerful Instagram photo downloader with cyberpunk aesthetics, built in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/marcusziade/igscraper"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marcusziade/igscraper/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Create go module directory
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    # Build the binary
    go build -v -ldflags "-w -s -X main.version=${pkgver}" -o build/igscraper ./cmd/igscraper
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install binary
    install -Dm755 build/igscraper "${pkgdir}/usr/bin/igscraper"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}