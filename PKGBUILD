# Maintainer: Davide Carnemolla <herbrant@protonmail.com>
pkgname=codexbar-cli
pkgver=0.58.0
pkgrel=1
pkgdesc='AI coding provider usage tracker CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/steipete/CodexBar'
license=('MIT')
depends=('glibc' 'gcc-libs' 'curl' 'sqlite')
# Prebuilt upstream binary: stripping it yields a broken debug package
options=('!strip' '!debug')

provides=('codexbar')
conflicts=('codexbar')

source=("LICENSE::https://raw.githubusercontent.com/steipete/CodexBar/v${pkgver}/LICENSE")
source_x86_64=("CodexBarCLI-v${pkgver}-linux-x86_64.tar.gz::https://github.com/steipete/CodexBar/releases/download/v${pkgver}/CodexBarCLI-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("CodexBarCLI-v${pkgver}-linux-aarch64.tar.gz::https://github.com/steipete/CodexBar/releases/download/v${pkgver}/CodexBarCLI-v${pkgver}-linux-aarch64.tar.gz")

sha256sums=('14293556b79940745123d0160c71d27ed0e9fe9b8a848093f3ed78f4853caafe')
sha256sums_x86_64=('a327f8428fc8d2fd8707f2deab4e082a209f90707b7cfa91e1a2a6d4420dcb10')
sha256sums_aarch64=('8fec581e9fca44ffd5a5cf985467efa04658fd0a7bffbf2fcad7d452709cce08')
package() {
    # Binary crashes when argv[0] has no directory component (Swift Foundation
    # bug: uses argv[0] to resolve its own path for resource lookup).
    # Fix: install real binary to /usr/lib/codexbar-cli/ and expose a wrapper
    # at /usr/bin/codexbar that exec's with an absolute argv[0].
    install -Dm755 CodexBarCLI "${pkgdir}/usr/lib/${pkgname}/codexbar"
    # VERSION must live beside the binary (binary resolves it relative to argv[0] dir)
    install -Dm644 VERSION "${pkgdir}/usr/lib/${pkgname}/VERSION"
    # Provider plugin scripts; binary resolves the bundle relative to argv[0] dir
    install -dm755 "${pkgdir}/usr/lib/${pkgname}/CodexBar_CodexBarCore.bundle"
    install -Dm644 CodexBar_CodexBarCore.bundle/* \
        "${pkgdir}/usr/lib/${pkgname}/CodexBar_CodexBarCore.bundle/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Wrapper: exec passes full absolute path as argv[0]
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/codexbar" << 'EOF'
#!/bin/sh
exec /usr/lib/codexbar-cli/codexbar "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/codexbar"
}
