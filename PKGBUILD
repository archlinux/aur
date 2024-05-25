# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-git
pkgver=v0.11.23.r1.e9ceade
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
depends=("gcc-libs" "glibc")
makedepends=('git' 'cargo')
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
