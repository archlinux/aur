# Maintainer: rootuserbino <king_all_in_hills@protonmail.com>
pkgname=multidl
pkgbase=multidl
pkgver=2.1.1
pkgrel=1
pkgdesc="A CLI tool for downloading media from various platforms"
arch=('any')
url="https://github.com/swayam25/Multi-DL"
license=('GPL3')
depends=(
  'python-aiohttp'
  'python-click'
  'python-mutagen'
  'python-platformdirs'
  'python-pyfiglet'
  'python-rich'
  'python-toml'
  'python-typer'
  'python-redis'
  'python-six'
  'python-textual'
  'yt-dlp'
  'ffmpeg'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-poetry-core'
  'python-setuptools'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/swayam25/Multi-DL/archive/v$pkgver.tar.gz"
  "spotipy-2.23.0.tar.gz::https://files.pythonhosted.org/packages/source/s/spotipy/spotipy-2.23.0.tar.gz"
  "trogon-0.6.0.tar.gz::https://files.pythonhosted.org/packages/source/t/trogon/trogon-0.6.0.tar.gz"
)
sha256sums=(
  '11fdf5ce1209033bd5a7526bd539e843edf4808f7ffc1241ec076f223999c328'
  '0dfafe08239daae6c16faa68f60b5775d40c4110725e1a7c545ad4c7fb66d4e8'
  'fd1abfeb7b15d79d6e6cfc9e724aad2a2728812e4713a744d975f133e7ec73a4'
)

build() {
  # Build Spotipy
  cd "$srcdir/spotipy-2.23.0"
  /usr/bin/python setup.py build

  # Build Trogon
  cd "$srcdir/trogon-0.6.0"
  /usr/bin/python -m build --wheel --no-isolation

  # Build Multi-DL
  cd "$srcdir/Multi-DL-${pkgver}"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  # Install Spotipy
  cd "$srcdir/spotipy-2.23.0"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1

  # Install Trogon
  cd "$srcdir/trogon-0.6.0"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install Multi-DL
  cd "$srcdir/Multi-DL-${pkgver}"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Add docs and license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CODE_OF_CONDUCT.md "$pkgdir/usr/share/doc/$pkgname/CODE_OF_CONDUCT.md"
}
