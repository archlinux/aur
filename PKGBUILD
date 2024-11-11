# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=RaySession
pkgname=${_name,,}
pkgver=0.14.4
pkgrel=1
pkgdesc="Session manager for audio programs using the Non Session Manager (NSM) API"
arch=(any)
url='https://github.com/Houston4444/RaySession'
license=(GPL-2.0-only)
depends=(hicolor-icon-theme dbus-python python-pyalsa python-pyqt5 python-pyliblo python-pyxdg qt5-svg)
makedepends=(qt5-tools)
optdepends=(
  'python-gobject: additional JACK helper scripts'
  'python-pyjacklib: additional JACK helper scripts'
)
groups=(pro-audio)
source=("https://github.com/Houston4444/RaySession/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz"
        'raysession-makefile-destdir.patch')
sha256sums=('72bf64a9976a63a5aaf91933c18c4dadbfcf2c54442948167953482d552473b0'
            '943c821d4d5cae581004ca54030b720ac835a03cd7691492bcbcb6e146bb078a')

prepare() {
  cd $_name-$pkgver
  patch -p1 -N -r - -i "$srcdir"/raysession-makefile-destdir.patch
}

build() {
  cd $_name-$pkgver
  make
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
