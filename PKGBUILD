# Maintainer: TODO <TODO>
pkgname=kata-all-bin
pkgver=3.28.0
pkgrel=1
pkgdesc='Kata Containers - lightweight VMs for container isolation (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/kata-containers/kata-containers'
license=('Apache-2.0')
depends=()
makedepends_aarch64=('rust' 'gcc' 'cmake' 'protobuf')
optdepends=(
    'containerd: container runtime interface'
    'docker: container runtime'
)
provides=('kata-containers' 'kata-runtime')
conflicts=('kata-runtime-bin' 'kata-containers-image-bin' 'linux-kata-bin')
options=('!strip' '!debug')

source=("kata-containers.sh")
source_x86_64=(
    "https://github.com/kata-containers/kata-containers/releases/download/${pkgver}/kata-static-${pkgver}-amd64.tar.zst"
    "https://github.com/kata-containers/kata-containers/releases/download/${pkgver}/kata-tools-static-${pkgver}-amd64.tar.zst"
)
source_aarch64=(
    "https://github.com/kata-containers/kata-containers/releases/download/${pkgver}/kata-static-${pkgver}-arm64.tar.zst"
    "kata-containers-${pkgver}.tar.gz::https://github.com/kata-containers/kata-containers/archive/refs/tags/${pkgver}.tar.gz"
    "https://github.com/kata-containers/kata-containers/releases/download/${pkgver}/kata-containers-${pkgver}-vendor.tar.gz"
)
sha256sums=('7f19328f600392d50062f3a760af5c603699831d81ae0b6363dfaf9fac61fba1')
sha256sums_x86_64=('99cefb46d70bc27b7bcffd7595be9010c6bed43e1cdfcf8078554c19e7c9b19d'
                   '825dbf929dc5fe3f77d1a473511fd8950f08b5f81b33803c79085dbc233ab94b')
sha256sums_aarch64=('f63d54507d1f18635d94475077e4c2330de4d8e05cedf25f7c38f063b0e66a91'
                    '06680d52bf2f7b6a2a674604834e1d48118115c98546ecd5ddbf951088dfc75b'
                    '2d8ad63e053c52f2bab5c76ed655d838c76822707380b781d17863c2a69d2653')

prepare() {
    if [[ "$CARCH" == "aarch64" ]]; then
        # Overlay vendored dependencies onto source tree for offline Rust builds
        cd "$srcdir/kata-containers-${pkgver}"
        tar -xzf "$srcdir/kata-containers-${pkgver}-vendor.tar.gz" 2>/dev/null || true
    fi
}

build() {
    if [[ "$CARCH" == "aarch64" ]]; then
        cd "$srcdir/kata-containers-${pkgver}"
        for tool in kata-ctl agent-ctl genpolicy trace-forwarder; do
            make -C "src/tools/$tool" LIBC=gnu
        done
    fi
}

package() {
    # Install kata-static (common to both archs — extracts to opt/kata/ in srcdir)
    install -d "$pkgdir/opt"
    cp -dr --no-preserve=ownership "$srcdir/opt/kata" "$pkgdir/opt/kata"

    if [[ "$CARCH" == "aarch64" ]]; then
        # Install tools built from source
        cd "$srcdir/kata-containers-${pkgver}"
        local _target="aarch64-unknown-linux-gnu"
        install -Dm755 "src/tools/kata-ctl/target/${_target}/release/kata-ctl" "$pkgdir/opt/kata/bin/kata-ctl"
        install -Dm755 "src/tools/agent-ctl/target/${_target}/release/kata-agent-ctl" "$pkgdir/opt/kata/bin/kata-agent-ctl"
        install -Dm755 "src/tools/genpolicy/target/${_target}/release/genpolicy" "$pkgdir/opt/kata/bin/genpolicy"
        install -Dm755 "src/tools/trace-forwarder/target/${_target}/release/kata-trace-forwarder" "$pkgdir/opt/kata/bin/kata-trace-forwarder"

        # Install kata-manager shell script
        install -Dm755 "utils/kata-manager.sh" "$pkgdir/opt/kata/bin/kata-manager"

        # Install tool config files
        install -Dm644 "src/tools/genpolicy/rules.rego" \
            "$pkgdir/opt/kata/share/defaults/kata-containers/rules.rego"
        install -Dm644 "src/tools/genpolicy/genpolicy-settings.json" \
            "$pkgdir/opt/kata/share/defaults/kata-containers/genpolicy-settings.json"
    fi

    # Install profile.d script for PATH
    install -Dm644 "$srcdir/kata-containers.sh" "$pkgdir/etc/profile.d/kata-containers.sh"
}
