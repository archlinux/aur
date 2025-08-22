# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=bandcamp-dl-git
pkgver=v0.0.17.r42.g0b77700
pkgrel=1
pkgdesc="Download audio from bandcamp.com"
arch=('any')
url="https://github.com/Evolution0/bandcamp-dl"
license=('Unlicense')
makedepends=('git' 'python-build' 'python-installer')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-chardet'
  'python-demjson3'
  'python-docopt'
  'python-mutagen'
  'python-requests'
  'python-unicode-slugify'
  'python-setuptools'
  'python-urllib3-future'
)
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
options=(!emptydirs)
source=("git+https://github.com/Evolution0/bandcamp-dl.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  sed -i 's/from urllib3.util/from urllib3_future.util/' bandcamp_dl/bandcamp.py
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 643 UNLICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
