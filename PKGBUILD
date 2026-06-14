# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Joe Davison <joe@warhaggis.com>
# Contributor: Wouter Wijsman <wwijsman@live.nl>

pkgname=minigalaxy-git
pkgver=1.4.1.r72.g1127c95
pkgrel=2
pkgdesc="A simple GOG client for Linux"
arch=(any)
url="https://github.com/sharkwouter/minigalaxy"
license=('GPL-3.0-or-later AND CC-BY-3.0')
depends=(
    gdk-pixbuf2
    glib2
    gtk3
    hicolor-icon-theme
    python
    python-gobject
    python-requests
    webkit2gtk-4.1
    )
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
    )
checkdepends=(
    dosbox
    innoextract
    python-coverage
    python-simplejson
    scummvm
    )
optdepends=(
    'dosbox: Use the system DOSBox installation'
    'innoextract: Extract Windows installers'
    'scummvm: Use the system ScummVM installation'
    'wine: Install Windows games'
    )
provides=(minigalaxy)
conflicts=(minigalaxy)
source=("git+https://github.com/sharkwouter/minigalaxy.git")
sha256sums=('SKIP')

pkgver() {
  cd "minigalaxy"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

build() {
  cd "minigalaxy"
  python -m build --wheel --no-isolation
}

check() {
  cd "minigalaxy"
  LANG=C.UTF-8 python -m coverage run --source minigalaxy -m unittest discover -v tests
  LANG=C.UTF-8 python -m coverage report -m
}

package() {
  cd "minigalaxy"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
