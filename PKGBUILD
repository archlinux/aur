# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=revelation
pkgver=0.4.14
pkgrel=6
pkgdesc="A password manager for the GNOME desktop"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-python>=2.10' 'pycrypto>=1.9' 'python2-crack' 'desktop-file-utils' 'python2' 'hicolor-icon-theme' 'pkg-config' 'python2-dbus')
makedepends=('intltool')
install=revelation.install
url="http://revelation.olasagasti.info/"
source=("https://bitbucket.org/erikg/revelation/downloads/revelation-${pkgver}.tar.bz2"
        'cracklib.patch'
        'gnome-python.patch')
sha256sums=('2ab3d1d8bcc2f441feb58122ee6a0fe4070412228194843a180a7b1c9e910019'
            'f5cebe215115cb5a78f470da9753be3c5ff99095f28ab57ae45d2d03b3a686d6'
            'b2803f3f0ab344453fc4f82c90c8eefe99e1b23f77de09bf598741c73458a044')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -uNp1 -i "${srcdir}/cracklib.patch"
  patch -uNp1 -i "${srcdir}/gnome-python.patch"

  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/revelation \
      --localstatedir=/var \
      --disable-mime-update --disable-desktop-update \
      --with-python-include=/usr/include/python2.7
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  sed -i "s|#!/usr/bin/\(env \)\?python$|#!/usr/bin/\1python2|" \
    $pkgdir/usr/bin/revelation \
    $pkgdir/usr/lib/python2.7/site-packages/revelation/bundle/PBKDFv2.py

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain revelation ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
