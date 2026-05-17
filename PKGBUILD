# Maintainer: facelock contributors
pkgname=facelock
pkgver=0.1.2
pkgrel=1
pkgdesc="Face authentication PAM module for Linux"
arch=('x86_64')
url="https://github.com/tyvsmith/facelock"
license=('MIT OR Apache-2.0')
depends=('glibc' 'dbus' 'pam' 'gcc-libs' 'tpm2-tss' 'libxkbcommon' 'onnxruntime')
makedepends=('rust' 'cargo' 'clang' 'wayland' 'libxkbcommon')
optdepends=(
    'onnxruntime-opt-cuda: NVIDIA GPU acceleration (replaces onnxruntime)'
    'onnxruntime-opt-rocm: AMD GPU acceleration (replaces onnxruntime)'
)
backup=('etc/facelock/config.toml')
install=facelock.install
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5ccf3971acf47146ae1ac6565a0d8593036c0f7e035f8724b86ce7043b8b6b94')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --workspace
    cargo build --frozen --release -p facelock-cli --features tpm
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries
    install -Dm755 target/release/facelock "$pkgdir/usr/bin/facelock"
    install -Dm755 target/release/facelock-polkit-agent "$pkgdir/usr/bin/facelock-polkit-agent"

    # PAM module
    install -Dm755 target/release/libpam_facelock.so "$pkgdir/usr/lib/security/pam_facelock.so"

    # Configuration
    install -Dm644 config/facelock.toml "$pkgdir/etc/facelock/config.toml"

    # Quirks database
    install -Dm644 -t "$pkgdir/usr/share/facelock/quirks.d/" config/quirks.d/*.toml

    # systemd units
    install -Dm644 systemd/facelock-daemon.service "$pkgdir/usr/lib/systemd/system/facelock-daemon.service"

    # D-Bus policy and activation service
    install -Dm644 dbus/org.facelock.Daemon.conf "$pkgdir/usr/share/dbus-1/system.d/org.facelock.Daemon.conf"
    install -Dm644 dbus/org.facelock.Daemon.service "$pkgdir/usr/share/dbus-1/system-services/org.facelock.Daemon.service"

    # sysusers.d for facelock group
    install -Dm644 dist/facelock.sysusers "$pkgdir/usr/lib/sysusers.d/facelock.conf"

    # tmpfiles.d for runtime directories
    install -Dm644 dist/facelock.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/facelock.conf"

    # Licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
