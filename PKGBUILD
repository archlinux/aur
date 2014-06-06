# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gconf-gtk2
pkgver=3.2.6
pkgrel=2
pkgdesc="A configuration database system compiled for GTK2"
arch=(i686 x86_64)
license=('LGPL')
provides=("gconf=$pkgver")
conflicts=('gconf')
replaces=('gconf')
depends=('libxml2' 'polkit' 'libldap' 'dbus-glib' 'gtk2')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
options=('!libtool' 'emptydirs')
install=gconf.install
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/GConf/3.2/GConf-$pkgver.tar.xz
        gconf-merge-schema
        gconfpkg
        gconf-reload.patch
        01_xml-gettext-domain.patch)
sha256sums=('1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c'
            'ee6b6e6f4975dad13a8c45f1c1f0547a99373bdecdcd6604bfc12965c328a028'
            'bf1928718caa5df2b9e54a13cfd0f15a8fe0e09e86b84385ce023616a114e898'
            '567b78d8b4b4bbcb77c5f134d57bc503c34867fcc6341c0b01716bcaa4a21694'
            'c883dec2b96978874a53700cfe7f26f24f8296767203e970bc6402b4b9945eb8')

prepare() {
  cd "GConf-$pkgver"

  # Patch from fedora - reloads gconf after installing schemas
  patch -Np1 -i "$srcdir/gconf-reload.patch"
  # http://bugzilla.gnome.org/show_bug.cgi?id=568845
  patch -Np1 -i "$srcdir/01_xml-gettext-domain.patch"

  # Python2 fix
  sed -i '1s|#!/usr/bin/env python$|&2|' gsettings/gsettings-schema-convert
}

build() {
  cd "GConf-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/GConf \
      --disable-static --enable-defaults-service --with-gtk=2.0 \
      --disable-orbit

  make pkglibdir=/usr/lib/GConf
}

package() {
  cd "GConf-$pkgver"
  make DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/etc/gconf/gconf.xml.system"
  install -m755 "$srcdir/gconf-merge-schema" "$pkgdir/usr/bin/"
  install -m755 "$srcdir/gconfpkg" "$pkgdir/usr/bin/gconfpkg"
}
