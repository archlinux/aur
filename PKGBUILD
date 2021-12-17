# Arch User repository PKGBUILD file
# Builds the pyshtools library (split file)
# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgbase=python-shtools
pkgname=(shtools-fortran python-shtools)
pkgver=4.9.1
pkgrel=1
pkgdesc="SHTOOLS: Tools for working with spherical harmonics"
arch=('any')
url="https://shtools.oca.eu"
license=('BSD 3-clause')
depends=("fftw" "blas" "lapack")
makedepends=("gcc-fortran")
source=("https://github.com/SHTOOLS/SHTOOLS/archive/v$pkgver.tar.gz" "site.cfg" "Makefile.patch" )
noextract=()
sha256sums=('5c22064f9daf6e9aa08cace182146993aa6b25a6ea593d92572c59f4013d53c2'
            '19a427bf02f65ffc062ad817c3fa1d56ded3b53a362c4d1258e3ed98c840cdb2'
            '579a7ee861ba3841969d4b2e7e7cced23ee819f46e86d2ce629737e7b1b8d55a')

prepare(){
   cd ${srcdir}/SHTOOLS-${pkgver}/
   cp ../site.cfg .
   #patch Makefile so it uses AR/RANLIB
   patch src/Makefile < ../Makefile.patch
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


package_shtools-fortran(){
   provides=(shtools-fortran)
   pkgdesc="Fortran interface for SHTOOLS "
   cd ${srcdir}/SHTOOLS-${pkgver}/
   make fortran fortran-mp
   make DESTDIR="$pkgdir/" PREFIX=usr/ install
   install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
   cd ${_startdir}
}



