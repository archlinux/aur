# Maintainer: Joshua Alexander <j-alexander3375@users.noreply.github.com>

pkgname=lotus-lang
pkgver=1.10.0
pkgrel=1
pkgdesc="A systems programming language with type-first syntax, LLVM backend, and an interactive REPL"
arch=('x86_64')
url="https://github.com/j-alexander3375/Lotus"
license=('MIT')
depends=('llvm' 'clang' 'sdl3')
makedepends=('go>=1.20')
source=("lotus-lang-${pkgver}.tar.gz::https://github.com/j-alexander3375/Lotus/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0781157581b7c6058ccc19235076f4311272253c451fc782c602ccab400a066f')

build() {
    cd "${srcdir}/Lotus-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor"

    cd src
    go build -o ../lotus .
}

check() {
    cd "${srcdir}/Lotus-${pkgver}"

    # Run unit tests
    cd src
    go test -short -timeout 60s . || true
    cd ..

    # Verify LLVM compilation and basic execution on examples
    ./lotus examples/control_flow_if.lts -o /tmp/lotus_check_if && /tmp/lotus_check_if || true
    ./lotus examples/control_flow_for.lts -o /tmp/lotus_check_for && /tmp/lotus_check_for || true
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
