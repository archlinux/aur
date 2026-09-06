# Maintainer: TSUKUMO Akito <tsukumoakito99@duck.com>
# SPDX-License-Identifier: 0BSD

pkgname=circuit-mesh
pkgver=1.0.7
_zigver=0.15.2
pkgrel=1
pkgdesc="Zero-Trust Network Engine"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tsukumoakito/circuit-mesh"
license=('AGPL-3.0-only' 'custom:Commercial')
depends=('openssl' 'tor' 'ipset')
makedepends=('zig' 'scdoc')
backup=('etc/circuit-mesh/config.json')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsukumoakito/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=('66B227EC5F67D7B4F8C6C1C7E98764DF6FCE8857')
sha256sums=('9cdae2e22b8c6b1e4123c7d76d5ae01beefd75235c81303d62f750f0fe5761a8')

build() {
    cd "${pkgname}-${pkgver}"
    local zig_ver
    zig_ver=$(zig version)
    if [[ ! "$zig_ver" =~ ^$_zigver ]]; then
        echo "❌ Error: Current $pkgname version requires Zig $_zigver."
        echo "Currently using: $zig_ver"
        echo "Please run your zig package manager such as 'zvm use $_zigver' before building."
        return 1
    fi
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 zig-out/bin/circuit-mesh "${pkgdir}/usr/bin/circuit-mesh"
    install -Dm644 config.json "${pkgdir}/etc/circuit-mesh/config.json"
    install -Dm644 zig-out/share/man/man1/circuit-mesh.1 "${pkgdir}/usr/share/man/man1/circuit-mesh.1"
    install -Dm644 zig-out/share/man/ja/man1/circuit-mesh.1 "${pkgdir}/usr/share/man/ja/man1/circuit-mesh.1"
    install -Dm644 zig-out/doc/MANUAL.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.md"
    install -Dm644 zig-out/doc/MANUAL_ja.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL_ja.md"
    install -Dm644 doc/COMMERCIAL.md "${pkgdir}/usr/share/doc/${pkgname}/COMMERCIAL.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 README_ja.md "${pkgdir}/usr/share/doc/${pkgname}/README_ja.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSES/LicenseRef-circuit-mesh-Commercial.txt "${pkgdir}/usr/share/licenses/${pkgname}/LicenseRef-circuit-mesh-Commercial.txt"
    install -Dm644 zig-out/share/circuit-mesh/circuit-mesh.service "${pkgdir}/usr/lib/systemd/system/circuit-mesh.service"
}
