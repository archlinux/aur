# Maintainer: anon at sansorgan.es 
pkgbase=dune-core
pkgname=('dune-common' 'dune-geometry' 'dune-localfunctions' 'dune-istl' 'dune-grid' 'dune-uggrid')
pkgver=2.7.1
pkgrel=1
pkgdesc='Core modules of the DUNE framework'
groups=('dune')
url='http://www.dune-project.org'

arch=('i686' 'x86_64')
license=('custom')

makedepends=('cmake' 'gcc-fortran' 'openmpi' 'gmp' 'lapack' 'boost' 'superlu' 'suitesparse'
    'parmetis' 'psurface' 'python' 'bash' 'libtirpc-compat')

export CPPFLAGS="-I/usr/include/tirpc ${CPPFLAGS}"
export CFLAGS="-fPIC ${CFLAGS}"
export CXXFLAGS="-fPIC ${CFLAGS}" 

for _module in "${pkgname[@]}"; do
    source+=("http://www.dune-project.org/download/${pkgver}/${_module}-${pkgver}.tar.gz")
done

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
    CMAKE_FLAGS='-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -fPIC -DBUILD_SHARED_LIBS:BOOL=OFF -I/usr/include/tirpc' \
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

md5sums=('8c789975f762066d5bffc02085ac3eda'
         '57bfac1eb1b08b2e6601907664797609'
         'b3adbb0e960f2f27f3e6cb825ec5ac42'
         '7ece14f349d76c9df10bf784c1bc686b'
         'c739c3dfce1d4d7f93bea58963e4681d'
         '597cbd936908506bfd0392b1dd0edbe8')
