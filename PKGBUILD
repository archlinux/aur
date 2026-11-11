# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=whoisthat
pkgver=0.19.0
pkgrel=1
pkgdesc="Modern terminal-based VPN client with Xray-core backend"
arch=('x86_64' 'aarch64')
url="https://github.com/kvunoff/whoisthat"
license=('MIT')
depends=('iproute2' 'nftables' 'libcap')
makedepends=('rust' 'go')
optdepends=(
    'iptables: legacy firewall backend for TUN mode'
    'polkit: pkexec-based capability setup from the TUI'
    'systemd: autostart via user unit and linger'
    'xray: system Xray-core binary (managed runtime used automatically if absent)'
)
# The prebuilt package installs the same files; never allow both.
conflicts=('whoisthat-bin')
install=whoisthat.install
# ring (pulled in by rustls/ureq) ships precompiled assembly archives. Arch's
# makepkg injects -flto=auto into CFLAGS/CXXFLAGS/LDFLAGS for the `lto` option;
# the ring objects then lose their ring_core_* symbols at the final Rust link.
# Disable makepkg LTO for this package (Cargo itself is not LTO-enabled).
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kvunoff/whoisthat/archive/refs/tags/v${pkgver}.tar.gz")
# The "Publish to AUR" workflow pins the real released-tag digest.
sha256sums=('019697a46ce074c1a2f4d82247ccd123e9392db30e639b066d898ed7adfa4f1d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cd core/core
    go build -trimpath -o whoisthat-core
    cd ../..

    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 target/release/whoisthat "${pkgdir}/usr/bin/whoisthat"
    install -Dm755 target/release/whoisthat-runner "${pkgdir}/usr/bin/whoisthat-runner"
    install -Dm755 core/core/whoisthat-core  "${pkgdir}/usr/bin/whoisthat-core"
    install -Dm755 scripts/cgroup-setup "${pkgdir}/usr/lib/whoisthat/cgroup-setup"
    install -Dm755 scripts/run-runner   "${pkgdir}/usr/lib/whoisthat/run-runner"
    install -Dm755 scripts/run-core     "${pkgdir}/usr/lib/whoisthat/run-core"
    install -Dm755 scripts/install-init "${pkgdir}/usr/lib/whoisthat/install-init"
    install -Dm755 scripts/init-hook    "${pkgdir}/usr/lib/whoisthat/init-hook"
    install -d "${pkgdir}/usr/lib/whoisthat/init"
    cp -R pkg/init/. "${pkgdir}/usr/lib/whoisthat/init/"
    install -Dm644 pkg/whoisthat.desktop     "${pkgdir}/usr/share/applications/whoisthat.desktop"
    install -Dm644 pkg/whoisthat-url.desktop "${pkgdir}/usr/share/applications/whoisthat-url.desktop"
    install -Dm644 docs/public/logo.svg      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/whoisthat.svg"

    "${pkgdir}/usr/bin/whoisthat" completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/whoisthat"
    "${pkgdir}/usr/bin/whoisthat" completions zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_whoisthat"
    "${pkgdir}/usr/bin/whoisthat" completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/whoisthat.fish"
    "${pkgdir}/usr/bin/whoisthat" man             | install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man1/whoisthat.1"
}
