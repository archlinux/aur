# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-mixpanel
_gitpkgname=mixpanel-python
pkgver=4.10.1
pkgrel=1
pkgdesc='Official Mixpanel Python library'
arch=('any')
url='https://github.com/mixpanel/mixpanel-python'
license=('Apache-2.0')
depends=(
  'python'
  'python-requests'
  'python-six'
  'python-urllib3'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-responses'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/mixpanel/mixpanel-python/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '7341dd931ac1d727f0fff8e6ab655f873193658c5c947433599d6ebe579c1698287c3ec3de0ff35ba01d0dbffe265def5d1b42597d34b91e50dc36a71f592b63'
)

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating HTML documentation'
  sphinx-build -aqEW -b singlehtml docs docs/build/singlehtml
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Running unit tests'
  pytest
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.rst
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_static}

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
