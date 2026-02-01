# Maintainer: Your Name <your.email@example.com>
pkgname=apx-env
pkgver=1.2.2
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
sha256sums=('2b190c12e82daa9744ce67f6da26435e5601f79e490c7adabd7f555969b5a15d')

build() {
    cd "APX-${pkgver}"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    
    local _commit
    _commit=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
    local _date
    _date=$(date -u +%Y-%m-%d)
    
    go build -v -ldflags "-X main.version=${pkgver} -X main.commit=${_commit} -X main.date=${_date} -s -w -linkmode=external" -o apx .
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
