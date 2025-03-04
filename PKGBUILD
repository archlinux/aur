
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Joffrey <j-off@live.fr>

## GPG key: https://github.com/lepture.gpg

_base=captcha
pkgname=python-${_base}
pkgver=0.7.1
pkgrel=1
_commit=bd892b74cf5383eeb6193609e53bfb659ce0917c
pkgdesc="Library that generates audio and image CAPTCHAs"
arch=(any)
url="https://github.com/lepture/${_base}"
license=(BSD-3-Clause)
depends=(python-pillow)
optdepends=(python-wheezy-captcha)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-pytest python-wheezy-captcha)
source=("${_base}::git+$url#commit=$_commit?signed")
sha256sums=('d118562c903fedc2ce069c2f6f077a45df33a8f150b25663c7166b5d1a9a0c04')
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
