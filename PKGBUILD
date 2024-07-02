# Maintainer: gilcu3
_pkgname=hullcaster
pkgname=$_pkgname-git
pkgver=r327.caf9e5c
pkgrel=1

pkgdesc="Terminal-based TUI podcast manager"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/gilcu3/hullcaster"
license=('GPL3')

depends=('sqlite>=3.23.0' 'openssl>=1.1.0')
makedepends=(
    'cargo'
    'git'
)
options=('!lto')
provides=('hullcaster')
conflicts=('hullcaster')

backup=("etc/${_pkgname}/config.toml")
source=("${_pkgname}::git+https://github.com/gilcu3/${_pkgname}.git#branch=master")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}


pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 ./config.toml "${pkgdir}/etc/${_pkgname}/config.toml"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
