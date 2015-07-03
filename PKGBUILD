# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Martin F. Schumann <mfs at mfs dot name>

pkgname=xfce-theme-manager
_pkgname=Xfce-Theme-Manager
pkgver=0.3.6
pkgrel=2
pkgdesc="A theme manager allowing easy configuration of themes, window borders, controls, icons and cursors for Xfce."
arch=('i686' 'x86_64')
url="http://keithhedger.hostingsiteforfree.com/pages/apps.html#themeed"
license=("GPL3")
depends=('gdk-pixbuf2' 'cairo' 'libxcursor' 'libxfce4ui')
optdepends=('xfce4-composite-editor: A simple GUI to tweak xfwm, can be launched from xfce-theme-manager')
makedepends=('pkg-config' 'make' 'autoconf')
source=("http://keithhedger.hostingsiteforfree.com/zips/xfcethememanager/$_pkgname-${pkgver}.tar.gz")
sha256sums=('fb9782c30bde3db988f98895ab5600d4d55b03dcc0fe4f2fd16216d4c95dfb11')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./autogen.sh --prefix="$pkgdir"/usr
}

package() {
  install -m 755 -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/applications "$pkgdir"/usr/share/doc/xfce-theme-manager
  sed -i 's#/PREFIX/share/Xfce\\-Theme\\-Manager/scripts#/usr/share/xfce\\-theme\\-manager/scripts#g' "$srcdir"/$_pkgname-$pkgver/$_pkgname/resources/man/*
  cd "$srcdir"/$_pkgname-$pkgver
  sed -i 's/Name=Xfce-Theme-Manager/Name=Xfce Theme Manager/g;s/^Comment.*/Comment=Control Xfce4 Themes, Icons, Cursors, Wallpapers and more/g' $_pkgname/resources/pixmaps/$_pkgname.desktop
  make CXXFLAGS="$CXXFLAGS -O3 -Wall `pkg-config --cflags --libs glib-2.0` `pkg-config --cflags --libs gdk-2.0` `pkg-config --cflags --libs gtk+-2.0` `pkg-config --cflags --libs xcursor` `pkg-config --cflags --libs gthread-2.0`" PREFIX="$pkgdir/usr" install
  install -m 644 README* "$pkgdir"/usr/share/doc/$pkgname/
  install -m 644 ChangeLog* "$pkgdir"/usr/share/doc/$pkgname/
  mv "$pkgdir"/usr/share/{$_pkgname,$pkgname}
  mv "$pkgdir"/usr/share/applications/{$_pkgname,$pkgname}.desktop
}
