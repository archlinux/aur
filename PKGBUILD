# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-luna-usb
_gitpkgname=luna
pkgver=0.1.2
pkgrel=1
pkgdesc='Amaranth HDL framework for monitoring, hacking, and developing USB devices'
arch=('any')
url='https://github.com/greatscottgadgets/luna'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-amaranth<0.5'
  'python-apollo'
  'python-pyserial'
  'python-pyusb'
  'python-pyvcd'
  'python-usb-protocol'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-jschon'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
optdepends=(
  'python-cynthion: connect to Cynthion hardware'
  'python-libusb1: to use the bulk_speed_test applet'
  'python-luna-boards: connect to Luna boards'
  'python-prompt_toolkit: to use the included applets'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/greatscottgadgets/luna/archive/${pkgver}.tar.gz"
)

sha512sums=('2ba9721b0df191b7092ea163fef67c3ad0b96d28ab8c4d60a31bec2a0436978b32e5d2c8660430b24c96e47f2f92d6be6419807fb872e26b57d44f9eba09988a')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Removing unneeded files'
  find examples -name '.*' -exec rm -fv '{}' +

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

  export PYTHONPATH=.

  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man docs docs/build/man

  echo >&2 'Generating HTML documentation'
  sphinx-build -aqEW -b singlehtml docs docs/build/singlehtml
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  python -m installer --destdir=tmp_install dist/*.whl

  echo >&2 'Running unit tests'
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}" \
    python -m unittest discover -v
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging udev rules'
  install -D -m 644 -t "${pkgdir}/usr/lib/udev/rules.d" \
    contrib/*.rules

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/gtkwave" \
    contrib/usb3-gtkwave.txt
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_images,_static}
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    docs/build/man/*.1

  echo >&2 'Packaging applets and examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    applets examples

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
