# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Wouter Wijsman <wwijsman@live.nl>
pkgname=minigalaxy
pkgver=1.2.2
pkgrel=1
pkgdesc="A simple GOG client for Linux"
arch=('any')
url="https://sharkwouter.github.io/minigalaxy"
license=('GPL3' 'CC-BY-3.0')
depends=('gtk3' 'python-gobject' 'python-requests' 'unzip' 'webkit2gtk' 'xdg-utils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-coverage' 'python-simplejson')
optdepends=('dosbox: Use the system DOSBox installation'
            'innoextract: Extract Windows installers'
            'scummvm: Use the system ScummVM installation'
            'wine: Install Windows games')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sharkwouter/minigalaxy/archive/$pkgver.tar.gz")
sha256sums=('0ae5fc29560d4e02b193274fbfd1df169d500cdb63bb32dee8bbfb30c11f5855')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"

  # Run unit tests
  python -m coverage run --source minigalaxy -m unittest discover -v tests
  python -m coverage report -m
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 THIRD-PARTY-LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
