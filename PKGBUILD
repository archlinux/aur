# Maintainer: James An <james@jamesan.ca>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte-xfce
_pkgname=${pkgname%-xfce}
pkgver=3.11.91
pkgrel=1
pkgdesc="Menu editor for Xfce"
provides=("$_pkgname=$pkgver")
arch=(any)
license=('LGPL')
url="http://www.gnome.org"
depends=('gnome-menus' 'hicolor-icon-theme' 'python2-gobject' 'gtk3' 'exo')
makedepends=('intltool' 'libxslt' 'docbook-xsl')
conflicts=('alacarte' 'alacarte-git' 'alacarte-xfce-devel')
install=alacarte.install
options=('!libtool')
groups=('xfce4-goodies')
source=("http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz"
        unicode-fixes.patch
        $_pkgname.desktop)
md5sums=('03209a293a904cd3c47336ba0f3e8fc2'
         'c9b2d6bca7e6cfa92f5c8bf09f179926'
         'b927a3927560037c87dab73ef2d3d38b')

prepare() {
  cd "$_pkgname-$pkgver"

  patch -p1 -i ../unicode-fixes.patch
  sed -e 's/gnome-desktop-item-edit/exo-desktop-item-edit/g' -i Alacarte/MainWindow.py
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var PYTHON=/usr/bin/python2
  make
}

check() {
  cd "$_pkgname-$pkgver"

  make check
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  python2 -m compileall "$pkgdir"/usr/lib/python2.7/site-packages/Alacarte/
}
