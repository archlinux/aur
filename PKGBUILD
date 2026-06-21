# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pi-bin
pkgver=0.79.9
pkgrel=1
pkgdesc="AI coding agent for the terminal — minimal, extensible and optimized for tool-use (pi-mono)"
arch=('x86_64' 'aarch64')
url="https://github.com/badlogic/pi-mono"
license=('MIT')
depends=('glibc')
options=(!strip)
optdepends=('tmux: for background bash capabilities')
provides=('pi')
conflicts=('pi')

source_x86_64=("pi-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v${pkgver}/pi-linux-x64.tar.gz")
source_aarch64=("pi-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v${pkgver}/pi-linux-arm64.tar.gz")

sha256sums_x86_64=('d4df2d41b9a50d1cfc1ec3bf750d53256461bac6d62ece431b8208c1504fc894')
sha256sums_aarch64=('19647b8530c686cc2a65c1a0df93b1e8b411189b0dc8d5ee5a8ffa447a5cdd6e')

package() {
    cd "${srcdir}/pi"

    # Create installation directories
    install -d "${pkgdir}/usr/lib/pi"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/doc/pi"

    # Core binary and runtime assets
    cp -r theme "${pkgdir}/usr/lib/pi/"
    install -m755 pi "${pkgdir}/usr/lib/pi/pi"
    install -m644 photon_rs_bg.wasm "${pkgdir}/usr/lib/pi/photon_rs_bg.wasm"
    install -m644 package.json "${pkgdir}/usr/lib/pi/package.json"

    # Symlink binary to /usr/bin
    ln -s "/usr/lib/pi/pi" "${pkgdir}/usr/bin/pi"

    # Documentation and examples
    cp -r docs/* "${pkgdir}/usr/share/doc/pi/"
    cp -r examples "${pkgdir}/usr/share/doc/pi/"
    install -m644 README.md "${pkgdir}/usr/share/doc/pi/README.md"
    install -m644 CHANGELOG.md "${pkgdir}/usr/share/doc/pi/CHANGELOG.md"

    # License (MIT as specified in package.json)
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "MIT License" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
