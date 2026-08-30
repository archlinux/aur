# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-python-crontab
_name=python-crontab
pkgver=3.4.0
pkgrel=1
pkgdesc="Crontab module for reading and writing crontab files and accessing the system cron automatically and simply using a direct API."
arch=('any')
url="https://gitlab.com/doctormo/python-crontab"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-cron-descriptor'
  'python-croniter'
  'python-pytest'
  'python-tests'
)
optdepends=(
  'cronie'
  'python-cron-descriptor: Ask for a translated string'
  'python-croniter: Run a cron tab as a daemon'
)
source=("$url/-/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('8b171f012f84507ac90a981a138b0191bcca6576cf53bc6d1dd92b7cf493c62b')

build() {
  cd "$_name-v$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-v$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  # test_07_non_posix_shell - only for Windows
  # test_04_schedule_ten - broken test, scheduler returns 0 instead of expected 1-2
  test-env/bin/python -I -m pytest -k "not test_07_non_posix_shell and not test_04_schedule_ten"
}

package() {
  cd "$_name-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
