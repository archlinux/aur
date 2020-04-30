# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Martin F. Schumann <mfs at mfs dot name>

pkgname=xfce-theme-manager
_pkgname=Xfce-Theme-Manager
pkgver=0.3.8
pkgrel=1
pkgdesc="A theme manager allowing easy configuration of themes, window borders, controls, icons and cursors for Xfce."
arch=(i686 x86_64)
url="https://github.com/KeithDHedger/Xfce-Theme-Manager"
license=(GPL3)
depends=(gdk-pixbuf2 cairo libxcursor libxfce4ui)
optdepends=('xfce4-composite-editor: A simple GUI to tweak xfwm, can be launched from xfce-theme-manager')
makedepends=(pkg-config)
source=("https://github.com/KeithDHedger/$_pkgname/archive/$pkgname-${pkgver}.tar.gz")
sha256sums=('110eea06a36096c0fc8bf2dd9fe03c90e066f42aebd91f71f1159e87dff99b6f')

build() {
  cd "$srcdir"/$_pkgname-$pkgname-$pkgver
  ./autogen.sh --prefix="$pkgdir"/usr
  sed -i \
    's#/PREFIX/share/Xfce\\-Theme\\-Manager/scripts#/usr/share/xfce\\-theme\\-manager/scripts#g' \
    "$srcdir"/$_pkgname-$pkgname-$pkgver/$_pkgname/resources/man/*
  sed -i \
    's/Name=Xfce-Theme-Manager/Name=Xfce Theme Manager/g;s/^Comment.*/Comment=Control Xfce4 Themes, Icons, Cursors, Wallpapers and more/g' \
    $_pkgname/resources/pixmaps/$_pkgname.desktop
}

package() {
  install -m 755 -d "$pkgdir"/usr/bin \
    "$pkgdir"/usr/share/applications \
    "$pkgdir"/usr/share/doc/xfce-theme-manager

  cd "$srcdir"/$_pkgname-$pkgname-$pkgver
  make CXXFLAGS="$CXXFLAGS -O3 -Wall `pkg-config --cflags --libs glib-2.0` `pkg-config --cflags --libs gdk-2.0` `pkg-config --cflags --libs gtk+-2.0` `pkg-config --cflags --libs xcursor` `pkg-config --cflags --libs gthread-2.0`" PREFIX="$pkgdir/usr" install

  install -m 644 README* "$pkgdir"/usr/share/doc/$pkgname/
  install -m 644 ChangeLog* "$pkgdir"/usr/share/doc/$pkgname/
  mv "$pkgdir"/usr/share/{$_pkgname,$pkgname}
  mv "$pkgdir"/usr/share/applications/{$_pkgname,$pkgname}.desktop
}
