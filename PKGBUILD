# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pi-bin
pkgver=0.80.2
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

sha256sums_x86_64=('2e68772bbeaacd73488751098193875389636b80589100609a29921ded71c984')
sha256sums_aarch64=('0719ecf50a42cae79f4c6f0d4a62e08e8d4421788ccd050d08a5bbf35c88edf6')

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
