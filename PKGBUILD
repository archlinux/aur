# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd-src
_pkgname=vmd
pkgver=1.9.4a57
pkgrel=5
pkgdesc="Visual Molecular Dynamics"
url="http://www.ks.uiuc.edu/Research/vmd/"
license=(custom)
arch=(x86_64 aarch64)
depends=(tcsh tk python-numpy fltk netcdf ocl-icd libxi openmpi)
makedepends=(opencl-headers)
optdepends=('openbabel: additional file formats support'
            'sqlite: dmsplugin'
            'ospray: accelerated ray tracing for Intel CPUs'
            'optix: accelerated ray tracing for NVIDIA GPUs'
            'cuda: NVIDIA CUDA GPU acceleration functions')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-bin)
# You have to download the package from the VMD url
# and put it in the PKGBUILD folder.
source=(local://$_pkgname-${pkgver}.src.tar.gz
        configure.patch
        vmd20260627.patch)
sha256sums=('de278d0c5d969336d89068e0806fb50aaa0cb0f546ba985d840b279357860679'
            'a74a8bbee40667742907b59aa24bdb37607761389a9c332c2d449ef07a2f0937'
            '8daf4d5364f51afe9881703ebe39ce1f1a63fa7b7ae2fcf41570dc876da6181c')

prepare() {
  sed -i 's/ltcl8.5/ltcl/g' plugins/Make-arch
  sed -i 's/"CCFLAGS = /"CCFLAGS = -std=gnu17 /g' plugins/Make-arch

  cd $_pkgname-$pkgver
  mkdir plugins
  sed -i 's#:${LD_LIBRARY_PATH}/:${LD_LIBRARY_PATH}:#/opt/optix/lib64#g' bin/*
  # Assuming openmpi; if it's not the case edit configure.patch
  patch -p0 < ../configure.patch

  # Making the package agnostic towards the Python version
  local _pyver
  _pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  export PYTHON_INCLUDE_DIR=$(python -c 'import sysconfig; print(sysconfig.get_path("include"))')
  export PYTHON_LIBRARY_DIR=$(python -c 'import sysconfig; print(sysconfig.get_config_var("LIBPL"))')
  export NUMPY_INCLUDE_DIR=$(python -c 'import numpy; print(numpy.get_include() + "/numpy")')
  export NUMPY_LIBRARY_DIR=$(python -c 'import numpy; print(numpy.get_include())')
  sed -i "s/-lpython[0-9]\+\.[0-9]\+/-lpython${_pyver}/g" configure

  patch -p0 < ../vmd20260627.patch

  export TCLINC="-I/usr/include"
  export TCLLIB="-L/usr/lib"
  export PLUGINDIR=$srcdir/$_pkgname-$pkgver/plugins
  export VMDINSTALLBINDIR=$pkgdir/usr/bin
  export VMDINSTALLLIBRARYDIR=$pkgdir/usr/lib/vmd
  
  # Enable CUDA if nvcc is in PATH
  if command -v nvcc &> /dev/null
  then
    export ACC=CUDA
  fi

  # Enable OSPRAY if ospray_mpi_worker is in PATH
  if command -v ospray_mpi_worker &> /dev/null
  then
    export RAY=LIBOSPRAY2
  fi

  # Architecture
  export MACHINE=LINUXAMD64
  if [ $CARCH == 'aarch64' ]
  then
    export MACHINE=LINUXARM64
  fi
}

build() {
  cd "$srcdir/plugins"
  make -j1 $MACHINE
  make distrib

  cd ../$_pkgname-$pkgver
  ./configure  \
    $MACHINE   \
    $ACC       \
    $RAY       \
    OPENGL     \
    EGLPBUFFER \
    FLTKOPENGL \
    FLTK       \
    TK         \
    IMD        \
    OPENCL     \
    MPI        \
    XINERAMA   \
    XINPUT     \
    LIBPNG     \
    ZLIB       \
    NETCDF     \
    COLVARS    \
    TCL        \
    PYTHON     \
    NUMPY      \
    PTHREADS   \
    GCC

  cd src
  make veryclean
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd src
  make install
  sed -i 's#set defaultvmddir=.*#set defaultvmddir=/usr/lib/vmd#' \
    "$pkgdir/usr/bin/vmd"
}
