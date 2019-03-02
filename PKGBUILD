# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: xpt <user.xpt@gmail.com>
_pkgname=lammps
pkgname=${_pkgname}-beta
pkgver=20190228
_pkgver=$(date -d ${pkgver} +%-d%b%Y)
pkgrel=3
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator"
url="http://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi')
makedepends=('cmake' 'python-sphinx' 'lammpsdoc')
optdepends=('kim-api: support for OpenKIM potentials')
conflicts=('lammps')
provides=('lammps')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/patch_${_pkgver}.tar.gz")
sha512sums=('dc264ec43a5a917a0a7905f89076c2e10e8d5613bb710fb970eb388721860d7d409db7d988803bde823ddd74691c4b3bdf5bf4a72713476dad5a4b0833a4dbd0')

prepare(){
  cd "${_pkgname}-patch_${_pkgver}"
  mkdir -p build
}

build() {
  cd "${_pkgname}-patch_${_pkgver}/build"
  cmake ../cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" #\
        #-DPKG_KIM=yes # KIM package
        # Add options for additional packages
        #-DPKG_<NAME>=yes

  make

  # The rest of this script generates the documentation
  # If you don't want that, comment out the rest of this build() section
  # as well as the 'install' line in package()
  # Also remove 'python-sphinx' & 'lammpsdoc' from makedepends()

  # Generate ReStructuredText from Text files
  mkdir -p rst

  for file in ../doc/src/*.txt
  do
    tmp=${file%.*} # Strips the '.txt' extension
    fname=${tmp##*/} # Strips the path prefixing the file-name
    txt2rst ${file} > "rst/${fname}.rst"
  done

  # Generate HTML from ReStructuredText files
  mkdir -p html
  cp -r ../doc/src/* rst/

  sphinx-build -b html -c "../doc/utils/sphinx-config" -d "doctrees" "rst" html
}

package() {
  cd "${_pkgname}-patch_${_pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html" "html/"*.html
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html" "html/"*.js
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_images" "html/_images/"*
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static" "html/_static/"*.png
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static" "html/_static/"*.gif
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static" "html/_static/"*.js
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/css" "html/_static/css/"*.css
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/fonts" "html/_static/fonts/"*
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/js" "html/_static/js/"*.js
}
