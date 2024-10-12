# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-facedancer
_gitpkgname=facedancer
pkgver=3.0.4
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

sha512sums=('aab4499505877aee221cae3f5c395907578150c58b22cdd109660ddee62b137e6f2e59aae47397ba8b69703653a9d07d7e06481782f6515c840997a9702c3c4f')

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
