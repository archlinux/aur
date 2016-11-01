# Maintainer: fenuks

_pkgname=solidoak
pkgname=${_pkgname}-git
pkgver=0.1.3.51.g60d5bc0
pkgrel=1
pkgdesc="An IDE for Rust"
arch=("x86" "x86_64")
url="https://sekao.net/solidoak/"
license=("custom:Public Domain")
depends=("gcc-libs-multilib" "vte3")
makedepends=("git" "cargo" "rust")  
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# install=$pkgname.install
source=("${_pkgname}::git+https://github.com/oakes/SolidOak"
        "soak::git+https://github.com/oakes/soak.git"
)

sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags | sed "s/-/./g"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    git submodule init
    git config --file=.gitmodules submodule.resources/soak.url "${srcdir}/soak"
    git submodule update
}


build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cargo install --root "${pkgdir}/usr"
    rm -f "${pkgdir}/usr/.crates.toml"
}
