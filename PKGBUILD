# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd-src
_pkgname=vmd
pkgver=1.9.4a38
pkgrel=1
pkgdesc="Visual Molecular Dynamics"
url="http://www.ks.uiuc.edu/Research/vmd/"
license=('custom')
arch=('x86_64')
depends=('tcsh' 'tk' 'python2-numpy' 'fltk' 'ospray'
         'netcdf' 'ocl-icd' 'opencl-headers' 'libxi')
makedepends=('gcc')
optdepends=('openbabel: additional file formats support'
            'sqlite: dmsplugin'
            'optix: accelerated ray tracing for NVIDIA GPUs'
            'cuda: NVIDIA CUDA GPU acceleration functions')
conflicts=("$_pkgname" "$_pkgname-bin")
# You have to download the package from the VMD url
# and put it in the PKGBUILD folder.
source=("local://$_pkgname-${pkgver}.src.tar.gz"
        "configure.patch"
        "mpi.patch")
sha256sums=('5ae1448c59369f99d0c9408b0acbc08a55bea9fa69f9b25fccc565ddac671fa9'
            '96ce10c2d9728b416dbac83bfc30d84248044ea7371de7bbfbe854ba7e0adef5'
            'e281a57831b8ff60c5a644219f0b6289d32bee239978af676474941c7d8548c0')

prepare() {
  sed -i 's/ltcl8.5/ltcl/g' plugins/Make-arch
  cd $_pkgname-$pkgver
  mkdir plugins
  sed -i 's#:${LD_LIBRARY_PATH}/:${LD_LIBRARY_PATH}:#/opt/optix/lib64#g' bin/*
  patch -p0 < ../configure.patch
  
  # Assuming openmpi; if not the case edit mpi.patch
  patch -p0 < ../mpi.patch
  export TCLINC="-I/usr/include"
  export TCLLIB="-L/usr/lib"
  export PLUGINDIR=$srcdir/$_pkgname-$pkgver/plugins
  export VMDINSTALLBINDIR=$pkgdir/usr/bin
  export VMDINSTALLLIBRARYDIR=$pkgdir/usr/lib/vmd
  
  # Enable CUDA if nvcc is in PATH
  if [ $( echo -n $( which nvcc) | tail -c 4 ) == nvcc ]
  then
    export ACC=CUDA
  fi
}

build() {
  cd $srcdir/plugins
  make -j1 LINUXAMD64 world
  make distrib
  cd ../$_pkgname-$pkgver
  ./configure LINUXAMD64 OPENGL EGLPBUFFER FLTKOPENGL FLTK TK $ACC IMD OPENCL MPI XINERAMA XINPUT LIBOSPRAY LIBPNG ZLIB NETCDF COLVARS TCL PYTHON PTHREADS GCC
  cd src
  make veryclean
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cd src; make install
  sed -i 's#set defaultvmddir=.*#set defaultvmddir=/usr/lib/vmd#' $pkgdir/usr/bin/vmd
}
