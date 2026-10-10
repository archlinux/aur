# Maintainer: futpib-bot <futpib-bot@users.noreply.github.com>

pkgname=zondd-git
pkgver=r26.78933ab
pkgrel=2
pkgdesc='SSH-authenticated operations with command policies and manual approval'
arch=('x86_64')
url='https://github.com/futpib/zondd'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'openssh')
makedepends=('cargo' 'git')
optdepends=('systemd: run the daemon as a user service')
provides=('zondd' 'zondctl')
conflicts=('zondd' 'zondctl')
source=("zondd::git+$url.git")
sha256sums=('SKIP')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

pkgver() {
    cd "$srcdir/zondd" || return
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/zondd" || return
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$srcdir/zondd" || return
    CFLAGS+=' -ffat-lto-objects'
    CXXFLAGS+=' -ffat-lto-objects'
    cargo build --frozen --release --workspace --bins
}

check() {
    cd "$srcdir/zondd" || return
    cargo test --frozen --release --workspace -- --test-threads=1
}

package() {
    cd "$srcdir/zondd" || return
    install -Dm755 target/release/zondd "$pkgdir/usr/bin/zondd"
    install -Dm755 target/release/zondctl "$pkgdir/usr/bin/zondctl"
    sed 's|^ExecStart=.*|ExecStart=/usr/bin/zondd serve|' zondd.service \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/zondd.service"
    install -Dm644 readme.md "$pkgdir/usr/share/doc/zondd/readme.md"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/zondd/config.example.toml"
}
