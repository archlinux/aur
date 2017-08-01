# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgbase=dune-core
pkgname=('dune-common' 'dune-geometry' 'dune-localfunctions' 'dune-istl' 'dune-grid' 'dune-uggrid' )

pkgver=2.5.1
pkgrel=3

pkgdesc='Core modules of the DUNE framework'
groups=('dune')
url='http://www.dune-project.org'

arch=('i686' 'x86_64')
license=('custom')

makedepends=('cmake' 'gcc-fortran' 'openmpi' 'gmp' 'lapack' 'boost' 'superlu' 'suitesparse'
    'parmetis' 'alberta=3.0.1' 'psurface' )


export CFLAGS="-fPIC ${CFLAGS}"
export CXXFLAGS="-fPIC ${CFLAGS}" 

for _module in "${pkgname[@]}"; do
    source+=("http://www.dune-project.org/download/${pkgver}/${_module}-${pkgver}.tar.gz")
done

md5sums=('71676b07bd489321d9f67b2d77d9f2d6'
         '3d0ea46cad71c5087f304f462ccc5068'
         'a4a6d31714d9a46ac8be2ad8303e4531'
         'b16be825d8f0c2acdfdebde91894c6ef'
         '8394d8aa7811f4a548df6449b448796a'
         '4ce8cf2291fe12454695c3d94e195310')

_dunecontrol="./dune-common-${pkgver}/bin/dunecontrol"

prepare() {
    cd "dune-istl-${pkgver}"

#    patch -p1 -i ../../avoid-boost-fusion-1.61.patch
}

package() {
    $_dunecontrol --only=${pkgname} make install DESTDIR="${pkgdir}"

    install -m644 -D ${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find "${pkgdir}" -type d -empty -delete
}

build() {
    CMAKE_FLAGS='-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -fPIC -DBUILD_SHARED_LIBS:BOOL=OFF' \
        $_dunecontrol configure --enabled-shared

    $_dunecontrol make
}

package_dune-common() {
    pkgdesc='Basic classes used by all DUNE modules'
    depends=('bash' 'python')

    package
}

package_dune-geometry() {
    pkgdesc='Reference elements with corresponding mappings and quadratures'

    package
}

package_dune-localfunctions() {
    pkgdesc='Shape functions, interpolation operators on DUNE reference elemements'
    arch=('any')

    package
}

package_dune-grid() {
    pkgdesc='Nonconforming, hierarchically nested, multi-element-type, parallel grids'
    arch=('any')
    package
}

package_dune-uggrid() {
    pkgdesc='UG grid manager'
    arch=('any')
    package
}

package_dune-istl() {
    pkgdesc='Iterative solver template library'
    arch=('any')

    package
}

package_dune-alugrid() {
    pkgdesc='Unstructured simplicial and cube DUNE grids'
    arch=('any')

    package
}
