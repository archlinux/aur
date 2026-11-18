# Maintainer: TODO <TODO>
pkgname=kata-all-bin
pkgver=4.4.0
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
sha256sums_x86_64=('ccbc0cbc591089d0c57012b78da64b23ef43e0bac0f869dc7bfebe8588c33986'
                   'bec610d4e01eb97eb41f1f00848e44fdf0d3422a881b2b751abe867a656ee40b')
sha256sums_aarch64=('9dd4407d4b756858fe9ce33322a605f5a932743839a8ec47108e8513dcc3aaa3'
                    '649abcdf4377601453955cf77ce77bef939f905883521a6922be8b7262ed7b28'
                    '65fc33dfe98f79e07b3fdf9edce35b729cd0460f115709a16f69426e6ec1f774')

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
