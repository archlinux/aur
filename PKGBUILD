# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=plann
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=1
pkgdesc="plann is a caldav client for calendar and task management"
url="https://github.com/tobixen/plann"
arch=('any')
license=('GPL')
depends=('python'
         'python-caldav'
         'python-click'
         'python-yaml'
         'python-sortedcontainers'
         'python-dateparser'
         'python-icalendar')
makedepends=('python-build'
             'python-installer'
             'python-pytest'
             'python-hatchling'
             'python-hatch-vcs'
             'python-wheel'
             'xandikos')
source=("https://github.com/tobixen/$pkgname/archive/v$pkgver.tar.gz")


build() {
  cd "${_name}-$pkgver"
  # source tarball has no .git, so hatch-vcs cannot derive the version
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-$pkgver"
  # test_functional.py needs niquests (AUR-only) and a live server; the
  # caldav lib handles its own request backend, so plann has no niquests dep.
  pytest --ignore=tests/test_functional.py
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('4413966bbfc269f8aa966d3b0894647e152da5b8124a07ad21fb08714508e7ff')

