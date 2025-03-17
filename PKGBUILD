# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=cgpbigwig-bg2bw-static
_pkgname=cgpBigWig
pkgver=1.7.0
_libver=0.4.8
pkgrel=1
pkgdesc="BigWig manipulation tools using libBigWig - Targeted static build of bg2bw"
arch=("x86_64")
url="https://github.com/cancerit/cgpBigWig"
license=("AGPL3"
         "MIT")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cancerit/cgpBigWig/archive/${pkgver}.tar.gz"
        "libBigWig-${_libver}.tar.gz::https://github.com/dpryan79/libBigWig/archive/refs/tags/${_libver}.tar.gz"
        "htslib.patch"
        "cast.patch")
sha256sums=('d1dff8cdf35b8ffa231b999e79c44f8a4897e469224652da50d2a116c45b2b8b'
            '10e904ea6eab4c9926dd938050af888bebe6281e8d933237e4a254cb9d3063b1'
            'cd4874026aed058886facf581642e1819fcb5b1cbe90d82ae115c65c04a0eab6'
            '021989276724809124196d244306de07ae3c7cb88ea6d640e7b0346b1310f32e')

prepare() {
    # Compile libBigWig
    cd "${srcdir}/libBigWig-${_libver}"
    mkdir build
    cd build
    cmake -DWITH_CURL=OFF ..
    make

    # Apply patches
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/htslib.patch"
    patch -p1 -i "${srcdir}/cast.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/c"

    _version=$(cat ../VERSION.txt)
    gcc -O3 -DVERSION="\"$_version\"" -Wall -c utils.c -o utils.o
    gcc -O3 -DVERSION="\"$_version\"" -Wall bg2bw.c utils.o -I "${srcdir}/libBigWig-${_libver}" -L "${srcdir}/libBigWig-${_libver}/build" -lBigWig -lm -lz -static -o bg2bw
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/c/bg2bw" "$pkgdir/usr/bin/bg2bw"
}
