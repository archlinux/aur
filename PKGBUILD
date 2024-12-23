# Maintainer: xsmile <>

pkgname=chromexup
pkgver=0.5.4
pkgrel=4
pkgdesc='External extension updater for Chromium based browsers'
arch=(any)
url=https://github.com/xsmile/chromexup
license=(MIT)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-requests)
install="$pkgname.install"
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('4092e0662f24123a2c3ad25603bf7392688966d07ebecc1194fae617d4461331')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver

  # Configuration template
  install -Dm644 config.ini.example -t "$pkgdir"/usr/share/$pkgname/
  # Systemd scripts
  install -Dm644 scripts/systemd/$pkgname.service      -t "$pkgdir"/usr/lib/systemd/user/
  install -Dm644 scripts/systemd/$pkgname-daily.timer  -t "$pkgdir"/usr/lib/systemd/user/
  install -Dm644 scripts/systemd/$pkgname-weekly.timer -t "$pkgdir"/usr/lib/systemd/user/
  # License
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  python -m installer --destdir="$pkgdir" dist/*.whl
}
