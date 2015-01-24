# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte-xfce
_realname=${pkgname/-xfce/}
majorpkgver=3.10
pkgver=$majorpkgver.0
pkgrel=2
pkgdesc="Menu editor for Xfce"
provides=("alacarte=${pkgver}")
arch=(any)
license=('LGPL')
url="http://www.gnome.org"
depends=('gnome-menus' 'python2-gobject' 'exo' 'hicolor-icon-theme' 'pygtk')
makedepends=('intltool')
conflicts=('alacarte' 'alacarte-git' 'alacarte-xfce-devel')
install=alacarte.install
options=('!libtool')
groups=('xfce4-goodies')
source=(http://ftp.gnome.org/pub/gnome/sources/alacarte/$majorpkgver/alacarte-${pkgver}.tar.xz toprettyxml-and-unicode-fixes.patch alacarte.desktop)
md5sums=('817b0ebd9bf234d184088c6290f05acd'
         '8b427043af9d258da0daaa50fad9337d'
         'b927a3927560037c87dab73ef2d3d38b')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  patch -p1 -i $srcdir/toprettyxml-and-unicode-fixes.patch
  sed -e 's/gnome-desktop-item-edit/exo-desktop-item-edit/g' -i Alacarte/MainWindow.py
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D "${srcdir}/alacarte.desktop" "${pkgdir}/usr/share/applications/alacarte.desktop"
}
