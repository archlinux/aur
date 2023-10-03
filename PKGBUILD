# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

_gitname=st
_pkgname=${_gitname}e
pkgname=${_pkgname}-git
pkgver=r31.1d4e4ca
pkgrel=1
pkgdesc="Command Space-Time explorer"
arch=(x86_64)
url="https://github.com/fabiensanglard/st"
license=(MIT)
depends=(
    gcc-libs
)
makedepends=(
    clang
    git
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"

    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_gitname}"
    export CC=clang
    export CXX=clang++
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    # setuid
    install -Dm4755 bin/${_pkgname} -t "$pkgdir"/usr/bin

    # license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
