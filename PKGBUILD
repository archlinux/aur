pkgname=ppsearch
pkgver=2.5
pkgrel=1
pkgdesc="A Primitive Polynomial Search Program"
url="http://notabs.org/primitivepolynomials/version2/revisionHistory.htm"
makedepends=(p7zip)
arch=('i686' 'x86_64')
license=('GPL')
source=(
    http://notabs.org/primitivepolynomials/version2/2.4/2.4.zip
    http://notabs.org/primitivepolynomials/version2/2.5/factor2n-1.7z
    ppsearch.patch
)

build(){
    cd ${srcdir}/2.4 || return 1

    for i in * ; do tr -d '\15' < $i > tmp && mv tmp $i ; done
    patch < ${srcdir}/ppsearch.patch

    gcc -c -Wall -Wno-unused-function main.c cpudetect.c
    gcc -c -Wall -Wno-unused-function -O3 -mabm ${pkgname}.c -o ${pkgname}-sse.o -march=corei7
    gcc -c -Wall -Wno-unused-function -O3 -mabm ${pkgname}.c -o ${pkgname}-avx.o -march=corei7-avx -DAVX_BUILD
    gcc -lm main.o ${pkgname}-avx.o ${pkgname}-sse.o cpudetect.o -o ${pkgname}
}
package(){
    cd ${srcdir}/2.4 || return 1
    install -m755 -D ${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1
    cd ${srcdir} || return 1
    chmod 00755 "factor2n-1"
    mkdir -p ${pkgdir}/usr/share/${pkgname} || return 1
    cp -a "factor2n-1" ${pkgdir}/usr/share/${pkgname}/ || return 1
}
md5sums=('b1591d0cfb99af193d51a470d16e8abc'
         'cfb920fe2cb33d3bcb69b6ebfce640ef'
         '57eac37e3be0da88601458a38810608e')
