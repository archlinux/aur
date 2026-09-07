# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Josh Holmer <jholmer.in@gmail.com>

pkgname=python-videotimestamps
_origpkgname=videotimestamps
pkgver=1.2.0
pkgrel=1
pkgdesc="Get video timestamps."
arch=("x86_64")
url='https://github.com/moi15moi/VideoTimestamps/'
license=("MIT")
depends=(
  "ffmpeg"
  "ffms2-git"
  "dav1d"
  "python-xxhash"
  "xxhash"
)
makedepends=(
  "meson"
  "meson-python"
  "python-build"
  "python-installer"
  "python-wheel"
  "python-setuptools"
  "nanobind"
  "robin-map"
)
source=("https://files.pythonhosted.org/packages/source/v/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('a8ace9dcb148656dd552b6fc8d9c817bc2bd5192b4985ff50a0384caf0b835cb')

prepare() {
  cd "${_origpkgname}-${pkgver}" || exit
  # Strip the forced static and fallback flags from pyproject.toml
  sed -i 's/--default-library=static/--default-library=shared/g' pyproject.toml
  sed -i 's/--wrap-mode=forcefallback/--wrap-mode=default/g' pyproject.toml
}

build() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}