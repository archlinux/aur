# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-mixpanel
_gitpkgname=mixpanel-python
pkgver=5.0.0
pkgrel=1
pkgdesc='Official Mixpanel Python library'
arch=('any')
url='https://github.com/mixpanel/mixpanel-python'
license=('Apache-2.0')
depends=(
  'python'
  'python-asgiref'
  'python-httpx'
  'python-pydantic'
  'python-requests'
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
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-responses'
  'python-respx'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/mixpanel/mixpanel-python/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'c92a795dc40e58659cb1156608186eae31d957fd21cbb31de15885a8e437eca3d8d82a62f88f76e20d17720b761885e0d08347aee2abf6dc095b876bf6ef81e6'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"
  echo 'global-exclude test_*.py' > MANIFEST.in
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  # Build wheel from sdist so it honors MANIFEST.in, which prevents
  # tests from ending up inside the wheel
  python -m build --no-isolation

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
