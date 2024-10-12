# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cynthion
_gitpkgname=cynthion
pkgver=0.1.7
pkgrel=1
pkgdesc='Python package and utilities for the Great Scott Gadgets Cynthion USB Test Instrument'
arch=('any')
url='https://github.com/greatscottgadgets/cynthion'
license=('BSD-3-Clause')
depends=(
  "cynthion-firmware=${pkgver}"
  'python'
  'python-amaranth<0.5'  # https://github.com/greatscottgadgets/cynthion/issues/39
  'python-apollo'
  'python-luna-usb'
  'python-luna-soc'
  'python-pyfwup'
  'python-pygreat'
  'python-pyusb'
  'python-tomli'
  'python-tqdm'
  'python-usb-protocol'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-sphinx-inline-tabs'
  'python-wheel'
)
optdepends=(
  'python-facedancer: to run the included examples'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)

sha512sums=('4476dcfc21c64c28a0a1e8a9a2197fc441c5d0cd36aeb9a4c674c038157a95420d4374c99bf5e9f380e9a4014bdd03238260311c034fcf02d0f3381c1a15adb6')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('cynthion/python/pyproject.toml') as toml:
    toml.set_project_version_from_env('pkgver')
    toml.tools.setuptools_git_versioning.remove()
EOF
}

_site_packages() {
  python -c 'import site; print(site.getsitepackages()[0])'
}

build() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation cynthion/python

  echo >&2 'Generating documentation'
  make -C docs singlehtml
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  python -m installer --destdir=tmp_install cynthion/python/dist/*.whl

  echo >&2 'Running unit tests'
  PYTHONPATH="${PWD}/tmp_install/$(_site_packages)" \
    python -m unittest discover -v cynthion/python/tests
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" cynthion/python/dist/*.whl

  echo >&2 'Symlinking binaries and bitstreams'
  mkdir -p "${pkgdir}/$(_site_packages)/cynthion/assets"
  find /usr/lib/cynthion-firmware -maxdepth 1 \
    '-(' -name '*.bin' -o -name 'CynthionPlatform*' '-)' -exec \
    ln -fnsv '{}' "${pkgdir}/$(_site_packages)/cynthion/assets/" ';'

  echo >&2 'Packaging udev rules'
  install -D -m 644 -t "${pkgdir}/usr/lib/udev/rules.d" \
    cynthion/python/assets/*.rules

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_images,_static}

  echo >&2 'Packaging the examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    cynthion/python/examples

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
