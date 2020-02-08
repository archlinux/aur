# Maintainer: Viktor Drobot (aka dviktor) <linux776 [at] gmail [dot] com>
# Maintainer: Anton Kudelin <kudelin [at] protonmail [dot] com>

pkgname=cp2k
pkgver=7.1.0
_dbcsrver=2.0.1
pkgrel=1
pkgdesc="A quantum chemistry and solid state physics software package"
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
depends=('fftw' 'elpa' 'libxc' 'libint2' 'libxsmm' 'spglib')
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
        "plumed.psmp")
sha256sums=('e244f76d7e1e98da7e4e4b2e6cefb723fa1205cfae4f94739413be74952e8b4e'
            '1e283a3b9ce90bda321d77f4fa611b09a7eaad167d7bc579b2e9311f7b97b5ec'
            'ecbb19d6f40bf28abd7b4771e6ad0df899634f31d11ac2da89e58becb01f3ec3'
            'db6654c5d62f09a1ab166e5f82969f5cbf304cba633a286afd262eb048f5c5f0'
            'e9c97e220257d0ecf9bec4bd9aaa64c348416286fffc82d2d6f6ceda333196e8'
            '514d6ea683bb7b904df804e258f9de18274088fc0184a56c2fd4827aa0ae63fe')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  
  # Prepare DBCSR
  cp -r $srcdir/dbcsr-$_dbcsrver/* exts/dbcsr
  
  # Set up the default build environment
  export _buildmode=0
  export _arch="basic"
  export _corenumber=$( grep -c ^processor /proc/cpuinfo )
  export _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
  export _plumed=$( find /usr/lib -maxdepth 1 -type d -name "plumed*" | awk -F'/' '{print $4}' )
  
  # Enable additional features
  if [ $( echo -n $( which nvcc) | tail -c 4 ) == nvcc ]
  then
    echo "Adding CUDA support"
    _buildmode=$((_buildmode | 1))
  fi
  
  if [ -n $_plumed ]
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
  
  # Move arch-file into a proper directory  
  mv ../$_arch.psmp arch
  
  # Changing the location of the data directory
  sed -i 's@$(CP2KHOME)/data@/usr/share/cp2k/data@g' Makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver
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
  cd $srcdir/$pkgname-$pkgver/exe/$_arch
  install -dm755 $pkgdir/usr/{bin,share/$pkgname}
  install -Dm755 cp2k.psmp $pkgdir/usr/bin/cp2k
  install -Dm755 cp2k_shell.psmp $pkgdir/usr/bin/cp2k-shell
  install -Dm755 graph.psmp $pkgdir/usr/bin/cp2k-graph
  cp -r ../../data $pkgdir/usr/share/$pkgname
  chmod -R 755 $pkgdir/usr/share/$pkgname
}
