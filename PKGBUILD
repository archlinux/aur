# Maintainer: Joshua Alexander <j-alexander3375@users.noreply.github.com>

pkgname=lotus-lang
pkgver=0.1.2
pkgrel=1
pkgdesc="A systems programming language with Rust-inspired imports, type-first bindings, and x86-64 assembly output"
arch=('x86_64')
url="https://github.com/j-alexander3375/Lotus"
license=('MIT')
depends=('gcc')
makedepends=('go>=1.20')
source=("lotus-lang-${pkgver}.tar.gz::https://github.com/j-alexander3375/Lotus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cea30368f25c379c99a49c3394fab9321f956962be545f84fec940f1e74979b4')

build() {
    cd "${srcdir}/Lotus-${pkgver}"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    cd src
    go build -o ../lotus .
}

check() {
    cd "${srcdir}/Lotus-${pkgver}"
    
    # Run basic compilation test
    ./lotus tests/test_imports_basic.lts -o test_basic || true
    ./lotus tests/test_control_flow.lts -o test_control || true
}

package() {
    cd "${srcdir}/Lotus-${pkgver}"
    
    # Install binary
    install -Dm755 lotus "${pkgdir}/usr/bin/lotus"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install additional documentation
    install -Dm644 Important_Documentation/STYLE_GUIDE.md \
        "${pkgdir}/usr/share/doc/${pkgname}/STYLE_GUIDE.md"
    install -Dm644 Important_Documentation/STDLIB_AND_IMPORTS.md \
        "${pkgdir}/usr/share/doc/${pkgname}/STDLIB_AND_IMPORTS.md"
    install -Dm644 Important_Documentation/STDLIB_IMPLEMENTATION.md \
        "${pkgdir}/usr/share/doc/${pkgname}/STDLIB_IMPLEMENTATION.md"
    install -Dm644 Important_Documentation/DEVELOPMENT.md \
        "${pkgdir}/usr/share/doc/${pkgname}/DEVELOPMENT.md"
    
    # Install example files
    install -dm755 "${pkgdir}/usr/share/${pkgname}/examples"
    cp -r examples/* "${pkgdir}/usr/share/${pkgname}/examples/" 2>/dev/null || true
    cp -r tests/*.lts "${pkgdir}/usr/share/${pkgname}/examples/" 2>/dev/null || true
}
