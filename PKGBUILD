# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="scikit-misc"
pkgname="python-${_name}"
pkgver=0.3.1
pkgrel=1
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

source=(
  "${_name}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  "7d5367253f2b17e330dcf0fe7afad7a6986bd6e747d45bd4727a67b7ac68cb0a"
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
