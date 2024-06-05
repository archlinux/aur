# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-usb-protocol
pkgver=0.9.0
pkgrel=1
pkgdesc='Utilities, data structures, constants, parsers, and tools for working with USB data'
arch=('any')
url='https://github.com/greatscottgadgets/python-usb-protocol'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-construct'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pyproject-patcher'
  'python-recommonmark'
  'python-setuptools'
  'python-sphinx'
  'python-sphinxcontrib-apidoc'
  'python-sphinx_rtd_theme'
  'python-wheel'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/greatscottgadgets/python-usb-protocol/archive/${pkgver}.tar.gz"
)

sha512sums=('289e69ee456b6e3157b9ea8acc41dc2533bb29a34ad239dc98138eae85ab7f0b44b1819864333976768f38cc1b16bd47edd1124b6a47bd492fade9b9b1256e2b')

prepare() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.set_project_version_from_env('pkgver')
    toml.remove_setuptools_git_versioning_section()
EOF
}

build() {
  local _site_packages
  cd "${pkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating documentation'
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}" \
    make -C docs singlehtml
}

package() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_static}

  echo >&2 'Packaging the examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" \
    examples/*

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
