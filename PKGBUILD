# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jolt
pkgver=1.1.0
pkgrel=1
pkgdesc='TUI-based battery and energy monitor.'
arch=('x86_64')
url='https://github.com/jordond/jolt'
license=('MIT')
makedepends=('cargo' 'patch')
provides=('jolt')
conflicts=('jolt-git' 'jolt-bin')
options=(!lto)
install='jolt.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    '119.patch'
    '120-remove-daemon-install-and-uninstall-subcommands.patch'
    'jolt.install'
    "$pkgname-$pkgver.tar.gz.asc"
    '119.patch.asc'
    '120-remove-daemon-install-and-uninstall-subcommands.patch.asc'
    'jolt.install.asc')
sha256sums=('625f0556f8b4ffa26a74fd9bcedcbdde725146d819b5613c15c7469d358cb9a9'
            'e75cfb22ed23a54423374118d01f17f95847054f2e3fba0c20440db247772917'
            '3005da92266858200c5496f46fe6d87dabecd664e425eee1da269bb382a59f65'
            '08972ab4d23a67622d2177988338c7a4a4341b4f1557b359f30b7512fb277fff'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    patch -p1 < ../119.patch
    patch -p1 < ../120-remove-daemon-install-and-uninstall-subcommands.patch
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features=linux
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/jolt"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user/" jolt.service
}

