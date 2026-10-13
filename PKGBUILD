# Maintainer: Kolimi contributors <chaitanyachowdary125@live.com>
pkgname=kolimi-server
pkgver=0.1.7
pkgrel=2
pkgdesc="Pure-Rust, single-binary self-hosted cloud: files, WebDAV, CalDAV/CardDAV, sync"
arch=('x86_64' 'aarch64')
url="https://github.com/chaitanyayeleti/kolimi"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust' 'git')
provides=('kolimi')
conflicts=('kolimi-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df08e68724c0b6cdd25a9c6e89fe6e31d424a769cc74fbebbb1105263dff45a6')

build() {
    cd "kolimi-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # aws-lc-sys (via rustls) needs -O0 for its jitterentropy RNG; Arch's
    # hardened CFLAGS force -O2, tripping a compile-time #error. Disable the
    # jitterentropy fallback so the OS RNG is used instead.
    export AWS_LC_SYS_NO_JITTER_ENTROPY=1
    cargo build --release --locked -p kolimi-server -p kolimi-sync
}

check() {
    cd "kolimi-$pkgver"
    export AWS_LC_SYS_NO_JITTER_ENTROPY=1
    # A fast subset: the full workspace suite runs in CI.
    cargo test --release --locked -p kolimi-chunk -p kolimi-crypto -p kolimi-db
}

package() {
    cd "kolimi-$pkgver"
    install -Dm755 target/release/kolimi-server "$pkgdir/usr/bin/kolimi-server"
    install -Dm755 target/release/kolimi-sync "$pkgdir/usr/bin/kolimi-sync"
    install -Dm644 packaging/systemd/kolimi.service "$pkgdir/usr/lib/systemd/system/kolimi.service"
    install -Dm644 packaging/systemd/kolimi.sysusers "$pkgdir/usr/lib/sysusers.d/kolimi.conf"
    install -Dm644 packaging/systemd/kolimi.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kolimi.conf"
    install -Dm644 packaging/systemd/kolimi.env.example "$pkgdir/etc/kolimi/kolimi.env.example"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
