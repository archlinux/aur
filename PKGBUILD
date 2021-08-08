# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd-src
_pkgname=vmd
pkgver=1.9.4a51
pkgrel=5
pkgdesc="Visual Molecular Dynamics"
url="http://www.ks.uiuc.edu/Research/vmd/"
license=('custom')
arch=('x86_64' 'aarch64')
depends=('tcsh' 'tk' 'python-numpy' 'fltk' 'netcdf' 'ocl-icd' 'libxi'
         'opencl-headers')
makedepends=('gcc')
optdepends=('openbabel: additional file formats support'
            'sqlite: dmsplugin'
            'ospray: accelerated ray tracing for Intel CPUs'
            'optix: accelerated ray tracing for NVIDIA GPUs'
            'cuda: NVIDIA CUDA GPU acceleration functions')
conflicts=("$_pkgname" "$_pkgname-bin")
# You have to download the package from the VMD url
# and put it in the PKGBUILD folder.
source=("local://$_pkgname-${pkgver}.src.tar.gz"
        "configure.patch")
sha256sums=('b1c40b21111f5bab56d43d5e442c468d327159b07915af2ec175ba6b12842e5c'
            'cef0605dfeb529616c7b760696ac0305aa84e80eeffbbcb6e5473bc5a46760f9')

prepare() {
  sed -i 's/ltcl8.5/ltcl/g' plugins/Make-arch
  cd $_pkgname-$pkgver
  mkdir plugins
  sed -i 's#:${LD_LIBRARY_PATH}/:${LD_LIBRARY_PATH}:#/opt/optix/lib64#g' bin/*
  # Assuming openmpi; if it's not the case edit configure.patch
  patch -p0 < ../configure.patch
  
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
  ./configure $MACHINE OPENGL EGLPBUFFER FLTKOPENGL FLTK TK $ACC IMD OPENCL MPI XINERAMA XINPUT $RAY LIBPNG ZLIB NETCDF COLVARS TCL PYTHON NUMPY PTHREADS GCC
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
