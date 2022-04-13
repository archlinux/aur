# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Joe Davison <joe@warhaggis.com>
# Contributor: Wouter Wijsman <wwijsman@live.nl>

pkgname=minigalaxy-git
pkgver=1.1.0.r91.g3882973
pkgrel=1
pkgdesc="A simple GOG client for Linux"
arch=(any)
url="https://github.com/sharkwouter/minigalaxy"
license=(GPL3 'CCPL:cc-by-sa-3.0')
depends=(python python-requests python-gobject gtk3 webkit2gtk)
makedepends=(python-setuptools git)
checkdepends=(python-pytest python-simplejson)
optdepends=('dosbox: Use the system DOSBox installation'
            'innoextract: Extract Windows installers'
            'scummvm: Use the system ScummVM installation'
            'wine: Install Windows games')
provides=(minigalaxy)
conflicts=(minigalaxy)
source=("git+https://github.com/sharkwouter/minigalaxy.git")
sha256sums=('SKIP')

pkgver() {
  git -C minigalaxy describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  pytest -v
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
