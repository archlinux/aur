# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matplotlib
pkgname=pypy3-${_base}
pkgver=3.10.5
pkgrel=1
pkgdesc="A fast implementation of the Cassowary constraint solver"
arch=(x86_64)
url="https://${_base}.org"
license=(PSF-2.0)
depends=(gcc-libs glibc freetype2 pypy3-contourpy pypy3-cycler
  pypy3-fonttools pypy3-kiwisolver pypy3-numpy pypy3-packaging
  pypy3-pillow pypy3-pyparsing qhull) # python-dateutil
makedepends=(git meson-pypy3 pypy3-build pypy3-installer pypy3-setuptools-scm)
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git?signed#tag=v${pkgver})
validpgpkeys=('EB8322187FD451192E430A7279B3FEC456F12599') # Kyle Sunden (Git) <git@ksunden.space>
sha512sums=('e3c9dd6826b1ffa304e67e5bccbad20f4b8e218998a13847e2ca6623992cbd27bf8ad400e9a306a1a125acf361c2d84c6a02a6dd3695d68333b48e2bbfd55441')

prepare() {
  cd ${_base}-${pkgver}
  sed -i 's|,<0.17.0||' pyproject.toml
}

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation \
    -C setup-args=-Dsystem-freetype=true \
    -C setup-args=-Dsystem-qhull=true
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
