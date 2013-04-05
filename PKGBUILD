# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gconf-gtk2
pkgver=3.2.5
pkgrel=5
pkgdesc="A configuration database system compiled for GTK2"
arch=(i686 x86_64)
license=('LGPL')
provides=("gconf=$pkgver")
conflicts=('gconf')
replaces=('gconf')
depends=('polkit' 'dbus-glib' 'gtk2')
optdepends=('python2: for gsettings-schema-convert utility')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
options=('!libtool' 'emptydirs')
install=gconf.install
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/GConf/3.2/GConf-$pkgver.tar.xz
        gconf-dbus-fix-use-after-free.patch
        gconf-dbus-fix-shutdown.patch
        gsettings-schema-convert-dont-fail.patch
        gconf-merge-schema
        gconfpkg
        gconf-reload.patch
        01_xml-gettext-domain.patch)
sha256sums=('4ddea9503a212ee126c5b46a0a958fd5484574c3cb6ef2baf38db02e819e58c6'
            '76c078218e7c3e93691ddd4d7fd9f5c83d4862d0a0406d17b805f3106b50375d'
            'ddf55a40a260dd00364b32b3200bd8a76e890070ea6267fbfb322907c0946ab2'
            'be6f084a31229e8edfd6936005c6bb4f2d1548b777df5937923b4702f7a9ac19'
            'ee6b6e6f4975dad13a8c45f1c1f0547a99373bdecdcd6604bfc12965c328a028'
            'bf1928718caa5df2b9e54a13cfd0f15a8fe0e09e86b84385ce023616a114e898'
            '567b78d8b4b4bbcb77c5f134d57bc503c34867fcc6341c0b01716bcaa4a21694'
            'c883dec2b96978874a53700cfe7f26f24f8296767203e970bc6402b4b9945eb8')

build() {
  cd "GConf-$pkgver"
  # Upstream fixes from git
  patch -Np1 -i "$srcdir/gconf-dbus-fix-shutdown.patch"
  patch -Np1 -i "$srcdir/gsettings-schema-convert-dont-fail.patch"
  patch -Np1 -i "$srcdir/gconf-dbus-fix-use-after-free.patch"

  # Patch from fedora - reloads gconf after installing schemas
  patch -Np1 -i "$srcdir/gconf-reload.patch"
  # http://bugzilla.gnome.org/show_bug.cgi?id=568845
  patch -Np1 -i "$srcdir/01_xml-gettext-domain.patch"

  # Python2 fix
  sed -i '1s|#!/usr/bin/env python$|&2|' gsettings/gsettings-schema-convert

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
  install -Dm755 "$srcdir/gconfpkg" "$pkgdir/usr/sbin/gconfpkg"
}
