# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=clawpack
pkgname=python-${_base}
pkgdesc="Package for solving hyperbolic systems of partial differential equations"
pkgver=5.9.1
pkgrel=1
arch=(x86_64)
url="https://github.com/clawpack/${_base}"
license=('custom:BSD-3-clause')
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel gcc-fortran git)
optdepends=('petsc: for petclaw support'
  'python-scipy: for euler support')
source=(${_base}-${pkgver}::git+${url}.git#tag=v${pkgver}
  github.com-clawpack-pyclaw::git+https://github.com/clawpack/pyclaw.git#commit=d346bcd8303c10f9bb8f63e01fe498787ae4d2a0
  github.com-clawpack-visclaw::git+https://github.com/clawpack/visclaw.git#commit=6518e7a4daa568de8573141d3da1860c3a2a8987
  github.com-clawpack-clawutil::git+https://github.com/clawpack/clawutil.git#commit=6f3e18eec124798d5a662d596c5135adca0b0aee
  github.com-clawpack-riemann::git+https://github.com/clawpack/riemann.git#commit=a53a9795eeab687fedebcaa0d25a526cad5c80ec
  github.com-clawpack-amrclaw::git+https://github.com/clawpack/amrclaw.git#commit=2d90d97f1d00c15f4f469ae1f625c889d8bcfaf3
  github.com-clawpack-geoclaw::git+https://github.com/clawpack/geoclaw.git#commit=db6ef3ae09731f21abf7bd581e6b03170715708c
  github.com-clawpack-classic::git+https://github.com/clawpack/classic.git#commit=2d0f3d2449d8bd9ea8361031c9d25f44bd1d11f9)
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
  git config submodule.third_party/pyclaw.url "${srcdir}/github.com-clawpack-pyclaw"
  git config submodule.third_party/visclaw.url "${srcdir}/github.com-clawpack-visclaw"
  git config submodule.third_party/clawutil.url "${srcdir}/github.com-clawpack-clawutil"
  git config submodule.third_party/riemann.url "${srcdir}/github.com-clawpack-riemann"
  git config submodule.third_party/amrclaw.url "${srcdir}/github.com-clawpack-amrclaw"
  git config submodule.third_party/geoclaw.url "${srcdir}/github.com-clawpack-geoclaw"
  git config submodule.third_party/classic.url "${srcdir}/github.com-clawpack-classic"
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
