# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence-git
pkgver=1.2.1
pkgrel=1
pkgdesc="Discord Rich Presence for MPRIS media players (git version)"
arch=('x86_64')
url="https://github.com/lazykern/mprisence"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('mprisence')
conflicts=('mprisence')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="$pkgdir" pkg-prepare
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

note() {
    cat <<EOF
==> Example configuration is available at /etc/mprisence/config.example.toml
==> To configure mprisence:
    1. Create your config directory:
       mkdir -p ~/.config/mprisence
    2. Copy and modify the example config:
       cp /etc/mprisence/config.example.toml ~/.config/mprisence/config.toml
    3. Enable and start the service:
       systemctl --user enable --now mprisence
EOF
} 