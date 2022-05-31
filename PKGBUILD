# Maintainer: Hannah
# Maintainer: FabioLolix
# Contributor: J.D. Broberg <jdbroberg72 at gmail dot com>

pkgname=odin-git
_pkgname=odin
pkgver=r6557.a1f15c2c
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=(x86_64)
url="https://github.com/odin-lang/odin"
license=(BSD)
depends=(glibc llvm-libs ncurses)
makedepends=(git clang llvm)
provides=(odin)
conflicts=(odin)

source=("git+https://github.com/odin-lang/odin.git"
        '0001-use-llvm13.patch')

sha256sums=('SKIP'
            '4e0e571d4067975f0405564d7110d67092549a213a3012ff3a42f93efffda84f')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    #patch --forward --strip=1 --input="${srcdir}/0001-use-llvm13.patch"
    sed -i "s/linux\/libraylib.a/system:raylib/g" "vendor/raylib/raylib.odin"
    make release
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
