# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Immae

pkgname=python-pybtex
pkgver=0.26.1
pkgrel=2
pkgdesc="A BibTeX-compatible bibliography processor written in Python"
arch=("any")
url="https://pybtex.org"
license=("MIT")
# Overridden in package_* functions
makedepends=('python-hatchling' 'python-build' 'python-installer')
depends=('python' 'python-yaml' 'python-latexcodec' 'python-importlib-metadata')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pybtex/pybtex-$pkgver.tar.gz")
sha256sums=('2e5543bea424e60e9e42eef70bff597be48649d8f68ba061a7a092b2477d5464')

get_pyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

build() {
  cd pybtex-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd pybtex-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd pybtex-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Files under site-packages/tests/ conflict with other python packages.
  rm -rf "${pkgdir}/usr/lib/python$(get_pyver)"/site-packages/tests

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
