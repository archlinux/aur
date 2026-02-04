# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dashon Wells <me@me.me>
pkgname=catt-qt
pkgver=4.0
pkgrel=5
pkgdesc="Cast All The Things Qt GUI"
arch=('any')
url="https://github.com/soreau/catt-qt"
license=('GPL-3.0-or-later')
depends=(
  'catt'
  'python-pychromecast'
  'python-pyqt5'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'pychromecast-14.patch'
        "$pkgname.desktop")
sha256sums=('c5f0b39b0b33ffa1ff2aa9db884da9dbfd0ad36611eb295b1b9296fb3814b46f'
            'c29db56162ed3233b0763d7ea61a86092ef9222c3bcfad253a87b97922faa014'
            '98011e8a1a716bbdd455bb455ef61e48b1e9a4f08f003392c796c228abbac6f4')

prepare() {
  cd "$pkgname-$pkgver"

  # Fix compatibility with pychromecast >= 14.0.0
  # https://github.com/soreau/catt-qt/pull/12
  patch -Np1 -i ../pychromecast-14.patch
}

build() {
  cd "$pkgname-$pkgver"

  # Tries to import itself during build, define path and
  # skip checking for erroneous dependencies listed in pyproject.toml
  PYTHONPATH=. python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 cattqt/chromecast.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
