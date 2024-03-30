# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=clawpack
pkgname=python-${_base}
pkgdesc="Finite volume methods for hyperbolic conservation laws"
pkgver=5.10.0
pkgrel=1
arch=(x86_64)
url="https://www.${_base}.org"
license=(BSD-3-Clause)
depends=(python-matplotlib)
makedepends=(python-build python-installer meson-python python-wheel gcc-fortran git)
optdepends=('petsc: for petclaw support'
  'python-scipy: for euler support')
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git#tag=v${pkgver}
  github.com-clawpack-amrclaw::git+https://github.com/${_base}/amrclaw.git#commit=784e4c41b2d4e25b363abbcc1913fef1c7be730d
  github.com-clawpack-classic::git+https://github.com/${_base}/classic.git#commit=9d69dcbf8ea18fc6e6dadf386f22b44b3400e1ae
  github.com-clawpack-clawutil::git+https://github.com/${_base}/clawutil.git#commit=fd0e5ded9f91266104b12469e205e23ba1ef9b15
  github.com-clawpack-geoclaw::git+https://github.com/${_base}/geoclaw.git#commit=acac99becfaa10ac33a344086e00832a70455f15
  github.com-clawpack-pyclaw::git+https://github.com/${_base}/pyclaw.git#commit=4fa92afbe6abd3282d39c82cb97a1bc5cfe62b45
  github.com-clawpack-riemann::git+https://github.com/${_base}/riemann.git#commit=7b4004c044d04900ca2de6bc6ae49fc23330c64f
  github.com-clawpack-visclaw::git+https://github.com/${_base}/visclaw.git#commit=4a344fd60623c6d48baa74a3e11400b8e5ba3bf1)
sha512sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')

prepare() {
  cd ${_base}-${pkgver}
  sed -i 's/..\//https:\/\/github.com\/clawpack\//' .gitmodules
  git submodule init
  git config submodule.third_party/amrclaw.url "${srcdir}/github.com-clawpack-amrclaw"
  git config submodule.third_party/classic.url "${srcdir}/github.com-clawpack-classic"
  git config submodule.third_party/clawutil.url "${srcdir}/github.com-clawpack-clawutil"
  git config submodule.third_party/geoclaw.url "${srcdir}/github.com-clawpack-geoclaw"
  git config submodule.third_party/pyclaw.url "${srcdir}/github.com-clawpack-pyclaw"
  git config submodule.third_party/riemann.url "${srcdir}/github.com-clawpack-riemann"
  git config submodule.third_party/visclaw.url "${srcdir}/github.com-clawpack-visclaw"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
