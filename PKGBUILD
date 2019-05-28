# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd-src
_pkgname=vmd
pkgver=1.9.3
pkgrel=2
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
# You have to download the package from the VMD url and put it in the PKGBUILD folder.
source=("local://$_pkgname-${pkgver}.src.tar.gz"
        "configure.patch"
        "ospray.patch"
        "cuda.patch"
        "mpi.patch")
sha256sums=('5bdc314dc836d620fe510ed4b6c3dbe3cf66525b61680ffec4e2563cf495f128'
            'c25475d51be75c2b9e3bcd5f8d5d3ed1fd0df992f9c8020b0346c49f6c40b275'
            '09f1cf35ebd302095a68d2b5db03e1671493411aed3f839baf2b1f44dc7e0e0d'
            '8880006bd97f7397d5a5592aaeeb6e80530d8c6026280c1b961e43f568e12daa'
            'e281a57831b8ff60c5a644219f0b6289d32bee239978af676474941c7d8548c0')

prepare() {
  sed -i 's/ltcl8.5/ltcl/g' plugins/Make-arch
  cd $_pkgname-$pkgver
  mkdir plugins
  sed -i 's#:${LD_LIBRARY_PATH}/:${LD_LIBRARY_PATH}:#/opt/optix/lib64#g' bin/*
  patch -p0 < ../configure.patch
  patch -p0 < ../ospray.patch
  patch -p0 < ../cuda.patch
  
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
  ./configure LINUXAMD64 OPENGL EGLPBUFFER FLTKOPENGL FLTK TK $ACC IMD OPENCL MPI XINERAMA XINPUT LIBOSPRAY LIBPNG NETCDF COLVARS TCL PYTHON PTHREADS GCC
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
