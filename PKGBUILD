pkgname=cp2k
pkgver=6.1.0
pkgrel=2
pkgdesc="A quantum chemistry and solid state physics software package for atomistic simulations of solid state, liquid, molecular, periodic, material, crystal, and biological systems."
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
depends=('lapack' 'blas' 'fftw' 'gcc-libs' 'glibc'
         'libxc>=4.0.4' 'libint>=1.1.4')
makedepends=('gcc' 'gcc-fortran' 'python2' 'make')
optdepends=('cuda: GPU calculations support'
            'plumed: enhanced sampling support')
source=("https://github.com/cp2k/cp2k/archive/v${pkgver}.tar.gz"
        "basic.ssmp"
        "basic_cuda.ssmp"
        "basic_plumed.ssmp"
        "basic_cuda_plumed.ssmp")
sha256sums=('d7dd5f164e1e51d2dcb8c7d927b99f6ac1d0f8de4a665bd9daee1a14864c30ae'
            'dd91990853df6aa45719c6b991db19beb1a8dce556a25149e90bb562e7ba9ff9'
            '961ff801e2f4de80faffb84b6c46a457f2c149f32d88daeda5afd992841741b0'
            'c30512606e0d3857cba7f29febebfc71ea6e658b56784ab5befb2aaeb2dfb006'
            '39e3ef335cf51d4cfe436bd4cb1d21a4b9b33af3718bcaf737fbf307c85945fb')
_buildmode=0
_version="basic"

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
    _version="basic"
    ;;

  1)
    _version="basic_cuda"
    ;;

  2)
    _version="basic_plumed"
    ;;

  3)
    _version="basic_cuda_plumed"
    ;;
esac

prepare() {
  cd $srcdir/$pkgname-$pkgver
  
  mv ../${_version}.ssmp arch/
  # A fix for Kepler GPUs
  sed -i 's/P100/K20X/g' src/dbcsr/libsmm_acc/libcusmm/generate.py
  sed -i 's/largeDB(/largeDB1(/g' src/dbcsr/libsmm_acc/libcusmm/parameters_K20X.txt
  sed -i 's/triples += combinations(6,7,8)/#triples += combinations(6,7,8)/g' src/dbcsr/libsmm_acc/libcusmm/generate.py
  sed -i 's/triples += combinations(13,14,25,26,32)/#triples += combinations(13,14,25,26,32)/g' src/dbcsr/libsmm_acc/libcusmm/generate.py
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  cd makefiles
  make ARCH=$_version VERSION=ssmp
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/exe/$_version

  install -Dm755 cp2k.ssmp ${pkgdir}/usr/bin/cp2k
  install -Dm755 cp2k_shell.ssmp ${pkgdir}/usr/bin/cp2k-shell
  install -Dm755 graph.ssmp ${pkgdir}/usr/bin/cp2k-graph
}
