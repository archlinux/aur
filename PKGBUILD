# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=cockpit-pacman-git
pkgver=0.3.7.r84.gfd956d9
pkgrel=1
pkgdesc='Cockpit plugin for Arch Linux package management using alpm.rs'
arch=('x86_64')
url='https://github.com/pfeifferj/cockpit-pacman'
license=('GPL-3.0-only')
depends=('cockpit>=300' 'coreutils' 'glibc' 'libalpm.so' 'libgcc' 'pacman' 'pacman-mirrorlist' 'systemd')
makedepends=('cargo' 'git' 'npm' 'openssh')
provides=("cockpit-pacman=${pkgver%%.r*}")
conflicts=('cockpit-pacman')
options=(!lto)
source=("git+https://github.com/pfeifferj/cockpit-pacman.git" 'allowed_signers' 'github-web-flow.gpg')
sha256sums=('SKIP'
            'ef3f3920123082bf6de19cc9acdea21ebfb09e6056bdf2cf763d07597b9b2312'
            '6e8af687f60cf3f403151c8fb1b26e95e6f9e424ca60cc8f3787bd4466a3ef84')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

verify() {
    cd "${pkgname%-git}"
    local keyring="$srcdir/gnupg"
    install -dm700 "$keyring"
    GNUPGHOME="$keyring" gpg --batch --quiet --import "$PWD/../github-web-flow.gpg"
    GNUPGHOME="$keyring" git -c gpg.format=ssh \
        -c gpg.ssh.allowedSignersFile="$PWD/../allowed_signers" \
        verify-commit HEAD
}

prepare() {
    cd "${pkgname%-git}"
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
    cd "${pkgname%-git}"
    export CARGO_NET_OFFLINE=true
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTUP_TOOLCHAIN=stable
    make build
}

check() {
    cd "${pkgname%-git}"
    export CARGO_NET_OFFLINE=true
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTUP_TOOLCHAIN=stable
    make test
    npm run typecheck
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir" PREFIX=/usr \
        BACKEND_BIN="$srcdir/target/release/cockpit-pacman-backend" install
}
