# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=turso
pkgname=$_pkgname-git
pkgver=0.1.0.pre.2.r31.g0e9ee4b8
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
# LTO must be disabled until we find a way to build onig_sys with GCC 15
options=(!lto)
# GCC 14 required until we find a way to build onig_sys with GCC 15
makedepends=(gcc14 cargo libgit2 mimalloc oniguruma)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
b2sums=('SKIP')

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # GCC 14 required until we find a way to build onig_sys with GCC 15
    export CC=gcc-14
    export RUSTFLAGS="${RUSTFLAGS} -l git2 -l mimalloc -l onig"
    cargo build --frozen --release -p turso_cli
}

package() {
    cd "$_pkgname"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}db"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
