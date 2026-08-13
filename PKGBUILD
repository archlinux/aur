# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>
pkgname=python-croniter
_name=${pkgname#python-}
pkgver=6.2.4
pkgrel=3
pkgdesc="Parses cron schedules to iterate over datetime objects."
arch=('any')
url="https://github.com/pallets-eco/croniter"
license=('MIT')
depends=(
  'python'
  'python-dateutil'
  'python-pytz'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("https://github.com/pallets-eco/croniter/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('38729b9c329f95cf3f6f25ba2b233a1412afd366f6e79f8c4a38b4c90fb99a23')

prepare() {
  cd "$_name-$pkgver"

  # Relax requirements
  sed -i 's/==/>=/g' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -I -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Remove installed tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rfv "${pkgdir}${site_packages}/$_name/tests/"
}
