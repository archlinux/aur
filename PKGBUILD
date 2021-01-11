# Maintainer: Viktor Drobot (aka dviktor) <linux776 [at] gmail [dot] com>
# Maintainer: Anton Kudelin <kudelin [at] protonmail [dot] com>

pkgname=cp2k
pkgver=8.1.0
_dbcsrver=2.1.0
pkgrel=3
# NVIDIA GPU Generation: Kepler, Pascal, or Volta;
# please specify one closest to yours or leave unchanged
# if CUDA isn't supposed to be used
_GPU=Kepler
pkgdesc="A quantum chemistry and solid state physics software package"
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
depends=('fftw' 'elpa' 'libxc<5.0' 'libxsmm' 'spglib' 'cosma')
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
sha256sums=('1e25a865cad0a3958bc3e9e345bb771302015929fa22b299d1eb8f2e07f52756'
            'SKIP'
            '8b6c791a0b7c98ee2c593e3962465de07912e5ff2c611ba2bd1c6703d62ce1ec'
            'e37f65b984f7ff374349dc3662b42fea15a6ae11b7843184b2a0c89d9d077c96'
            '0c7eb8b6f6b724d28b7248e112c20dd9de70bdba06b2774bd1f23c87f03d6e7c'
            '6f27bcdff18336fd3499c1a82c47f3a0858fb6133f388500f3f21102cf6526e0')

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
  # We skip regtest-xastdp due to https://github.com/cp2k/cp2k/issues/1243
  ./do_regtest \
                -cp2kdir ../.. \
                -version psmp \
                -arch $_arch \
                -nobuild \
                -maxtasks $_corenumber \
                -skipdir QS/regtest-xastdp \
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
