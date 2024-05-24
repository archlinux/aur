# Arch User repository PKGBUILD file
# Builds the pyshtools library (split file)
# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgbase=python-shtools
pkgname=(shtools python-shtools)
pkgver=4.12.2
pkgrel=0
pkgdesc="SHTOOLS: Tools for working with spherical harmonics"
arch=('any')
url="https://shtools.github.io/SHTOOLS/"
license=('BSD 3-clause')
depends=("fftw" "blas" "lapack")
makedepends=("gcc-fortran" "meson")
source=("https://github.com/SHTOOLS/SHTOOLS/archive/v$pkgver.tar.gz" )
sha256sums=('dcbc9f3258e958e3c8a867ecfef3913ce62068e0fa6eca7eaf1ee9b49f91c704')


prepare(){
   cd ${srcdir}/SHTOOLS-${pkgver}/
   #i We need to explicitly add the version to pyproject.toml because we're not working from the git tree
   sed -i -e "/\[project\]/a version = \"${pkgver}\"" -e "/^dynamic/,+3d" pyproject.toml
   cd ${_startdir}
}


package_python-shtools() {
   provides=(python-shtools)
   pkgdesc="Python interface for SHTOOLS (pyshtools)"
   depends+=( "python-numpy" "python-astropy" "python-pooch" "python-xarray" )
   cd ${srcdir}/SHTOOLS-${pkgver}/
   pip install --root "${pkgdir}" --no-deps --prefix=usr . 
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



