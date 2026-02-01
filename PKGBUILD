# Maintainer: Your Name <your.email@example.com>
pkgname=apx-env
pkgver=1.2.0
pkgrel=1
pkgdesc="APX - Accelerated Package X: Multi-language environment manager for Python, Node.js, Go, Rust, and Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/Definetly-a-username/APX"
license=('GPL3')
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Definetly-a-username/APX/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fda77c63eeef3884de541cd87a2f0305dcae0e113723d703f35de03e217b4f79')

build() {
    cd "APX-${pkgver}"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -v -ldflags "-X main.version=${pkgver} -s -w" -o apx .
}

check() {
    cd "APX-${pkgver}"
    go test ./...
}

package() {
    cd "APX-${pkgver}"
    
    # Install binary
    install -Dm755 apx "${pkgdir}/usr/bin/apx"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license (if exists)
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
