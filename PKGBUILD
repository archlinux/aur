# Maintainer: Viktor Drobot (aka dviktor) <linux776 [at] gmail [dot] com>
# Maintainer: Anton Kudelin <kudelin [at] protonmail [dot] com>

pkgname=cp2k
pkgver=7.1.0
_dbcsrver=2.0.1
pkgrel=5
# NVIDIA GPU Generation: Kepler, Pascal, or Volta;
# please specify one closest to yours or leave unchanged
# if CUDA isn't supposed to be used
_GPU=Kepler
pkgdesc="A quantum chemistry and solid state physics software package"
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
depends=('fftw' 'elpa' 'libxc<5.0' 'libint2' 'libxsmm' 'spglib')
makedepends=('gcc-fortran' 'python' 'sed')
checkdepends=('numactl')
optdepends=('cuda: GPU calculations support'
            'plumed-mpi: enhanced sampling support')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git" "$pkgname-data")
source=("https://github.com/cp2k/cp2k/archive/v$pkgver.tar.gz"
        "https://github.com/cp2k/dbcsr/archive/v$_dbcsrver.tar.gz"
        "basic.psmp"
        "cuda_plumed.psmp"
        "cuda.psmp"
        "plumed.psmp"
        "lapack.patch")
sha256sums=('e244f76d7e1e98da7e4e4b2e6cefb723fa1205cfae4f94739413be74952e8b4e'
            '1e283a3b9ce90bda321d77f4fa611b09a7eaad167d7bc579b2e9311f7b97b5ec'
            '7fcc5d8d743361ac41d8e2118ad2f162de5d8274018fd8f10d115db0a07d7ff4'
            '7534ad85434cae17b7b79b1aeb5a25dbb912b6307040e0b3d3ff5e35f81e9327'
            '4d642cc08f16dc57bc9f9815b128ec5bc70bad72d5f394296492d224d78b5bdc'
            'b895cabd59e5429ec5763290ce02923fc04afb7e2167ed9bcc973c6da9981545'
            'f566a9941f27c9d55c528acf0aacbb8ed686067777ce48f1e206432d259ee8a1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Prepare DBCSR
  cp -r ../dbcsr-$_dbcsrver/* exts/dbcsr
  patch -p1 < ../lapack.patch

  # Set up the default build environment
  export _buildmode=0
  export _arch="basic"
  export _corenumber=$( grep -c ^processor /proc/cpuinfo )
  export _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
  export _plumed=$( find /usr/lib -maxdepth 1 -type d -name "plumed-mpi" | awk -F'/' '{print $4}' )

  # Enable additional features
  if [ $( echo -n $( which nvcc) | tail -c 4 ) == nvcc ]
  then
    echo "Adding CUDA support"
    _buildmode=$((_buildmode | 1))
  fi

  if [[ $_plumed ]]
  then
    echo "Adding PLUMED support"
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
  
  case $_GPU in
    Kepler)
      export _gpuver=K20X
      ;;
    Pascal)
      export _gpuver=P100
      ;;
    Volta)
      export _gpuver=V100
      ;;
  esac

  # Move arch-file into a proper directory  
  mv ../$_arch.psmp arch

  # Changing the location of the data directory
  sed -i 's@$(CP2KHOME)/data@/usr/share/cp2k/data@g' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make ARCH=$_arch VERSION=psmp
}

check() {
  export DATA_DIR=$srcdir/$pkgname-$pkgver/data
  cd $srcdir/$pkgname-$pkgver/tools/regtesting

  # In the case of a test failure you must examine it carefully
  # because it can lead to an unpredictable error during a production run.
  ./do_regtest -cp2kdir ../.. -version psmp -arch $_arch -nobuild -maxtasks $_corenumber
}

package() {
  cd "$pkgdir"
  install -dm755 usr/{bin,share/$pkgname}
  cd "$srcdir/$pkgname-$pkgver/exe/$_arch"
  install -Dm755 cp2k.psmp "$pkgdir/usr/bin/cp2k"
  install -Dm755 cp2k_shell.psmp "$pkgdir/usr/bin/cp2k-shell"
  install -Dm755 graph.psmp "$pkgdir/usr/bin/cp2k-graph"
  cp -r ../../data "$pkgdir/usr/share/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/$pkgname"
}
