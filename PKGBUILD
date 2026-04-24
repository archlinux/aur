# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matplotlib
pkgname=pypy3-${_base}
pkgver=3.10.9
pkgrel=1
pkgdesc="A fast implementation of the Cassowary constraint solver"
arch=(x86_64)
url="https://${_base}.org"
license=(PSF-2.0)
depends=(gcc-libs glibc freetype2 pypy3-contourpy pypy3-cycler
  pypy3-fonttools pypy3-kiwisolver pypy3-numpy pypy3-packaging
  pypy3-pillow pypy3-pyparsing pypy3-dateutil qhull)
makedepends=(git meson-pypy3 pypy3-build pypy3-installer pypy3-setuptools-scm pypy3-pybind11)
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git?signed#tag=v${pkgver})
validpgpkeys=('EB8322187FD451192E430A7279B3FEC456F12599') # Kyle Sunden (Git) <git@ksunden.space>
sha512sums=('51ceba20649af84391c59d9ead806fc864fa7f4ee9f1b7c2fad6836304a111081640a4107b13166fb1e9c2f340857df67f5563ddebe7913f73088115f643bd74')

prepare() {
  cd ${_base}-${pkgver}
  sed -i 's|,<0.17.0||' pyproject.toml
}

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  PKG_CONFIG_PATH=$(/opt/pypy3/bin/pybind11-config --pkgconfigdir) \
    pypy3 -m build --wheel --skip-dependency-check --no-isolation \
    -C setup-args=-Dsystem-freetype=true \
    -C setup-args=-Dsystem-qhull=true
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
