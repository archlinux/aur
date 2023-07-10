# Arch User repository PKGBUILD file
# Builds the pyshtools library (split file)
# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgbase=python-shtools
pkgname=(shtools python-shtools)
pkgver=4.10.3
pkgrel=0
pkgdesc="SHTOOLS: Tools for working with spherical harmonics"
arch=('any')
url="https://shtools.oca.eu"
license=('BSD 3-clause')
depends=("fftw" "blas" "lapack")
makedepends=("gcc-fortran" "python-setuptools")
source=("https://github.com/SHTOOLS/SHTOOLS/archive/v$pkgver.tar.gz" "site.cfg" )
noextract=()
sha256sums=('ff630d6eeea73891c8c50bc73ad1c8539b7a0b5095449fbad1554493c4714d1e'
            '19a427bf02f65ffc062ad817c3fa1d56ded3b53a362c4d1258e3ed98c840cdb2')
prepare(){
   cd ${srcdir}/SHTOOLS-${pkgver}/
   cp ../site.cfg .
   cd ${_startdir}
}


package_python-shtools() {
   provides=(python-shtools)
   pkgdesc="Python interface for SHTOOLS (pyshtools)"
   depends+=( "python-numpy" "python-astropy" "python-pooch" "python-xarray" )
   cd ${srcdir}/SHTOOLS-${pkgver}/
   python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 
   cd ${_startdir}
}


package_shtools(){
   provides=(shtools)
   pkgdesc="Fortran interface for SHTOOLS "
   cd ${srcdir}/SHTOOLS-${pkgver}/
   export MAKEFLAGS="-j1"
   make fortran fortran-mp
   make DESTDIR="$pkgdir/" PREFIX=usr/ install
   install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
   cd ${_startdir}
}



