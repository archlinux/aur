# Maintainer: Konstantin Gizdov < arch at kge dot pw >

pkgname=simpletools
pkgver=2.0t.aee4f2f
pkgrel=1
pkgdesc="Handy command line tools for ntuple manipulation and analysis."
arch=('i686' 'x86_64')
url="https://github.com/cofitzpa/simpletools"
license=('GPL2')
provides=('simpletools')
depends=('root')
source=("${pkgname}::git+https://github.com/cofitzpa/simpletools"
        'settings.cmake')
sha256sums=('SKIP'
            '540b86cd9997926026a5d277c819ae9c348bde7921158a78f3c676c855b6ab5e')
options=('!emptydirs')

prepare() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${srcdir}/${pkgname}/build"
    cd "${srcdir}/${pkgname}/build"
    msg2 'Configuring...'
    cmake -C "${srcdir}/settings.cmake" "${srcdir}/${pkgname}"
    # remove wrongly included ELF file
    rm "${srcdir}/${pkgname}/simpletools_tutorial/core.17423"
}

build() {
    cd "${srcdir}/${pkgname}/build"
    msg2 'Compiling...'
    make
}

package() {
    # Package does not define install script
    msg2 'Installing...'
    install -d "${pkgdir}/usr/bin/"
    declare -a bins
    bins=("${srcdir}/${pkgname}"/build/bin/*)
    for bin in "${bins[@]}"; do
        install -Dm755 "${bin}" "${pkgdir}/usr/bin/"
    done
    install -d "${pkgdir}/usr/lib/"
    declare -a libs
    libs=("${srcdir}/${pkgname}"/build/lib/*)
    for lib in "${libs[@]}"; do
        install -Dm755 "${lib}" "${pkgdir}/usr/lib/"
    done
    install -d "${pkgdir}/usr/share/simpletools/tutorial/"
    declare -a tutorials
    tutorials=("${srcdir}/${pkgname}"/simpletools_tutorial/*)
    for tutorial in "${tutorials[@]}"; do
        install -Dm644 "${tutorial}" "${pkgdir}/usr/share/simpletools/tutorial/"
    done
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/simpletools/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}/README" "${pkgdir}/usr/share/doc/simpletools/README"
    install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/simpletools/README.md"
}
