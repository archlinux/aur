# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=RaySession
pkgname=${_name,,}
pkgver=0.17.0
pkgrel=1
pkgdesc="Session manager for audio programs using the Non Session Manager (NSM) API"
arch=(any)
url='https://github.com/Houston4444/RaySession'
license=(GPL-2.0-only)
depends=(hicolor-icon-theme dbus-python python-jack-client python-pyalsa python-pyqt6 python-pyliblo
  python-pyxdg qt6-svg)
makedepends=(qt6-tools)
optdepends=(
  'python-gobject: additional JACK helper scripts'
  'python-pyjacklib: additional JACK helper scripts'
)
groups=(pro-audio)
source=("https://github.com/Houston4444/RaySession/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz"
        'raysession-makefile-destdir.patch')
sha256sums=('e879ecae851d13bdc656282645f610ebe6d7d3b0e221f1f9e47b11ac902cac28'
            '943c821d4d5cae581004ca54030b720ac835a03cd7691492bcbcb6e146bb078a')

build() {
  cd $_name-$pkgver
  make LRELEASE=/usr/lib/qt6/bin/lrelease RCC=/usr/lib/qt6/rcc
}

package() {
  cd $_name-$pkgver
  make -j 1 PREFIX=/usr DESTDIR="$pkgdir" install
  # remove broken symlink
  rm -f "$pkgdir"/usr/share/raysession/src/bin/ray-jackpatch-mon
  # client templates installed @ /etc/xdg/raysession & /usr/share/raysession
  # we need only one
  rm -rf "$pkgdir"/usr/share/raysession/client_templates
  install -Dm644 CHANGELOG README.md TODO TRANSLATORS plans.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
