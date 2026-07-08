# Maintainer: Sandra Keßler <mail@sandra-kessler.net>
pkgname=zerodds-bin
_pkgname=zerodds
pkgver=1.0.0_rc.5
pkgrel=1
pkgdesc="Pure-Rust OMG Data Distribution Service implementation (precompiled binaries)"
arch=('x86_64' 'aarch64')
url="https://zerodds.org"
license=('Apache-2.0')
provides=('zerodds')
conflicts=('zerodds')
depends=('glibc' 'gcc-libs')
makedepends=('binutils')

# .deb-bundles aus dem GH-release. Jedes .deb enthaelt die fertig
# kompilierten binaries für seine Komponente. Wir extrahieren die
# data.tar.* aus jedem .deb und bauen daraus den pacman-package-tree.
source_x86_64=(
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-cli_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-ws-bridge_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-mqtt-bridge_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-coap-bridge_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-amqp-bridge_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-grpc-bridge_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-corba-bridge_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-ros2_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-core_1.0.0-rc.5_amd64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-dev_1.0.0-rc.5_amd64.deb"
)
source_aarch64=(
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-cli_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-ws-bridge_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-mqtt-bridge_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-coap-bridge_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-amqp-bridge_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-grpc-bridge_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-corba-bridge_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-ros2_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-core_1.0.0-rc.5_arm64.deb"
  "https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.5/zerodds-dev_1.0.0-rc.5_arm64.deb"
)
sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    cd "${srcdir}"
    # Jedes .deb extrahieren: control.tar.* + data.tar.*
    for deb in *.deb; do
        ar x "$deb" data.tar.xz 2>/dev/null || ar x "$deb" data.tar.zst 2>/dev/null || ar x "$deb" data.tar.gz
        if [ -f data.tar.xz ];  then tar -xJf data.tar.xz -C "${pkgdir}"; rm data.tar.xz;  fi
        if [ -f data.tar.zst ]; then tar --zstd -xf data.tar.zst -C "${pkgdir}"; rm data.tar.zst; fi
        if [ -f data.tar.gz ];  then tar -xzf data.tar.gz -C "${pkgdir}"; rm data.tar.gz;  fi
    done
    # LICENSE einmal zentral installieren
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"
    if [ -f "${pkgdir}/usr/share/doc/zerodds-cli/LICENSE" ]; then
        cp "${pkgdir}/usr/share/doc/zerodds-cli/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    fi
}
