# Maintainer: anon at sansorgan.es 
pkgbase=dune-core
pkgname=('dune-common' 'dune-geometry' 'dune-localfunctions' 'dune-istl' 'dune-grid' 'dune-uggrid')
pkgver=2.6.0
pkgrel=1
pkgdesc='Core modules of the DUNE framework'
groups=('dune')
url='http://www.dune-project.org'

arch=('i686' 'x86_64')
license=('custom')

makedepends=('cmake' 'gcc-fortran' 'openmpi' 'gmp' 'lapack' 'boost' 'superlu' 'suitesparse'
    'parmetis' 'psurface' 'python' 'bash')

export CPPFLAGS="-I/usr/include/tirpc ${CPPFLAGS}"
export CFLAGS="-fPIC ${CFLAGS}"
export CXXFLAGS="-fPIC ${CFLAGS}" 

for _module in "${pkgname[@]}"; do
    source+=("http://www.dune-project.org/download/${pkgver}/${_module}-${pkgver}.tar.gz")
done

md5sums=('fb21de7469a2c2cbff6ec7439891c7d6'
         '51e531ca30e8ef9b5aa910552ee88310'
         'e35a5417c4febaef25ab31be135feccc'
         'b0e37fafc5de204d4750dad18f46dacd'
         '5902f456197f0b8301b822386ce78260'
         'c9d2736ce16a9af6296bc83837192ea3')

_dunecontrol="./dune-common-${pkgver}/bin/dunecontrol"

#prepare() {
#    cd "dune-istl-${pkgver}"

#    patch -p1 -i ../../avoid-boost-fusion-1.61.patch
#}

make_package() {
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

    make_package
}

package_dune-geometry() {
    pkgdesc='Reference elements with corresponding mappings and quadratures'

    make_package
}

package_dune-localfunctions() {
    pkgdesc='Shape functions, interpolation operators on DUNE reference elemements'
    arch=('any')

    make_package
}

package_dune-istl() {
    pkgdesc='Iterative solver template library'
    arch=('any')

    make_package
}

package_dune-grid() {
    pkgdesc='Nonconforming, hierarchically nested, multi-element-type, parallel grids'
    arch=('any')
    make_package
}

package_dune-uggrid() {
    pkgdesc='UG grid manager'
    arch=('any')
    make_package
}


#package_dune-alugrid() {
#    pkgdesc='Unstructured simplicial and cube DUNE grids'
#    arch=('any')
#
#    package
#}
#package_dune-functions() {
#    pkgdesc='Needed to build core dune modules'
#    arch=('any')
#
#    package
#}

