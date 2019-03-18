# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: xpt <user.xpt@gmail.com>

### BUILD OPTIONS
# Set these variables to '1' to enable them
# Doing so will add the requisite build commands,
# as well as add the needed dependencies

# HTML documentation
_BUILD_DOC=0
# KIM package
_ENABLE_KIM=0

pkgname=lammps
pkgver=20181212
_pkgver="12Dec2018"
#_pkgver=$(date -d ${pkgver} +%-d%b%Y)
pkgrel=3
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator"
url="https://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi')
makedepends=('cmake')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/stable_${_pkgver}.tar.gz")
sha512sums=('0245576b592d93225daab9e01f82ef2fc0212a4f4df63ecf1fe58b364b2abe2c2a142f7b33a742dbd785cb19f06af7f9522a4bedbe510d26445d2e76c0015c09')

# process the build settings from above
if (( $_BUILD_DOC )); then
    makedepends+=('python-sphinx' 'lammpsdoc')
fi
if (( $_ENABLE_KIM )); then
    depends+=('kim-api')
    _feature_args+=('-DPKG_KIM=yes')
fi

prepare(){
  cd "${pkgname}-stable_${_pkgver}"
  mkdir -p build
}

build() {
  cd "${pkgname}-stable_${_pkgver}/build"
  cmake ../cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" \
        "${_feature_args[@]}" #\
        # Add options for additional packages
        #-DPKG_<NAME>=yes

  make

  if (( $_BUILD_DOC )) ; then
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
  fi
}

package() {
  cd "${pkgname}-stable_${_pkgver}/build"
  make DESTDIR="${pkgdir}" install
  if (( $_BUILD_DOC )) ; then
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html" "html/"*.html
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html" "html/"*.js
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html/_images" "html/_images/"*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html/_static" "html/_static/"*.png
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html/_static" "html/_static/"*.gif
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html/_static" "html/_static/"*.js
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html/_static/css" "html/_static/css/"*.css
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html/_static/fonts" "html/_static/fonts/"*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/html/_static/js" "html/_static/js/"*.js
  fi
}
