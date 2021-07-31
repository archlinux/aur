# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: xpt <user.xpt@gmail.com>

### BUILD OPTIONS
# Set these variables to '1' to enable them
# Doing so will add the requisite build commands,
# as well as add the needed dependencies

# HTML documentation
_BUILD_DOC=0
# Copy 'examples' to /usr/share/examples/lammps
_INSTALL_EXAMPLES=0
# Use Intel compilers
_ENABLE_INTEL_COMPILER=0
# Use AMD compilers
_ENABLE_AMD_COMPILER=0
# USER-INTEL package
_ENABLE_INTEL=0
# USER-OMP package
_ENABLE_OMP=0
# KIM package
_ENABLE_KIM=0

_pkgname=lammps
pkgname=${_pkgname}-beta
pkgver=20210730
_pkgver="30Jul2021"
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
source=("git+https://github.com/${_pkgname}/${_pkgname}#tag=patch_${_pkgver}?signed")
sha512sums=('SKIP')

# Make sure you have imported Axel Kohlmeyer's PGP key
#   wget https://github.com/akohlmey.gpg
#   gpg --import akohlmey.gpg

# process the build settings from above
if (( $_ENABLE_INTEL_COMPILER )); then
    depends+=('intel-mkl')
    optdepends=('intel-parallel-studio-xe')
    _feature_args+=('-DCMAKE_C_COMPILER=icc')
    _feature_args+=('-DCMAKE_C_FLAGS=-xHost -O3 -no-prec-div -qoverride-limits -qopt-zmm-usage=high')
    _feature_args+=('-DCMAKE_CXX_COMPILER=icpc')
    _feature_args+=('-DCMAKE_CXX_FLAGS=-no-prec-div -qoverride-limits -qopt-zmm-usage=high -qno-offload -fno-alias -ansi-alias -O3 -std=c++11 -DLMP_INTEL_USELRT -DLMP_USE_MKL_RNG')
    _feature_args+=('-DCMAKE_Fortran_COMPILER=ifort')
    _feature_args+=('-DMPI_C_COMPILER=mpiicc')
    _feature_args+=('-DMPI_CXX_COMPILER=mpiicpc')
fi
if (( $_BUILD_DOC )); then
    makedepends+=('python-virtualenv' 'doxygen')
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
#_feature_args+=('-DCMAKE_EXE_LINKER_FLAGS=-lamdlibm -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now')
#depends+=('aocl-aocc')
if (( $_ENABLE_AMD_COMPILER )); then
    depends+=('aocc')
    _feature_args+=('-DCMAKE_CXX_COMPILER=clang++')
    _feature_args+=('-DCMAKE_CXX_FLAGS=-march=native -O3 -std=c++11')
    _feature_args+=('-DMPI_C_COMPILER=mpicc')
    _feature_args+=('-DMPI_CXX_COMPILER=mpicxx')
fi

prepare(){
  cd "${_pkgname}"
  mkdir -p build
}

build() {
  if (( $_ENABLE_AMD_COMPILER )) ; then
    module load aocc
    #module load aocl-aocc
  fi

  cd "${_pkgname}/build"
  cmake ../cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" \
        "${_feature_args[@]}" #\
        # Add options for additional packages (above this line)
        #-DPKG_<NAME>=yes

  make
}

package() {
  cd "${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
  if (( $_INSTALL_EXAMPLES )) ; then
    mkdir -p "${pkgdir}/usr/share/examples/lammps"
    cp -r "../examples/." "${pkgdir}/usr/share/examples/lammps/"
    find "${pkgdir}/usr/share/examples/lammps/" -type f -exec chmod 644 '{}' +
  fi
  install -Dm644 "../tools/vim/lammps.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/lammps.vim"
  install -Dm644 "../tools/vim/filetype.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/lammps.vim"
}
