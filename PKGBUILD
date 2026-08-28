# Maintainer: Josephine Pfeiffer <josie@archlinux.org>
pkgname=cockpit-pacman
pkgver=0.3.8
pkgrel=1
pkgdesc='Cockpit plugin for Arch Linux package management using alpm.rs'
arch=('x86_64')
url='https://github.com/pfeifferj/cockpit-pacman'
license=('GPL-3.0-only')
depends=('cockpit>=300' 'coreutils' 'glibc' 'libalpm.so' 'libgcc' 'pacman' 'pacman-mirrorlist' 'systemd')
makedepends=('cargo' 'git' 'npm')
options=(!lto)
install="$pkgname.install"
source=("$pkgname::git+https://github.com/pfeifferj/cockpit-pacman.git#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('100A50E46DC2C244F838DCBFABD48F465F4434BD')

prepare() {
    cd "$pkgname"
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
    cargo fetch --locked --manifest-path backend/Cargo.toml \
        --target "$(rustc -vV | sed -n 's/host: //p')"
    npm ci
}

build() {
    cd "$pkgname"
    export CARGO_NET_OFFLINE=true
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTUP_TOOLCHAIN=stable
    make build
}

check() {
    cd "$pkgname"
    export LC_ALL=C.UTF-8
    export CARGO_NET_OFFLINE=true
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTUP_TOOLCHAIN=stable
    make test
    npm run typecheck
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr \
        BACKEND_BIN="$srcdir/target/release/cockpit-pacman-backend" install
}
