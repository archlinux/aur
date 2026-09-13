# Maintainer: command-z-z <zyj18395965717@gmail.com>
pkgname=widgex-git
pkgver=r47.2953a53
pkgrel=1
pkgdesc='Native GTK3/Cairo desktop widgets for Arch Linux and Wayland'
arch=('x86_64')
url='https://github.com/command-z-z/widgex'
license=('MIT')
depends=('glibc' 'gcc-libs' 'glib2' 'cairo' 'gdk-pixbuf2' 'gtk3' 'gtk-layer-shell')
makedepends=('git' 'rust' 'pkgconf')
checkdepends=('python')
optdepends=(
    'python: Python-based widget data sources and migration tools'
    'jq: JSON shell data sources'
    'ttf-dejavu: fonts for the bundled showcase'
)
provides=('widgex')
conflicts=('widgex')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --workspace
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --workspace
    python -B -m unittest discover -s tools -p 'test_*.py'
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/widgex "$pkgdir/usr/bin/widgex"
    install -Dm755 target/release/widgexd "$pkgdir/usr/bin/widgexd"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/widgex.service "$pkgdir/usr/lib/systemd/user/widgex.service"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
    cp -r docs "$pkgdir/usr/share/doc/$pkgname/"
    install -d "$pkgdir/usr/share/widgex"
    cp -r examples tools "$pkgdir/usr/share/widgex/"
}
