# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-mixpanel
_gitpkgname=mixpanel-python
pkgver=4.11.1
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

sha512sums=('81cc1b5a9bfdcbe83b0f9d2c8145a2b5d9a99efe971141789b9ff1a59f8e937c1e4700b2ee8850f3bb911521432f7db43872213bf41bed5398d6e037cb1f3648')

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
