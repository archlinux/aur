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
# Use Intel compilers
_ENABLE_INTEL_COMPILER=0
# USER-INTEL package
_ENABLE_INTEL=0
# USER-OMP package
_ENABLE_OMP=0

_pkgname=lammps
pkgname=${_pkgname}-beta
pkgver=20190430
_pkgver="30Apr2019"
#_pkgver=$(date -d ${pkgver} +%-d%b%Y)
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator"
url="https://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi')
makedepends=('cmake')
conflicts=('lammps')
provides=('lammps')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/patch_${_pkgver}.tar.gz"
        "intel_pkg.patch::https://github.com/${_pkgname}/${_pkgname}/commit/d7da1db745128ed3c10c78d73613f88a8ed6a492.patch")
sha512sums=('dc520c70d008468555a843765f7abcf9fca74bad901b05c0d4240ba95189ee0e048e955148ada913042d5d275aa6a58ac65389835f3dbc84546c9e3f613abdd6'
            '3e573841275a44d3f7a4a8fdb13eb0223a02ca41eb30ba852977f3ca629490c72cef35240c2c4962974e6ff25f6a7723ec8ea52551b5493971eba12d0f363beb')

# process the build settings from above
if (( $_ENABLE_INTEL_COMPILER )); then
    _feature_args+=('-DCMAKE_C_COMPILER=icc')
    _feature_args+=('-DCMAKE_C_FLAGS=-xHost -O3 -fp-model fast=2 -no-prec-div -qoverride-limits -qopt-zmm-usage=high -qno-offload -fno-alias -ansi-alias -restrict')
    _feature_args+=('-DCMAKE_CXX_COMPILER=icpc')
    _feature_args+=('-DCMAKE_CXX_FLAGS=-xHost -O3 -fp-model fast=2 -no-prec-div -qoverride-limits -qopt-zmm-usage=high -qno-offload -fno-alias -ansi-alias -restrict')
    _feature_args+=('-DCMAKE_Fortran_COMPILER=ifort')
fi
if (( $_BUILD_DOC )); then
    makedepends+=('python-sphinx' 'lammpsdoc')
fi
if (( $_ENABLE_KIM )); then
    depends+=('kim-api>=2.0.2')
    _feature_args+=('-DPKG_KIM=yes')
fi
if (( $_ENABLE_INTEL )); then
    _feature_args+=('-DINTEL_ARCH=cpu')
    _feature_args+=('-DPKG_USER-INTEL=yes')
fi
if (( $_ENABLE_OMP )); then
    _feature_args+=('-DBUILD_OMP=yes')
    _feature_args+=('-DPKG_USER-OMP=yes')
fi

prepare(){
  cd "${_pkgname}-patch_${_pkgver}"
  patch --strip=1 -i ../intel_pkg.patch
  mkdir -p build
}

build() {
  cd "${_pkgname}-patch_${_pkgver}/build"
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
  cd "${_pkgname}-patch_${_pkgver}/build"
  make DESTDIR="${pkgdir}" install
  if (( $_BUILD_DOC )) ; then
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html" "html/"*.html
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html" "html/"*.js
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_images" "html/_images/"*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static" "html/_static/"*.png
    #install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static" "html/_static/"*.gif
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static" "html/_static/"*.js
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/css" "html/_static/css/"*.css
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/fonts" "html/_static/fonts/"*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/html/_static/js" "html/_static/js/"*.js
  fi
}
