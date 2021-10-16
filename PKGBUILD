# Maintainer: Hannah
# Maintainer: FabioLolix
# Contributor: J.D. Broberg <jdbroberg72 at gmail dot com>

pkgname=odin-git
_pkgname=odin
pkgver=r4802.3337d386
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=(x86_64)
url="https://github.com/odin-lang/odin"
license=(BSD)
depends=(glibc ncurses)
makedepends=(git clang+llvm-binaries)
provides=(odin)
conflicts=(odin)

source=("git+https://github.com/odin-lang/odin.git"
        "0001-use-clang-llvm11-binaries-package-to-build-odin.patch")

sha256sums=("SKIP"
            "3aebc01fa0852ca9d14364558d6461b6211d7729010f2858ee591e240599a2fd")

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    patch --forward --strip=1 --input="${srcdir}/0001-use-clang-llvm11-binaries-package-to-build-odin.patch"
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
