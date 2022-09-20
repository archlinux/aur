# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Wouter Wijsman <wwijsman@live.nl>
pkgname=minigalaxy
pkgver=1.2.1
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
sha256sums=('680f24248e1235459c1de1d127ea6c642a752ced8b9d2e14b2b168db093a9f48')

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
