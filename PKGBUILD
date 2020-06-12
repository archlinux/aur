# Maintainer: Daniel <kingdread {at} gmx {period} de>
pkgname=candy-kingdom-git
_pkgname=candy-kingdom
pkgver=r1388.e44ef54
pkgrel=1
pkgdesc="A collection of SAT solvers and tools for structure analysis in SAT problems."
arch=("x86_64")
url="https://github.com/Udopia/candy-kingdom"
license=("MIT")
makedepends=("cmake" "git")
depends=("gcc-libs" "zlib")
source=(
    "${_pkgname}::git+https://github.com/Udopia/candy-kingdom.git#branch=master"
)
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    git submodule init
    git submodule set-url -- lib/oscpack https://github.com/Udopia/oscpack.git
    git submodule update
}

build() {
    mkdir -p "${_pkgname}/build"
    cd "${_pkgname}/build"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_BUILD_RPATH=1 ..
    make candy
}

package() {
    cd "${_pkgname}"
    install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
    cd "build"
    install -Dm 755 candy "${pkgdir}/usr/bin/candy"
    install -Dm 644 libcandylib.a "${pkgdir}/usr/lib/libcandylib.a"
}
