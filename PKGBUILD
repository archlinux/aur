# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>
pkgname=python-croniter
_name=${pkgname#python-}
pkgver=6.2.3
pkgrel=1
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
sha256sums=('47da8eb60338126f625156ff32335068e6f9e94d09443a59bc241253fca8ed3c')

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
  pytest src
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Remove installed tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rfv "${pkgdir}${site_packages}/$_name/tests/"
}
