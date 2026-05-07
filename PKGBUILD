# Maintainer: MathewRJ <https://github.com/MathewRJ>
# AUR: https://aur.archlinux.org/packages/gamepulse-git
#
# Prerequisites (not in official repos -- install once before makepkg):
#   rustup install nightly
#   rustup component add rust-src --toolchain nightly
#   cargo install bpf-linker
#
pkgname=gamepulse-git
pkgver=0.1.0.r0.gaf0f187
pkgrel=1
pkgdesc="Gaming performance telemetry agent -- ships CPU/GPU/memory/frame metrics to Elasticsearch"
arch=('x86_64')
url="https://github.com/MathewRJ/GamePulse"
license=('MIT')
provides=('gamepulse')
conflicts=('gamepulse')
depends=()
makedepends=('rust' 'git')
optdepends=('mangohud: frame timing data collection')
backup=('etc/gamepulse/gamepulse.toml')
# Disable LTO: ring's build script compiles C/ASM via cc and produces GCC LTO
# bitcode objects when CFLAGS contains -flto. Rust's LLD linker cannot resolve
# symbols from GCC LTO objects, causing undefined symbol errors at link time.
options=(!lto)

source=("${pkgname}::git+https://github.com/MathewRJ/GamePulse.git")
sha256sums=('SKIP')

pkgver() {
    git -C "${srcdir}/${pkgname}" describe --long --tags \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    if ! command -v bpf-linker &>/dev/null; then
        echo "ERROR: bpf-linker not found -- see README for install instructions"
        return 1
    fi
    if ! cargo +nightly --version &>/dev/null; then
        echo "ERROR: nightly Rust toolchain not found; run: rustup install nightly"
        return 1
    fi
    if ! rustup component list --toolchain nightly 2>/dev/null | grep -q "^rust-src (installed)"; then
        echo "ERROR: rust-src not found for nightly; run: rustup component add rust-src --toolchain nightly"
        return 1
    fi
}

build() {
    local _repodir="${srcdir}/${pkgname}"

    cd "${_repodir}"

    echo "=> Building gamepulse-agent (release)..."
    cargo build --release --manifest-path src/Cargo.toml

    echo "=> Building eBPF probes (bpfel-unknown-none, release)..."
    (cd ebpf && RUSTFLAGS="" cargo xtask build-ebpf --release 2>/dev/null) || \
    RUSTFLAGS="" cargo +nightly build \
        -p gamepulse-ebpf-probes \
        --target bpfel-unknown-none \
        -Z build-std=core \
        --release \
        --manifest-path ebpf/Cargo.toml

    echo "=> Building gamepulse-ebpf daemon (release)..."
    cargo build --release \
        -p gamepulse-ebpf-daemon \
        --manifest-path ebpf/Cargo.toml
}

package() {
    local _repodir="${srcdir}/${pkgname}"

    install -Dm755 "${_repodir}/target/release/gamepulse-agent" \
        "${pkgdir}/usr/bin/gamepulse-agent"
    install -Dm755 "${_repodir}/ebpf/target/release/gamepulse-ebpf" \
        "${pkgdir}/usr/bin/gamepulse-ebpf"

    install -Dm755 "${_repodir}/ebpf/target/bpfel-unknown-none/release/gamepulse-ebpf-probes" \
        "${pkgdir}/usr/lib/gamepulse/gamepulse-ebpf-probes"

    install -Dm644 "${_repodir}/packaging/systemd/gamepulse-agent.service" \
        "${pkgdir}/usr/lib/systemd/user/gamepulse-agent.service"

    install -Dm644 "${_repodir}/packaging/systemd/gamepulse-ebpf.service" \
        "${pkgdir}/usr/lib/systemd/system/gamepulse-ebpf.service"

    install -Dm755 "${_repodir}/packaging/gamepulse-launcher.sh" \
        "${pkgdir}/usr/bin/gamepulse"

    install -Dm644 "${_repodir}/packaging/config/gamepulse.toml.example" \
        "${pkgdir}/etc/gamepulse/gamepulse.toml"
}
