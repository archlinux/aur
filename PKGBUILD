# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matplotlib
pkgname=pypy3-${_base}
pkgver=3.10.3
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
sha512sums=('9d28c49e1fba7bb4560178bbe16464017ba727ef2b389d4d083949b9d5f2b5f0cca63845e82f7ddc150a1b2699c1eb96da6691a17a9889806e475c8a1416ed37')

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
