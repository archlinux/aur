# $Id$
# Upstream Maintainer:  Jan de Groot <jan@archlinux.org>
# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=gconf-nopolkit
pkgver=3.2.6
pkgrel=5
pkgdesc="A configuration database system without polkit dependency"
arch=(i686 x86_64)
license=('LGPL')
depends=('libxml2' 'libldap' 'dbus-glib')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
conflicts=('polkit')
install=gconf.install
url="http://www.gnome.org"
source=(https://download.gnome.org/sources/GConf/3.2/GConf-$pkgver.tar.xz
        gconf-merge-schema
        gconfpkg
        gconf-reload.patch
        gconf-{install,remove}.hook
        01_xml-gettext-domain.patch
	dbus-dontspew.patch
	gsettings-data-convert-fix-invalid-schema-path.patch)
sha256sums=('1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c'
            'ee6b6e6f4975dad13a8c45f1c1f0547a99373bdecdcd6604bfc12965c328a028'
            'bf1928718caa5df2b9e54a13cfd0f15a8fe0e09e86b84385ce023616a114e898'
            '567b78d8b4b4bbcb77c5f134d57bc503c34867fcc6341c0b01716bcaa4a21694'
            '2732b2a6b187c5620105a036bde12edee99669605f70cbde56fe5f39619c3dc0'
            '436a65ff290095bc3d35d7d6297cf4d647f61e9f9922cea7ef9f1e251b447ff7'
            'c883dec2b96978874a53700cfe7f26f24f8296767203e970bc6402b4b9945eb8'
	    'b490394b0f541ca92134478fa2235536bdb1ccd3b3200d5040dd458cec33bfe8'
            '0f2057fbd20837091cbcc1e291bb64c9c6066534891a4ee010bbf5b304bd831d')

prepare() {
  cd "GConf-$pkgver"

  # Patch from fedora - reloads gconf after installing schemas
  patch -Np1 -i "$srcdir/gconf-reload.patch"
  # http://bugzilla.gnome.org/show_bug.cgi?id=568845
  patch -Np1 -i "$srcdir/01_xml-gettext-domain.patch"

  # Upstream fixes
  patch -Np1 -i ../dbus-dontspew.patch
  patch -Np1 -i ../gsettings-data-convert-fix-invalid-schema-path.patch

  # Python2 fix
  sed -i '1s|#!/usr/bin/env python$|&2|' gsettings/gsettings-schema-convert
}

build() {
  cd "GConf-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/GConf \
      --disable-static \
      --disable-orbit

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make pkglibdir=/usr/lib/GConf
}

package() {
  cd "GConf-$pkgver"
  make DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/etc/gconf/gconf.xml.system"
  install -m755 "$srcdir/gconf-merge-schema" "$pkgdir/usr/bin/"
  install -m755 "$srcdir/gconfpkg" "$pkgdir/usr/bin/gconfpkg"
  
  install -dm755 "$pkgdir"/usr/share/libalpm/hooks/
  install -m644 "$srcdir"/gconf-{install,remove}.hook "$pkgdir"/usr/share/libalpm/hooks/
}
