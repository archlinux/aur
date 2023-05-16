# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>
_base=Mastodon.py
pkgname=python-mastodon
pkgver=1.8.1
pkgrel=1
pkgdesc="Python wrapper for the Mastodon API"
arch=(any)
url="https://github.com/halcy/${_base}"
license=(MIT)
depends=(python-requests python-dateutil python-six python-magic python-decorator python-blurhash)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-cryptography: webpush support'
  'python-halcy-blurhash: blurhash support'
  'python-http-ece: webpush support')
checkdepends=(python-pytest-runner python-pytest-cov python-pytest-vcr python-pytest-mock python-requests-mock python-pytz python-halcy-blurhash python-cryptography python-http-ece)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('8144ba57680425ff42ecdc8b25604e7e4f26d53a3bd5e40931f0ed5b9ba59208d3c4eb4366d8fc8787c434ec70afb88a4bd6103d10d75e894388f5311ed6b582')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
