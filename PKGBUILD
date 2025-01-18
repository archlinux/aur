# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

_pkgname=openlibrary-client
pkgname=python-${_pkgname}-git
pkgver=0.0.17.r409.g7e45d51
pkgrel=1
pkgdesc="Python Client Library for the Archive.org OpenLibrary API"
arch=(any)
license=(AGPL-3.0-or-later)
url="https://github.com/internetarchive/openlibrary-client"
depends=(
  python
  python-jsonschema
  python-jsonpickle
  python-internetarchive
  python-backoff
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  git
)
checkdepends=(
  python-pytest
  python-responses
)
source=("git+https://github.com/internetarchive/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest
  rm test-env -R
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
