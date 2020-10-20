# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# Contributor: steabert <steabert@member.fsf.org>
# Contributor: Ricardo Honorato Z.

pkgname=vmd-src
_pkgname=vmd
pkgver=1.9.4a48
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
        "mpi.patch"
        "wkfthreads_reversal.patch")
sha256sums=('d1ef1260be2bb43aed891832cc2ad15df1bb8402cb47d848073342c3df917ea4'
            'dcda14b9a4b43824a968ccb6613e4f704f50ecbdce3bbdfde1257185b5a6af32'
            'e281a57831b8ff60c5a644219f0b6289d32bee239978af676474941c7d8548c0'
            '1284e19124743fe85969ebbee67e4e4e5b6ec07e9c4c83f75f960db75b0587ad')

prepare() {
  sed -i 's/ltcl8.5/ltcl/g' plugins/Make-arch
  cd $_pkgname-$pkgver
  mkdir plugins
  sed -i 's#:${LD_LIBRARY_PATH}/:${LD_LIBRARY_PATH}:#/opt/optix/lib64#g' bin/*
  patch -p0 < ../configure.patch
  
  # Removing CPU intrinsics from WKFThreads.C as they break compilation
  patch -p0 < ../wkfthreads_reversal.patch
  
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
  ./configure LINUXAMD64 OPENGL EGLPBUFFER FLTKOPENGL FLTK TK $ACC IMD OPENCL MPI XINERAMA XINPUT LIBOSPRAY LIBPNG ZLIB NETCDF COLVARS TCL PYTHON PTHREADS GCC
  cd src
  make veryclean
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd src; make install
  sed -i 's#set defaultvmddir=.*#set defaultvmddir=/usr/lib/vmd#' "$pkgdir/usr/bin/vmd"
}
