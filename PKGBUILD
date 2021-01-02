# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd-src
_pkgname=vmd
pkgver=1.9.4a51
pkgrel=1
pkgdesc="Visual Molecular Dynamics"
url="http://www.ks.uiuc.edu/Research/vmd/"
license=('custom')
arch=('x86_64')
depends=('tcsh' 'tk' 'python-numpy' 'fltk' 'ospray' 'netcdf' 'ocl-icd' 'libxi'
         'opencl-headers')
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
sha256sums=('b1c40b21111f5bab56d43d5e442c468d327159b07915af2ec175ba6b12842e5c'
            '1a36eeea92a362576fc1167f0bafb12ecf4c97562e0ae4b001743f5de6f0a48c'
            'e281a57831b8ff60c5a644219f0b6289d32bee239978af676474941c7d8548c0'
            '1284e19124743fe85969ebbee67e4e4e5b6ec07e9c4c83f75f960db75b0587ad')

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
  cd "$srcdir/plugins"
  make -j1 LINUXAMD64
  make distrib
  cd ../$_pkgname-$pkgver
  ./configure LINUXAMD64 OPENGL EGLPBUFFER FLTKOPENGL FLTK TK $ACC IMD OPENCL MPI XINERAMA XINPUT LIBOSPRAY LIBPNG ZLIB NETCDF COLVARS TCL PYTHON NUMPY PTHREADS GCC
  cd src
  make veryclean
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd src
  make install
  sed -i 's#set defaultvmddir=.*#set defaultvmddir=/usr/lib/vmd#' "$pkgdir/usr/bin/vmd"
}
