# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcryptui
pkgver=3.12.2+r71+ged4f890e
pkgrel=2
epoch=1
pkgdesc="Library for OpenPGP prompts"
url="https://gitlab.gnome.org/GNOME/libcryptui"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gpgme dbus-glib libnotify gcr dconf libsm)
makedepends=(intltool gobject-introspection gnome-common git glib2-devel)
provides=(libcryptui.so)
_commit=ed4f890ee29b94c1bedd7030d5c857e3b9edb465  # master
source=("git+https://gitlab.gnome.org/GNOME/libcryptui.git#commit=$_commit"
         fix-configure-gpgme.patch
         gpgme-2.0.patch)
sha256sums=('684dda5ad8ac5932d4b6e38008787090d895a945101ceb41af4765151d1e73aa'
            'aea03ad74fbbfc2f9391c49664672a1c461afe22cfa92f2a86790eee534b58a3'
            '4e860ac4ff9891da272f017757552ece6b70fa77ae10d25bbffaaf6b8ae778e0')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  patch -p1 -i ../fix-configure-gpgme.patch # Fix recent gnupg/gpgme detection
  patch -p1 -i ../gpgme-2.0.patch # Fix build with gpgme 2.0
  autoreconf -fiv -I /usr/share/gettext/m4
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
