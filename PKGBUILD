# Maintainer: realasking <realasking@outlook.com>

_pkgname=atomsk
pkgname=${_pkgname}-git
pkgver=r354.8aba225
pkgrel=1
pkgdesc="Package for Atomsk"
url="https://atomsk.univ-lille.fr/"
arch=('x86_64')
license=('GPL')
depends=('gcc' 'make' 'gcc-fortran' 'lapack' 'blas' 'openmp')
makedepends=('make')
conflicts=('atomsk')
provides=('atomsk')
source=('git+https://github.com/pierrehirel/atomsk.git')
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p ${srcdir}/atomsk/${_pkgname}
    cp -r ${srcdir}/atomsk/src ${srcdir}/atomsk/${_pkgname}
}

build() {
    cd ${srcdir}/atomsk/${_pkgname}/src
    make atomsk
    chmod +x atomsk
    cd ${srcdir}/atomsk/man
    gzip -c atomsk > atomsk.1.gz
    cd ${srcdir}/atomsk/tools
    chmod +x *.sh
}

package() {
    cd ${srcdir}/atomsk/${_pkgname}/src
    mkdir -p ${pkgdir}/usr/bin
    cp atomsk ${pkgdir}/usr/bin
    cd ${srcdir}/atomsk/tools
    cp *.sh ${pkgdir}/usr/bin
    #for i in *.sh
    #do
    #	install -Dm755 $i ${pkgdir}/usr/bin
    #done
    cd ${srcdir}/atomsk/man
    install -Dm644 atomsk.1.gz ${pkgdir}/usr/share/man/man1
    cd ${srcdir}/atomsk/etc
    mkdir -p ${pkgdir}/etc
    cp atomsk.conf ${pkgdir}/etc
    #install -Dm644 atomsk.conf ${pkgdir}/etc
    cd ${srcdir}/atomsk/doc
    mkdir -p ${pkgdir}/usr/share/doc/atomsk
    cp -r * ${pkgdir}/usr/share/doc/atomsk
}
