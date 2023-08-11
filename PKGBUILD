# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Wouter Wijsman <wwijsman@live.nl>
pkgname=minigalaxy
_app_id=io.github.sharkwouter.Minigalaxy
pkgver=1.2.5
pkgrel=1
pkgdesc="A simple GOG client for Linux"
arch=('any')
url="https://sharkwouter.github.io/minigalaxy"
license=('GPL3' 'CC-BY-3.0')
depends=('gtk3' 'python-gobject' 'python-requests' 'unrar' 'unzip' 'webkit2gtk-4.1' 'xdg-utils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('appstream-glib')
optdepends=('dosbox: Use the system DOSBox installation'
            'innoextract: Extract Windows installers'
            'scummvm: Use the system ScummVM installation'
            'wine: Install Windows games')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sharkwouter/minigalaxy/archive/$pkgver.tar.gz")
sha256sums=('c0190851c69d89b7b3784a66617af24519977fffb88ee4fabf77db89ea16863f')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  appstream-util validate-relax --nonet "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 THIRD-PARTY-LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
