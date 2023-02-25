# Maintainer: Dashon Wells <me@me.me>
# Contributor Michael Riegert <michael at eowyn net>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname="catt"
pkgver=0.12.10
pkgrel=2
pkgdesc='Cast All The Things - Send videos from many, many online sources to your Chromecast.'
arch=('any')
url="https://github.com/skorokithakis/catt"
license=('BSD')
depends=()
makedepends=(
  'python-installer'
  'python-poetry'
  'python-setuptools'
)
provides=("$pkgname")
conflicts=(${provides[@]})
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11b77cf5a3ccb96a5f3234334a8f888cf23d2435d4acefbcaca0376290468be0')

build() {
  cd "$pkgname-$pkgver"
  GIT_DIR='.' python -m poetry build --format wheel
}

package() {
  depends+=(
    'python-click'
    'python-importlib-metadata'  # silence namcap warning
    'python-pychromecast'
    'yt-dlp'
  )

  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  python -m installer --destdir="$pkgdir" dist/*.whl
}
