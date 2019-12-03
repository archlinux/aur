# Maintainer: Viktor Drobot (aka dviktor) <linux776 [at] gmail [dot] com>
# Maintainer: Anton Kudelin <kudelin [at] protonmail [dot] com>

pkgname=cp2k
pkgver=6.1.0
pkgrel=6
_version="psmp"
pkgdesc="A quantum chemistry and solid state physics software package"
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
depends=('fftw' 'cp2k-data' 'scalapack' 'libxc' 'libint' 'libxsmm' 'spglib')
makedepends=('gcc-fortran' 'python2' 'make' 'sed')
optdepends=('cuda: GPU calculations support'
            'plumed-mpi: enhanced sampling support')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("https://github.com/cp2k/cp2k/archive/v$pkgver.tar.gz"
        "basic.$_version"
        "cuda_plumed.$_version"
        "cuda.$_version"
        "plumed.$_version")
sha256sums=('d7dd5f164e1e51d2dcb8c7d927b99f6ac1d0f8de4a665bd9daee1a14864c30ae'
            'd26e4b6fdfb2078500dec63cf3e4957fd0465cf25cd7bb116d6ee1800613d305'
            '466f6f82b6e92b5ad2a5ff3a8faab346ff4cd8205f04572bb1d63dc2c0af9dc7'
            'f53e90b5129f43b4842aa90f76e38faff2236a6df1cd14deed6310adf8fd7fac'
            '368fd4effa3bd5750728993e31416cd7187d8dec7648e621e17aa076d2d72a9a')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  
  # Set up the default build environment
  export _buildmode=0
  export _arch="basic"
  export _corenumber=$( grep -c ^processor /proc/cpuinfo )
  
  # Enable additional features
  if [ -d "/opt/cuda" ]
  then
    msg2 "Adding CUDA support"
    _buildmode=$((_buildmode | 1))
  fi
  
  if [ -d "/usr/lib/plumed" ]
  then
    msg2 "Adding PLUMED support"
    _buildmode=$((_buildmode | 2))
  fi
  
  case $_buildmode in
    0)
      _arch="basic"
      ;;
  
    1)
      _arch="cuda"
      ;;
  
    2)
      _arch="plumed"
      ;;
  
    3)
      _arch="cuda_plumed"
      ;;
  esac
  
  # Move arch-file into a proper directory  
  mv ../$_arch.$_version arch/
  
  # Changing the location of the data directory
  sed -i 's@$(CP2KHOME)/data@/usr/share/cp2k/data@g' makefiles/Makefile
  
  # Fix python
  find . -name "*.py" -exec sed -i "s@env python@env python2@g" {} +
  sed -i "s@env python@env python2@g" tools/build_utils/fypp
  sed -i "s@env python@env python2@g" makefiles/Makefile
  
  # A fix for Kepler GPUs
  sed -i 's@P100@K20X@g' src/dbcsr/libsmm_acc/libcusmm/generate.py
  sed -i 's@largeDB(@largeDB1(@g' src/dbcsr/libsmm_acc/libcusmm/parameters_K20X.txt
  sed -i 's@triples += combinations(6,7,8)@#triples += combinations(6,7,8)@g' src/dbcsr/libsmm_acc/libcusmm/generate.py
  sed -i 's@triples += combinations(13,14,25,26,32)@#triples += combinations(13,14,25,26,32)@g' src/dbcsr/libsmm_acc/libcusmm/generate.py
}

build() {
  cd $srcdir/$pkgname-$pkgver/makefiles
  
  make ARCH=$_arch VERSION=$_version
}

check() {
  cd $srcdir/$pkgname-$pkgver/tools/regtesting
  ./do_regtest -cp2kdir ../.. -nosvn -version $_version -arch $_arch -nobuild -maxtasks $_corenumber
  msg2 "A few non-critical tests may fail"
}

package() {
  cd $srcdir/$pkgname-$pkgver/exe/$_arch

  install -Dm755 cp2k.$_version $pkgdir/usr/bin/cp2k
  install -Dm755 cp2k_shell.$_version $pkgdir/usr/bin/cp2k-shell
  install -Dm755 graph.$_version $pkgdir/usr/bin/cp2k-graph
}
