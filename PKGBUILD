# Maintainer: facelock contributors
pkgname=facelock
_tag=0.2.0
pkgver=0.2.0
pkgrel=1
pkgdesc="Face authentication for Linux PAM"
arch=('x86_64')
url="https://github.com/tyvsmith/facelock"
license=('MIT OR Apache-2.0')
depends=('glibc' 'dbus' 'pam' 'gcc-libs' 'tpm2-tss' 'libxkbcommon' 'onnxruntime')
makedepends=('rust' 'cargo' 'clang' 'gettext' 'wayland' 'libxkbcommon')
checkdepends=('python')
optdepends=(
    'onnxruntime-opt-cuda: NVIDIA GPU acceleration (replaces onnxruntime)'
    'onnxruntime-opt-rocm: AMD GPU acceleration (replaces onnxruntime)'
)
backup=('etc/facelock/config.toml')
install=facelock.install
options=(!lto)
source=("$pkgname-$_tag.tar.gz::$url/archive/v$_tag.tar.gz")
# Filled in by publish-aur.sh at release time, like PKGBUILD-bin's sums: the
# tagged tree cannot carry its own tarball's digest. The placeholder fails
# closed — makepkg refuses to build until a real digest replaces it.
sha256sums=('06b0d6eea61c88bbdbd4a0830bf91a67aeb12565c6fc78fdb28a89f229bc3771')

prepare() {
    cd "$pkgname-$_tag"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_tag"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --workspace
    cargo build --frozen --release -p facelock-cli --features tpm
}

check() {
    cd "$pkgname-$_tag"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname-$_tag"

    # Binaries
    install -Dm755 target/release/facelock "$pkgdir/usr/bin/facelock"
    install -Dm755 target/release/facelock-polkit-agent "$pkgdir/usr/bin/facelock-polkit-agent"

    # PAM module
    install -Dm755 target/release/libpam_facelock.so "$pkgdir/usr/lib/security/pam_facelock.so"

    # Configuration
    install -Dm644 config/facelock.toml "$pkgdir/etc/facelock/config.toml"

    # Quirks database
    install -Dm644 -t "$pkgdir/usr/share/facelock/quirks.d/" config/quirks.d/*.toml

    # Compiled translation catalogs, both gettext domains. Installs nothing
    # while po/ holds only .pot templates, and creates no empty locale root.
    scripts/install-locale-catalogs.sh "$pkgdir/usr/share/locale"

    # systemd units
    install -Dm644 systemd/facelock-daemon.service "$pkgdir/usr/lib/systemd/system/facelock-daemon.service"

    # D-Bus policy and activation service
    install -Dm644 dbus/org.facelock.Daemon.conf "$pkgdir/usr/share/dbus-1/system.d/org.facelock.Daemon.conf"
    install -Dm644 dbus/org.facelock.Daemon.service "$pkgdir/usr/share/dbus-1/system-services/org.facelock.Daemon.service"

    # tmpfiles.d for runtime directories
    install -Dm644 dist/facelock.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/facelock.conf"
    install -Dm644 dist/facelock-pam-remove.hook "$pkgdir/usr/share/libalpm/hooks/facelock-pam-remove.hook"

    # Licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
