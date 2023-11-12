# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=clawpack
pkgname=python-${_base}
pkgdesc="Finite volume methods for hyperbolic conservation laws"
pkgver=5.9.2
pkgrel=2
arch=(x86_64)
url="https://www.${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-matplotlib)
makedepends=(python-build python-installer meson-python python-wheel gcc-fortran git)
optdepends=('petsc: for petclaw support'
  'python-scipy: for euler support')
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git#tag=v${pkgver}
  github.com-clawpack-pyclaw::git+https://github.com/${_base}/pyclaw.git#commit=c2b04786c08376258ca1b593854cdeea61b1cf4a
  github.com-clawpack-visclaw::git+https://github.com/${_base}/visclaw.git#commit=32e257c83c6810fd7881c44c06956bae7b82fa9b
  github.com-clawpack-clawutil::git+https://github.com/${_base}/clawutil.git#commit=5aaee229da179c97ea09c00ece86b38d3d6c2b65
  github.com-clawpack-riemann::git+https://github.com/${_base}/riemann.git#commit=c7a9ed0105f7d7a6817276d8d89c7c40b94fce06
  github.com-clawpack-amrclaw::git+https://github.com/${_base}/amrclaw.git#commit=4b50c2661a955639e634102fe80c38f77883aebc
  github.com-clawpack-geoclaw::git+https://github.com/${_base}/geoclaw.git#commit=222676970c6f12fefcc3a715eda7ac00b3c22b89
  github.com-clawpack-classic::git+https://github.com/${_base}/classic.git#commit=a27a4951a42f392cd8d1b36ed296b84f53e888e8
  conversion.patch::https://github.com/clawpack/clawutil/pull/161.patch)
sha512sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'b072463ba2ad16af04f9e14178f51e83981b5d27dde349170cab191a9f110e01456be2b71a80b9dc5bbee69f7dd9795ea76cb503d624f18fab664861fa2a0f74')

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

  # https://github.com/clawpack/clawutil/issues/160
  cd ${srcdir}/github.com-clawpack-clawutil
  patch -p1 -i ../conversion.patch
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
