# Maintainer: Viktor Drobot (aka dviktor) <linux776 [at] gmail [dot] com>
# Maintainer: Anton Kudelin <kudelin [at] protonmail [dot] com>

pkgname=cp2k
pkgver=8.2.0
_dbcsrver=2.1.0
pkgrel=1
# NVIDIA GPU Generation: Kepler, Pascal, or Volta;
# please specify one closest to yours or leave unchanged
# if CUDA isn't supposed to be used
_GPU=Kepler
pkgdesc="A quantum chemistry and solid state physics software package"
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
depends=('fftw' 'elpa' 'libxc>=5.0.0' 'libxsmm' 'spglib' 'cosma')
makedepends=('gcc-fortran' 'python' 'git' 'libint2')
checkdepends=('numactl')
optdepends=('cuda: GPU calculations support'
            'plumed-mpi: enhanced sampling support')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git" "$pkgname-data")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cp2k/cp2k/archive/v$pkgver.tar.gz"
        "git+https://github.com/cp2k/dbcsr.git#tag=v$_dbcsrver"
        "basic.psmp"
        "cuda_plumed.psmp"
        "cuda.psmp"
        "plumed.psmp")
sha256sums=('d82c554e764dc16f94c1f671d0cf6523be58360bf9a2d2cbabbad0e73fbcffb2'
            'SKIP'
            '9f573a24af68a89676cdc51dfdc8edfd55ed87ab189f4ebf632b2ca4552bfb1b'
            'b54c9f1eb1cf968aa672e771f9f56770acc40d5a26ba0f1e58b20d6ab1797eb1'
            '504df2b2ab5415ac56807933ae499f2ed0cfdbac9eb8f0a2440387f1f2411911'
            'ea915cb5d50a4aa86695679ccd46d7aa56f8ff8c81a862403b3e1a89ca2b4a90')

prepare() {
  # Set up the default build environment
  export _buildmode=0
  export _arch="basic"
  export _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
  export _plumed=$( find /usr/lib -maxdepth 1 -type d -name "plumed-mpi" | awk -F'/' '{print $4}' )
  export _corenumber=$( grep -c ^processor /proc/cpuinfo )

  # Enabling additional features
  if [ $( echo -n $( which nvcc) | tail -c 4 ) == nvcc ] ; then
    _gpumem=$( nvidia-smi --query-gpu=memory.total --format=csv,nounits,noheader )
    # Tests require at least 150 MB of GPU memory per core
    _memcore=$(($_gpumem / 150))
    if [[ $_memcore -ge 2 ]] ; then
      echo "Adding CUDA support"
      _buildmode=$((_buildmode | 1))
      if [[ $_corenumber > $_memcore ]] ; then
        _corenumber=$_memcore
      fi
    fi
  fi

  if [[ $_plumed ]] ; then
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
  cd "$srcdir/$pkgname-$pkgver"
  mv ../$_arch.psmp arch

  # Changing the location of the data directory
  sed -i 's@$(CP2KHOME)/data@/usr/share/cp2k/data@g' Makefile

  # Prepare DBCSR
  cp -r ../dbcsr exts
  cd exts/dbcsr
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make ARCH=$_arch VERSION=psmp
}

check() {
  cd "$srcdir/$pkgname-$pkgver/tools/regtesting"
  export DATA_DIR="$srcdir/$pkgname-$pkgver/data"

  # In the case of a test failure you must examine it carefully
  # because it can lead to an unpredictable error during a production run.
  ./do_regtest \
                -cp2kdir ../.. \
                -version psmp \
                -arch $_arch \
                -nobuild \
                -maxtasks $_corenumber \
                -jobmaxtime 1000
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
