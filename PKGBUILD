# Maintainer: Konstantin Gizdov < arch at kge dot pw >

pkgname=simpletools
pkgver=3.0
pkgrel=1
pkgdesc="Handy command line tools for ntuple manipulation and analysis"
arch=('i686' 'x86_64')
url="https://github.com/cofitzpa/simpletools"
license=('GPL2')
makedepends=('cmake' 'git')
depends=('boost' 'root')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cofitzpa/simpletools/archive/v${pkgver}.tar.gz"
        'settings.cmake')
sha256sums=('SKIP'
            '540b86cd9997926026a5d277c819ae9c348bde7921158a78f3c676c855b6ab5e')

build() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    CFLAGS="${CFLAGS}" \
    CXXFLAGS="${CXXFLAGS}" \
    LDFLAGS="${LDFLAGS}" \
    cmake -C "${srcdir}/settings.cmake" "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    # install tutorials
    install -d "${pkgdir}/usr/share/simpletools/tutorial/"
    declare -a tutorials
    tutorials=("${srcdir}/${pkgname}-${pkgver}"/simpletools_tutorial/*)
    for tutorial in "${tutorials[@]}"; do
        install -Dm644 "${tutorial}" "${pkgdir}/usr/share/simpletools/tutorial/"
    done

    # install docs & license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/simpletools/README.md"
}
