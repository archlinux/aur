# Maintainer: zefr0x < Matrix: "@zer0-x:kde.org" >

pkgname="ianny-git"
_pkgname=${pkgname%-git}
pkgver=0.1.0alpha.1
pkgrel=2
pkgdesc="Desktop utility periodically informing the user to take breaks"
arch=("x86_64")
url="https://github.com/zefr0x/ianny"
license=("GPL3")
depends=("libdbus-1.so")
makedepends=("cargo" "meson")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

pkgver() {
    cd "${pkgname}"

    git describe --tags --abbrev=0 --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"

    git reset --hard "$(git describe --tags --abbrev=0 --match 'v*')"

    arch-meson build
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    meson compile -C build
}

package() {
    cd "${pkgname}"

    meson install -C build --destdir "${pkgdir}"
}
