# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>
_base=abjad
pkgname=python-${_base}
pkgver=3.31
pkgrel=1
pkgdesc="Python API for building LilyPond files"
arch=(any)
url="https://github.com/Abjad/${_base}"
license=(GPL3)
depends=(lilypond python-ply python-roman python-uqbar)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('graphviz: creates rhythm-trees graphs and other tree structures'
  'python-abjad-ext-nauert: quantization extension'
  'python-abjad-ext-rmakers: rhythm-maker extension'
  'timidity++: playback generated MIDI files')
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ee0b8ec81c76bc8654f18c898af45a8fc2d56f955aa393a3431826469c015a41ee055b0c7cf4920c10af399b8ba511ff6bbddad86f28137bba7315641a3e7bfd')
# validpgpkeys=('EF80D3D6F5926FC997919D6A27A5BE0A6ADE7F36') ## Trevor Baca

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests # -x -c /dev/null
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
