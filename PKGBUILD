# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-hide-legacy-decorations
_pkgname=mutter
pkgver=3.20.2
pkgrel=1
pkgdesc="A window manager for GNOME (with a little hack to hide the window decorations on maximized legacy applications)"
url="https://git.gnome.org/browse/mutter"
arch=(i686 x86_64)
license=(GPL)
depends=(clutter dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev)
makedepends=(intltool gobject-introspection)
replaces=('mutter-wayland' 'mutter')
provides=('mutter')
groups=(gnome)
options=(!emptydirs)
source=("https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz"
        "hideTitlebar.patch")
sha256sums=('1e8c46a81e21f382f56729282fcd0bb1c3a2067135f4b0f3651b307bf7a5b454'
            'ec1a0f5f98213c340e907761e72fc3e22cb9c8ff503c6c234a4a41aac4ec7ac4')

build() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i $srcdir/hideTitlebar.patch
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/$_pkgname --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
