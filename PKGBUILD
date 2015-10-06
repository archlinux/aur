pkgname=ppsearch
pkgver=2.6
pkgrel=1
pkgdesc="A Primitive Polynomial Search Program"
url="http://notabs.org/primitivepolynomials/version2/revisionHistory.htm"
makedepends=(p7zip)
arch=('i686' 'x86_64')
license=('GPL')
source=(
    http://notabs.org/primitivepolynomials/version2/2.6/2.6.7z
    ppsearch.patch
)
md5sums=(
    'd63dd8bb0fc25165113711aa7830d2d6'
    '57eac37e3be0da88601458a38810608e'
)

prepare(){
    7z x -y "2.6.7z"
    chmod 00755 "2.6/factor2n-1"
    cd "2.6/source/2.4"
    for i in * ; do tr -d '\r' < $i > tmp ; mv tmp $i ; done
    patch < "${srcdir}/ppsearch.patch"
}

build(){
    cd "2.6/source/2.4"

    gcc -c -Wall -Wno-unused-function main.c cpudetect.c
    gcc -c -Wall -Wno-unused-function -O3 -mabm ppsearch.c -o ppsearch-sse.o -march=corei7
    gcc -c -Wall -Wno-unused-function -O3 -mabm ppsearch.c -o ppsearch-avx.o -march=corei7-avx -DAVX_BUILD
    gcc -lm main.o ppsearch-avx.o ppsearch-sse.o cpudetect.o -o ppsearch
}

package(){
    install -m755 -D "2.6/source/2.4/ppsearch" "${pkgdir}/usr/bin/ppsearch"
    mkdir -p "${pkgdir}/usr/share/ppsearch"
    cp -a "2.6/factor2n-1" "${pkgdir}/usr/share/ppsearch/"
}
