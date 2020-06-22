# Maintainer: Konstantin Gizdov < arch at kge dot pw >

pkgname=simpletools
_commit=8e38d80
pkgver=2.0v.${_commit}
pkgrel=1
pkgdesc="Handy command line tools for ntuple manipulation and analysis"
arch=('i686' 'x86_64')
url="https://github.com/cofitzpa/simpletools"
license=('GPL2')
makedepends=('cmake' 'git')
depends=('boost' 'root')
source=("${pkgname}::git+https://github.com/cofitzpa/simpletools#commit=${_commit}"
        'settings.cmake')
sha256sums=('SKIP'
            '540b86cd9997926026a5d277c819ae9c348bde7921158a78f3c676c855b6ab5e')


prepare() {
    mkdir -p "${srcdir}/${pkgname}/build"
    cd "${srcdir}/${pkgname}/build"

    CFLAGS="${CFLAGS}" \
    CXXFLAGS="${CXXFLAGS}" \
    LDFLAGS="${LDFLAGS}" \
    cmake -C "${srcdir}/settings.cmake" "${srcdir}/${pkgname}"
}

build() {
    cd "${srcdir}/${pkgname}/build"
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="${pkgdir}" install

    # install tutorials
    install -d "${pkgdir}/usr/share/simpletools/tutorial/"
    declare -a tutorials
    tutorials=("${srcdir}/${pkgname}"/simpletools_tutorial/*)
    for tutorial in "${tutorials[@]}"; do
        install -Dm644 "${tutorial}" "${pkgdir}/usr/share/simpletools/tutorial/"
    done

    # install docs & license
    install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/simpletools/README.md"
}
