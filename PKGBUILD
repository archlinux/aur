# Maintainer: facelock contributors
pkgname=facelock-git
pkgver=0.1.4
pkgrel=1
pkgdesc="Face authentication PAM module for Linux (development build)"
arch=('x86_64')
url="https://github.com/tyvsmith/facelock"
license=('MIT OR Apache-2.0')
depends=('glibc' 'dbus' 'pam' 'gcc-libs' 'tpm2-tss' 'libxkbcommon')
makedepends=('rust' 'cargo' 'clang' 'wayland' 'libxkbcommon' 'git')
provides=('facelock')
conflicts=('facelock')
backup=('etc/facelock/config.toml')
install=facelock.install
options=(!lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --workspace
    cargo build --frozen --release -p facelock-cli --features tpm
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname"

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
