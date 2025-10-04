# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>
_base=abjad
pkgname=python-${_base}
pkgver=3.30
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
sha512sums=('a56481f8b3a07b1529658fa2067ca9f69aecfd5e8548672e33b89c51ffc568cb0b1ffe5dd74be27f5547d454c9e3b4ab2a7bc84984a7aecf6aabe524d0a4a236')
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
