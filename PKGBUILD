# Maintainer: Hannah
# Maintainer: FabioLolix
# Contributor: J.D. Broberg <jdbroberg72 at gmail dot com>

pkgname=odin-git
_pkgname=odin
pkgver=r14484.e228ef221
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=(x86_64)
url="https://github.com/odin-lang/odin"
license=(BSD)
depends=(glibc llvm-libs)
makedepends=(git clang llvm cmake)
options=(staticlibs)
checkdepends=(python)
optdepends=(python)
provides=(odin)
conflicts=(odin)
source=("git+https://github.com/odin-lang/odin.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    make release
}

check() {
    cd "${_pkgname}"

    make -C vendor/stb/src
    make -C vendor/cgltf/src
    make -C vendor/miniaudio/src

    CC=clang LD=wasm-ld vendor/box2d/build_box2d.sh

    ./odin check examples/all -strict-style

    TZ='America/New_York' ./odin test tests/core/normal.odin -debug -file -all-packages -define:ODIN_TEST_FANCY=false
    ./odin test tests/core/speed.odin -o:speed -file -all-packages -define:ODIN_TEST_FANCY=false
    ./odin test tests/vendor -all-packages -define:ODIN_TEST_FANCY=false
    ./odin test tests/internal -all-packages -define:ODIN_TEST_FANCY=false
}

package() {
    cd "${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    cp odin "${pkgdir}/usr/lib/${_pkgname}/odin"
    cp -r core "${pkgdir}/usr/lib/${_pkgname}/core"
    cp -r base "${pkgdir}/usr/lib/${_pkgname}/base"
    ln -s "/usr/lib/${_pkgname}/odin" "${pkgdir}/usr/bin/odin"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r examples "${pkgdir}/usr/share/doc/${_pkgname}/examples"
    cp -r vendor "${pkgdir}/usr/lib/${_pkgname}/vendor"
}
