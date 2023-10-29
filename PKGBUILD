# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="scikit-misc"
pkgname="python-${_name}"
pkgver=0.3.0
pkgrel=2
pkgdesc="Miscellaenous tools for scientific computing"
arch=('x86_64')
url="https://github.com/has2k1/${_name}"
license=('BSD')
depends=(
  "python>=3.9"
  "python-numpy>=1.22.3"
  "blas-openblas"
)
makedepends=(
  "python-setuptools"
  "python-build"
  "python-installer"
  "python-wheel"
  "python-spin"
  "meson"
  "meson-python"
  "cython"
  "gcc-fortran" # Alternative compilers are also supported
)
optdepends=(
  "python-yaml: Better output during compilation"
)
checkdepends=(
  "python-pytest"
)

# NOTE: PyPi source fails, see: https://github.com/has2k1/scikit-misc/issues/27
# For now: use git-archives
source=(
  "${_name}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  "71cad2f9df1d21f9f64eddcae4c152c6dcf49a0183b9b53885bd12084dbdaa2a"
)
_archive="${_name}-${pkgver}"

prepare() {
  cd "${_archive}"
  # Remove older (specific) numpy requirement
  sed -r -i 's/(numpy)==/\1>=/' pyproject.toml
  # Disable coverage during check()
  sed -i -e 's/--cov=skmisc --cov-report=xml//' pyproject.toml
  # Append version info manually
  sed -i "s/ version: .*/ version: '${pkgver}',/" meson.build 
}

build() {
  cd "${_archive}"
  python -m build --wheel --no-isolation
}

check() {
  # Stolen from python-numpy
  local site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  cd "${_archive}"

  python -m installer --destdir="${PWD}/tmp_install" dist/*.whl
  cd "${PWD}/tmp_install"
  PATH="${PWD}/usr/bin:${PATH}" PYTHONPATH="${PWD}/${site_packages}:${PYTHONPATH}" pytest
}

package() {
  cd "${_archive}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

# vim: sw=2 ts=2 et:
