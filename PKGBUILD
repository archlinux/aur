# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jolt-git
_pkgname=jolt
pkgver=1.2.0.r33.g7784131
pkgrel=1
pkgdesc='TUI-based battery and energy monitor.'
arch=('x86_64' 'aarch64')
url='https://github.com/jordond/jolt'
license=('MIT')
makedepends=('cargo' 'git')
provides=('jolt')
conflicts=('jolt' 'jolt-bin')
options=(!lto)
install='jolt.install'
source=("$_pkgname::git+$url.git#branch=main"
    'jolt.install'
    'jolt.install.asc')
sha256sums=('SKIP'
            '08972ab4d23a67622d2177988338c7a4a4341b4f1557b359f30b7512fb277fff'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')


pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 'target/release/jolt' "$pkgdir/usr/bin/jolt"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user/" assets/jolt.service
}

