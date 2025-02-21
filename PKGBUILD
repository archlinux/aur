# Arch User repository PKGBUILD file
# Builds the pyshtools library (split file)
# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgbase=python-shtools
pkgname=(shtools python-shtools)
pkgver=4.13.1
pkgrel=1
pkgdesc="SHTOOLS: Tools for working with spherical harmonics"
arch=('any')
url="https://shtools.github.io/SHTOOLS/"
license=('BSD 3-clause')
depends=("fftw" "blas" "lapack")
makedepends=("gcc-fortran" "meson" "cmake")
source=("https://github.com/SHTOOLS/SHTOOLS/archive/v$pkgver.tar.gz" ) 
sha256sums=('d5890049fb915604f25576cbbb9f18980a3fc88d28fe380809e3c3497448dacb')


prepare(){
   cd ${srcdir}/SHTOOLS-${pkgver}/
   #We need to explicitly add the version to pyproject.toml because we're not working from the git tree
   sed -i -e "/\[project\]/a version = \"${pkgver}\"" -e "/^dynamic/,+3d" pyproject.toml
   
   #create a temporary pip environment for building the package
   cd ${_startdir}
}


package_python-shtools() {
   provides=(python-shtools)
   pkgdesc="Python interface for SHTOOLS (pyshtools)"
   depends+=( "python-numpy" "python-astropy" "python-pooch" "python-xarray" )
   cd ${srcdir}/SHTOOLS-${pkgver}/
   #create a temporary pip enviroment for building the python package
   python -m venv pyshtmp
   pyshtmp/bin/pip install --root "${pkgdir}" --no-deps --prefix=usr --config-settings=setup-args="-Dblas=blas" --config-settings=setup-args="-Dlapack=lapack" . 
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



