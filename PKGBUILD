pkgname=cp2k
pkgver=6.1.0
pkgrel=1
pkgdesc="A quantum chemistry and solid state physics software package for atomistic simulations of solid state, liquid, molecular, periodic, material, crystal, and biological systems."
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
depends=('lapack' 'blas' 'fftw' 'gcc-libs' 'glibc')
makedepends=('gcc' 'gcc-fortran' 'python2' 'make')
optdepends=('cuda: GPU calculations support'
            'plumed: enhanced sampling support')
source=("https://github.com/cp2k/cp2k/archive/v${pkgver}.tar.gz"
        "basic.ssmp"
        "basic_cuda.ssmp"
        "basic_plumed.ssmp"
        "basic_cuda_plumed.ssmp")
md5sums=('071d4e0716f3b646911522f6a72aae2d'
         '214e5ccb988fb2603168d3eb73e84cce'
         '3aae24738a4841d5ff4f367d310edb72'
         '8affc94195f762c3b8dd5e636d6c98e2'
         '82dee44b58d0f108d736574221c59ec5')
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


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cp ${srcdir}/${_version}.ssmp arch/
  cd makefiles
  make ARCH=$_version VERSION=ssmp
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/exe/$_version

  install -Dm755 cp2k.ssmp ${pkgdir}/usr/bin/cp2k
  install -Dm755 cp2k_shell.ssmp ${pkgdir}/usr/bin/cp2k-shell
  install -Dm755 graph.ssmp ${pkgdir}/usr/bin/cp2k-graph
}
