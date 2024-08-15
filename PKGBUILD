# Maintainer: Alejandro Osornio <aoxo.contact@gmail.com>
pkgname=tinymist-git
_pkgname=tinymist
pkgver=v0.11.19.r4.g1295c87
pkgrel=1
pkgdesc="An integrated language service for Typst"
arch=('any')
url="https://github.com/Myriad-Dreamin/tinymist"
license=('Apache-2.0')
options=('strip' '!lto' '!debug')
provides=('tinymist')
conflicts=('tinymist-bin')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cargo-insta' 'git')
source=("git+https://github.com/Myriad-Dreamin/${_pkgname}")
sha256sums=('SKIP')


pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_srcenv() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

prepare() {
	_srcenv
    cd "${_pkgname}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	_srcenv
    cd "${_pkgname}"
    cargo build --frozen --bin tinymist --release
}

check() {
	_srcenv
    cd "${_pkgname}"
    # See https://github.com/Myriad-Dreamin/tinymist/blob/main/CONTRIBUTING.md
    cargo insta test -p tinymist-query --accept
    ./scripts/e2e.sh
}


package() {
    cd "${_pkgname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
