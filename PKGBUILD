# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=RaySession
pkgname=${_name,,}
pkgver=0.17.4
pkgrel=1
pkgdesc="Session manager for audio programs using the Non Session Manager (NSM) API"
arch=(any)
url='https://github.com/Houston4444/RaySession'
license=(GPL-2.0-only)
depends=(hicolor-icon-theme dbus-python python-jack-client python-pyalsa python-pyqt6 python-pyliblo
  python-pyxdg python-qtpy qt6-svg)
makedepends=(qt6-tools)
optdepends=(
  'python-gobject: additional JACK helper scripts'
  'python-pyjacklib: additional JACK helper scripts'
)
groups=(pro-audio)
source=("https://github.com/Houston4444/RaySession/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz"
        'raysession-makefile-destdir.patch')
sha256sums=('ab953150ddbde0bfd48c1df6647ce0bef6f279fe5b711ad1823974e85245a52f'
            'd551c1660bff9cbd1a45e6bdbfc5b81894cd118b78534340e5ec0bb274e527fa')

prepare() {
  cd $_name-$pkgver
  patch -p1 -N -r - -i "$srcdir"/raysession-makefile-destdir.patch
}

build() {
  cd $_name-$pkgver
  make -j 1 LRELEASE=/usr/lib/qt6/bin/lrelease RCC=/usr/lib/qt6/rcc
}

package() {
  cd $_name-$pkgver
  make -j 1 PREFIX=/usr DESTDIR="$pkgdir" install
  # client templates installed @ /etc/xdg/raysession & /usr/share/raysession
  # we need only one
  rm -vrf "$pkgdir"/usr/share/raysession/client_templates
  install -vDm644 CHANGELOG README.md TODO TRANSLATORS plans.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
