# Maintainer: Hannah
# Maintainer: FabioLolix
# Contributor: J.D. Broberg <jdbroberg72 at gmail dot com>

pkgname=odin-git
_pkgname=odin
pkgver=r8682.5ac7fe453
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=(x86_64)
url="https://github.com/odin-lang/odin"
license=(BSD)
depends=(glibc llvm14-libs)
makedepends=(git clang llvm14 clang14)
checkdepends=(python)
optdepends=(python java-runtime)
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
    #sed -i "s/linux\/libraylib.a/system:raylib/g" "vendor/raylib/raylib.odin"
    export LLVM_CONFIG=llvm-config-14
    export CXX=/usr/lib/llvm14/bin/clang++
    make release
}

check() {
    cd "${_pkgname}"
    ./odin check examples/all -strict-style

    cd tests/core
    make

    cd ../internal
    make
}

package() {
    cd "${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    cp odin "${pkgdir}/usr/lib/${_pkgname}/odin"
    cp -r core "${pkgdir}/usr/lib/${_pkgname}/core"
    ln -s "/usr/lib/${_pkgname}/odin" "${pkgdir}/usr/bin/odin"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r examples "${pkgdir}/usr/share/doc/${_pkgname}/examples"
    cp -r vendor "${pkgdir}/usr/lib/${_pkgname}/vendor"
}
