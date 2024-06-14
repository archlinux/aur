# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-facedancer
_gitpkgname=facedancer
pkgver=2.9.0
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
  'github-pr-78-86d6016.patch'
)

sha512sums=(
  '10002558fac6f8e2187e2d8dca584adf52643eccf74ab9ba354c6dc420d764e52fe32c8694849f81a49d01d461f5cd0d55572a62c0cc992c9a51ef5601dc2942'
  'b6aa0083fcfd086de69a1cf59bce9470bb437c2103cd0972ed800fbcfcbc5a4d909b1ea5c1d342d2c28cde91ec82c62146c0f9946c070ca4b8674f5526996e11'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Adding documentation'
  # See also: https://github.com/greatscottgadgets/facedancer/pull/86
  # Remove this patch once a stable release of v3.0.0 or newer
  # has been tagged on GitHub
  patch -p1 < '../github-pr-78-86d6016.patch'

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

  echo >&2 'Packaging applets and examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    examples legacy-applets

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
