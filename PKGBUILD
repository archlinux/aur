# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Wouter Wijsman <wwijsman@live.nl>
pkgname=minigalaxy
_app_id=io.github.sharkwouter.Minigalaxy
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple GOG client for Linux"
arch=('any')
url="https://sharkwouter.github.io/minigalaxy"
license=('GPL-3.0-or-later AND CC-BY-3.0')
depends=(
  'gtk3'
  'libnotify'
  'python-gobject'
  'python-requests'
  'unrar'
  'unzip'
  'webkit2gtk-4.1'
  'xdg-utils'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('appstream')
optdepends=(
  'dosbox: Use the system DOSBox installation'
  'innoextract: Extract Windows installers'
  'scummvm: Use the system ScummVM installation'
  'wine: Install Windows games'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sharkwouter/minigalaxy/archive/$pkgver.tar.gz")
sha256sums=('6e9db14edcb073ebaaa0f3ac3b76454e34f329caac94fda6ae3070ad542e9af6')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 THIRD-PARTY-LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
