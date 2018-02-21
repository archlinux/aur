# Maintainer: Konstantin Gizdov < arch at kge dot pw >

pkgname=simpletools
pkgver=2.0v.e574cc8
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


package() {
    # make install target is lost if done in prepare() or build()
    # do everything here...
    mkdir -p "${srcdir}/${pkgname}/build"
    install -d "${pkgdir}/usr/lib/"
    cd "${srcdir}/${pkgname}/build"
    msg2 'Configuring...'
    cmake -C "${srcdir}/settings.cmake" "${srcdir}/${pkgname}"
    msg2 'Compiling & Installing...'
    make DESTDIR="${pkgdir}" install

    # install tutorials
    install -d "${pkgdir}/usr/share/simpletools/tutorial/"
    declare -a tutorials
    tutorials=("${srcdir}/${pkgname}"/simpletools_tutorial/*)
    for tutorial in "${tutorials[@]}"; do
        install -Dm644 "${tutorial}" "${pkgdir}/usr/share/simpletools/tutorial/"
    done

    # install docs & license
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/simpletools/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/simpletools/README.md"
}
