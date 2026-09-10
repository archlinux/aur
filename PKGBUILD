# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=calendar-cli
pkgver=1.0.3
pkgrel=1
pkgdesc="A caldav client for calendar and task management"
url="https://github.com/tobixen/calendar-cli"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'python-caldav' 'python-dateutil' 'python-icalendar' 'python-pytz'
         'python-vobject' 'python-tzlocal' 'python-six' 'python-yaml')
makedepends=('python-build'
             'python-hatchling'
             'python-hatch-vcs'
             'python-installer')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobixen/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1703e1b500a500d5463af842fc1dce4be7e2030060901c5398403536f398107f')

build() {
  cd "$pkgname-$pkgver"
  # GitHub's archive tarball carries no .git, so hatch-vcs cannot find a
  # version.  The scoped SETUPTOOLS_SCM_PRETEND_VERSION_FOR_* form is no use
  # here: hatch-vcs never passes dist_name to setuptools-scm.
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
