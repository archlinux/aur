# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=gnome-session-properties
pkgver=3.10.0
pkgrel=4
pkgdesc="The GNOME Session Properties Tool"
arch=('x86_64')
url="https://www.gnome.org"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'dbus-glib')
makedepends=('gnome-common' 'gtk-doc' 'intltool')
source=("https://download-fallback.gnome.org/sources/gnome-session/${pkgver%.*}/gnome-session-${pkgver}.tar.xz"
        'https://raw.githubusercontent.com/chenxiaolong/AUR-Files/b8632ea084b21e5fdef70a5ba7787c5567403146/gnome-session-properties/0001-Remove-unneeded-stuff.patch'
        'https://raw.githubusercontent.com/chenxiaolong/AUR-Files/b8632ea084b21e5fdef70a5ba7787c5567403146/gnome-session-properties/0002-Fix-GTK-3.14-incompatibilities.patch')
sha256sums=('38d90c5d5a33ec8a3002f1e77e201c1554eeb8bbba8923d94fab81b3a8e0696e'
            '8ded70b5567ffef768300af496f2d8b7544b2adae707ca7e5592e87670af8730'
            'a06118f85b26ef13d82f666f8a86cae1fb3e9ca12cd45703ef4dd9ecadfa3aab')

prepare() {
  cd "gnome-session-${pkgver}"
  patch -p1 -i ../0001-Remove-unneeded-stuff.patch
  patch -p1 -i ../0002-Fix-GTK-3.14-incompatibilities.patch

  # Fix icon
  sed -ri '/^Icon/ s/session-/gnome-session-/g' \
    "data/$pkgname.desktop.in.in"

  # Don't hide from application menu
  sed -i '/NoDisplay=true/d' "data/$pkgname.desktop.in.in"
}

build() {
  cd "gnome-session-${pkgver}"
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd "gnome-session-${pkgver}"
  make DESTDIR="${pkgdir}" install

  files=$(find "${pkgdir}" -name session-properties.png -o -name session-properties.svg)
  for f in ${files}; do
    mv "${f}" "${f/apps\/session-/apps\/gnome-session-}"
  done
}
