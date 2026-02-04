# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=jolt-git
_pkgname=jolt
pkgver=1.2.0.beta.2.r1.gffb8294
pkgrel=1
pkgdesc='TUI-based battery and energy monitor.'
arch=('x86_64' 'aarch64')
url='https://github.com/jordond/jolt'
license=('MIT')
makedepends=('cargo' 'patch' 'git')
provides=('jolt')
conflicts=('jolt' 'jolt-bin')
options=(!lto)
install='jolt.install'
source=("$_pkgname::git+$url.git#branch=main"
    '120-remove-daemon-install-and-uninstall-subcommands.patch'
    'jolt.install'
    '120-remove-daemon-install-and-uninstall-subcommands.patch.asc'
    'jolt.install.asc')
sha256sums=('SKIP'
            'c8551a1e5b3eb8fa2c31dd6a2e34b89cff29cdc77217b5cd570e74c76eab5a04'
            '08972ab4d23a67622d2177988338c7a4a4341b4f1557b359f30b7512fb277fff'
            'SKIP'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')


pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    patch -p1 < ../120-remove-daemon-install-and-uninstall-subcommands.patch
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
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user/" jolt.service
}

