# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-facedancer
_gitpkgname=facedancer
pkgver=3.0.3
pkgrel=1
pkgdesc='Implement your own USB device in Python using Cynthion or GreatFET hardware'
arch=('any')
url='https://github.com/greatscottgadgets/facedancer'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-libusb1'
  'python-prompt_toolkit'
  'python-pyserial'
  'python-pyusb'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-sphinxcontrib-apidoc'
  'python-wheel'
)
optdepends=(
  'greatfet: use Facedancer with a GreatFET backend'
  'python-cynthion: use Facedancer with a Cynthion backend'
  'python-rpi-gpio: use Facedancer with a Raspdancer backend'
  'python-spi-py-git: use Facedancer with a Raspdancer backend'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/greatscottgadgets/facedancer/archive/${pkgver}.tar.gz"
)

sha512sums=('a3137ac9f05511376198953f15d87dd33573241e77fcfe378ab46c657d961a0686f72f714c8ab7538070731031e3d979697c3d41e0000c28a121481a7742abb6')

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
    docs/build/singlehtml/{index.html,_static}

  echo >&2 'Packaging examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    examples

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
