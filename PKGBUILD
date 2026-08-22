# Maintainer: Josephine Pfeiffer <josie@archlinux.org>
pkgname=cockpit-pacman
pkgver=0.3.7
pkgrel=7
pkgdesc='Cockpit plugin for Arch Linux package management using alpm.rs'
arch=('x86_64')
url='https://github.com/pfeifferj/cockpit-pacman'
license=('GPL-3.0-only')
depends=('cockpit>=300' 'coreutils' 'glibc' 'libalpm.so' 'libgcc' 'pacman' 'pacman-mirrorlist' 'systemd')
makedepends=('cargo' 'npm')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pfeifferj/cockpit-pacman/archive/v$pkgver.tar.gz")
sha256sums=('cd7bf2650749e5327cdf1c88be7db37359e9d368cef4bbde3172c02b1770e3f5')

prepare() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTUP_TOOLCHAIN=stable
    sed -i "s|\$(PREFIX)/libexec/cockpit-pacman|\$(PREFIX)/lib/cockpit-pacman|g" Makefile
    sed -i 's|/usr/libexec/cockpit-pacman|/usr/lib/cockpit-pacman|g' \
        src/api.ts src/api.test.ts systemd/cockpit-pacman-scheduled.service
    sed -i -E \
        -e 's/cargo (build|clippy|test)/cargo \1 --frozen/g' \
        -e '/^[[:space:]]*npm ci/d' \
        Makefile
    sed -i 's/^strip = true$/strip = false/' backend/Cargo.toml
    sed -i 's/"test": "vitest run"/"test": "vitest run --testTimeout=20000"/' package.json
    cargo fetch --locked --manifest-path backend/Cargo.toml \
        --target "$(rustc -vV | sed -n 's/host: //p')"
    npm ci
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_NET_OFFLINE=true
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTUP_TOOLCHAIN=stable
    make build
}

check() {
    cd "$pkgname-$pkgver"
    export LC_ALL=C.UTF-8
    export CARGO_NET_OFFLINE=true
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTUP_TOOLCHAIN=stable
    make test
    npm run typecheck
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr \
        BACKEND_BIN="$srcdir/target/release/cockpit-pacman-backend" install
}
