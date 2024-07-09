# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cynthion
_gitpkgname=cynthion
pkgver=0.1.1
pkgrel=2
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
  'python-wheel'
)
optdepends=(
  'python-facedancer: to run the included examples'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  'github-pr-127.patch'
)

sha512sums=(
  '8f045bab9deb8966bb50ef338d2f7abb169545d65dc6d4be5b6f53d8c1bd99ef942587dbc6bc40c4007bd474bf93543bfe4409d36005b20da3dc538802a54613'
  'c4807460f6bfab5222b9b50b82d3c0db277815181337f6daf450d0c9213426cc1cae22fca74638d13be91877abb5d3bd4ead3c0cba986baf2f68ba9cc3efea29'
)

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

  # Fix location of assets directory
  # See also: https://github.com/greatscottgadgets/cynthion/pull/127
  # Remove this patch once upstream has cut a stable release of
  # v0.1.2 or newer on GitHub.
  patch -p1 < ../github-pr-127.patch
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
    python -m unittest discover -v cynthion/python
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
