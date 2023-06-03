# Maintainer: Dashon Wells <me@me.me>
# Contributor Michael Riegert <michael at eowyn net>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname="catt"
pkgver=0.12.11
pkgrel=1
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
sha256sums=('82d69d963696dfe3cfece6bdb03d96e35c80351ca8231d51b9da15bd1d3c8c4d')

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
