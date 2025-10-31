# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="scikit-misc"
pkgname="python-${_name}"
pkgver=0.5.2a1
pkgrel=1
pkgdesc="Miscellaenous tools for scientific computing"
arch=('x86_64')
url="https://github.com/has2k1/${_name}"
license=('BSD-3-Clause')
depends=(
  "python>=3.10"
  "python-numpy>=2.0.0"
  "glibc"
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
  "git"
)
optdepends=(
  "python-yaml: Better output during compilation"
)
checkdepends=(
  "python-pytest"
)

source=(
  "${_name}-${pkgver}"::"git+${url}#tag=v${pkgver}"
)

sha256sums=('2eac275ef525c050cb48d01817517cc3abcdb6194ca55b333a2798159a8e88ff')

_archive="${_name}-${pkgver}"

prepare() {
  cd "${_archive}"
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
