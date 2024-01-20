# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=gnome-session-properties
pkgver=3.10.1
pkgrel=1
pkgdesc="The GNOME Session Properties Tool"
arch=('x86_64')
url="https://www.gnome.org"
license=('GPL-2.0-or-later')
depends=('gtk3' 'hicolor-icon-theme' 'dbus-glib')
makedepends=('gnome-common' 'gtk-doc' 'intltool')
source=("https://download-fallback.gnome.org/sources/gnome-session/${pkgver%.*}/gnome-session-${pkgver}.tar.xz"
        # Patch too large to upload to aurweb
        'https://raw.githubusercontent.com/yochananmarqos/pkgbuilds/master/gnome-session-properties/0001-Remove-unneeded-stuff.patch'
        '0002-Fix-GTK-3.14-incompatibilities.patch')
sha256sums=('f620704e07e6bbf49aa6c65897475a46f80f7ac5593606f2b6889c7cb4f6a9cc'
            '4a064778dbbd235322bbbefd086ea7653679a0714230ebcac772eab373d83991'
            'a06118f85b26ef13d82f666f8a86cae1fb3e9ca12cd45703ef4dd9ecadfa3aab')

prepare() {
  cd "gnome-session-${pkgver}"
  patch -Np1 -i ../0001-Remove-unneeded-stuff.patch
  patch -Np1 -i ../0002-Fix-GTK-3.14-incompatibilities.patch

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
