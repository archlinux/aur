# Maintainer: Your Name <your.email@example.com>
pkgname=apx-env
pkgver=1.0.0
pkgrel=1
pkgdesc="APX - Accelerated Package X: Multi-language environment manager for Python, Node.js, Go, Rust, and Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/Definetly-a-username/APX"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.21')
optdepends=(
    'python: Python environment support'
    'nodejs: Node.js environment support'
    'go: Go environment support'
    'rust: Rust environment support'
    'ruby: Ruby environment support'
)
provides=('apx')
conflicts=('apx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Definetly-a-username/APX/archive/refs/heads/main.tar.gz")
sha256sums=('29961abf7d7e033ba4fd88968531483d2dfe57f31f67075141c40455bfccf4f9')

build() {
    cd "APX-main"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -v -ldflags "-X main.version=${pkgver} -s -w" -o apx .
}

check() {
    cd "APX-main"
    go test ./...
}

package() {
    cd "APX-main"
    
    # Install binary
    install -Dm755 apx "${pkgdir}/usr/bin/apx"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license (if exists)
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
