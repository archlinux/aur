# Maintainer: Ashwin <ashuwish+arch@gmail.com>

_hgproj=fluiddyn
_hgrepo=fluidfft
_hgver="0.2.7"
pkgname=python2-${_hgrepo}-hg
pkgver=0.2.7.r468.5621e335733d
pkgrel=1
pkgdesc="FluidDyn project | FluidFFT | Common API for Fast Fourier Transforms"
arch=('any')
url="https://bitbucket.org/${_hgproj}/${_hgrepo}"
license=('custom:"CeCILL"')
depends=('python2' 'python2-fluiddyn' 'python2-pyfftw')
optdepends=('fftw-mpi: parallelized FFT'
            'openmpi: parallelized FFT'
            'python2-mpi4py: parallelized FFT'
            'python2-pythran: optimized operators'
           )
makedepends=('cython2' 'mercurial' 'python2-setuptools' 'python2-mako')
provides=(python2-${_hgrepo})

source=("hg+${url}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_hgrepo}"
  hg update ${_hgver}
}

pkgver() {
  cd "${srcdir}/${_hgrepo}"
  echo $(hg parents --template '{word(-1,latesttag,":")}').r$(hg identify -n).$(hg identify -i)
}

build() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_hgrepo}"
  python2 -m unittest discover
}

package() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py install --root=$pkgdir --optimize 1
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
