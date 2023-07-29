
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Joffrey <j-off@live.fr>

## GPG key: https://github.com/lepture.gpg

_base=captcha
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=1
_commit=35364f1
pkgdesc="Library that generates audio and image CAPTCHAs"
arch=(any)
url="https://github.com/lepture/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pillow)
optdepends=('python-wheezy-captcha')
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-pytest python-wheezy-captcha)
source=("${_base}::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('72F8E895A70CEBDF4F2ADFE07E55E3E0118B2B4C') # Hsiaoming Yang <me@lepture.com>

build() {
	cd ${_base}
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
	cd ${_base}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
