# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-luna-soc
_gitpkgname=luna-soc
pkgver=0.2.0
pkgrel=1
pkgdesc='Amaranth HDL libary for building USB-capable SoC designs'
arch=('any')
url='https://github.com/greatscottgadgets/luna-soc'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-amaranth<0.5'  # https://github.com/greatscottgadgets/luna-soc/issues/21
  'python-luna-usb'
  'python-pyserial'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-minerva-git'
  'python-pyproject-patcher'
  'python-recommonmark'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-sphinxcontrib-apidoc'
  'python-wheel'
)
optdepends=(
  'python-minerva-git: to implement SoC designs using a Minerva RISC-V CPU'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/greatscottgadgets/luna-soc/archive/${pkgver}.tar.gz"
)

sha512sums=('544f95acb79598806e460852b6311a49e789d165bf56dddaff209f202412dae6d0de92d18e840fb903164b967307be380d112bfab3dedd185cbfb581775bd696')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.set_project_version_from_env('pkgver')
    toml.tools.setuptools_git_versioning.remove()
EOF
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating documentation'
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}" \
    make -C docs singlehtml
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_images,_static}

  echo >&2 'Packaging applets and examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    applets examples

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
