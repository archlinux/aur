# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=turso
pkgname=$_pkgname-git
pkgver=0.8.0.pre.1.r92.g79fa487fa
pkgrel=1
pkgdesc='An in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
options=(!lto)
depends=(glibc libgcc)
makedepends=(cargo git libaegis libgit2 mimalloc simsimd)
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
    export RUSTONIG_SYSTEM_LIBONIG=1
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS} -l aegis -l git2 -l mimalloc -l simsimd"
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
