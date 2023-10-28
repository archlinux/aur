# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Xyne <ca dot archlinux at xyne, backwards>

pkgname=qd-fix
_pkgname=qd
pkgver=2.3.23
pkgrel=1
pkgdesc='C++/Fortran-90 double-double and quad-double library (fixed by spherical_geometry)'
arch=(x86_64)
url='https://crd-legacy.lbl.gov/~dhbailey/mpdist'
license=('BSD')
makedepends=('gcc-fortran')
source=("https://crd-legacy.lbl.gov/~dhbailey/mpdist/${_pkgname}-${pkgver}.tar.gz"
        'fix-accuracy-in-angle-computation.patch')
sha256sums=('b3eaf41ce413ec08f348ee73e606bd3ff9203e411c377c3c0467f89acf69ee26'
            '0e6a2644559c76934ed659d6b89d295c92087c55b1c2f6479457221304f1fa10')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-accuracy-in-angle-computation.patch"
}

build() {
    cd ${_pkgname}-${pkgver}

    export FC=gfortran
    ./configure --prefix=/usr --enable-shared
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    cd ${_pkgname}-${pkgver}

    make check
}

package() {
    provides=("${_pkgname}=${pkgver}")
    conflicts=("${_pkgname}")
    cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
