# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Radu Potop <radu at wooptoo dot com>

pkgname=adwaita-icon-theme-41
basename=adwaita-icon-theme
pkgver=41.0
pkgrel=4
pkgdesc="GNOME standard icons, version 41"
url="https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
arch=(any)
license=(LGPL3 CCPL:by-sa)
depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)
makedepends=(git gtk3 imagemagick)
provides=(adwaita-icon-theme)
_commit=8670d0eb2414c1ac16d927da5d1a22142ba5e346  # tags/41.0^0
source=("git+https://gitlab.gnome.org/GNOME/adwaita-icon-theme.git#commit=$_commit"
        "gtk-encode-symbolic-svg-rsvg")
sha256sums=('SKIP'
            'a75ef26bebc680fc5a8e16ae8117907d858ae979cb12dfc4bf3dcb5f121bcfb6')

pkgver() {
  cd $basename
  git describe --tags | sed 's/\.rc/rc/;s/-/+/g'
}

prepare() {
  cd $basename
  autoreconf -fvi
  chmod +x "$srcdir/gtk-encode-symbolic-svg-rsvg"
}

build() {
  cd $basename
  ./configure --prefix=/usr
  make
}

check() {
  cd $basename
  make check
}

# Call a shim script instead of gtk-encode-symbolic-svg
# which doesn't use glycin/bwrap.
package() {
  cd $basename
  make DESTDIR="$pkgdir" GTK_ENCODE_SYMBOLIC_SVG="$srcdir/gtk-encode-symbolic-svg-rsvg" install
  mv -v "${pkgdir}/usr/share/pkgconfig/adwaita-icon-theme.pc" "${pkgdir}/usr/share/pkgconfig/adwaita-icon-theme-41.pc"
  mv -v "${pkgdir}/usr/share/icons/Adwaita" "${pkgdir}/usr/share/icons/Adwaita41"
  sed -i 's/^Name=Adwaita$/Name=Adwaita41/' "${pkgdir}/usr/share/icons/Adwaita41/index.theme"
}
