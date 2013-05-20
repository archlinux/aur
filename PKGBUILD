# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=revelation
pkgver=0.4.14
pkgrel=2
pkgdesc="A password manager for the GNOME desktop"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-python>=2.10' 'pycrypto>=1.9' 'python2-crack' 'desktop-file-utils' 'python2' 'hicolor-icon-theme' 'pkg-config' 'dbus-python')
makedepends=('intltool')
install=revelation.install
url="http://revelation.olasagasti.info/"
source=("https://bitbucket.org/erikg/revelation/downloads/revelation-${pkgver}.tar.bz2"
        'cracklib.patch')
md5sums=('d1c054b0a5678f884a2365ac54c03b6a'
         '3502734fb170dd6392b82d36fdf45169')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -uNp1 -i "${srcdir}/cracklib.patch"

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
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  sed -i "s|#!/usr/bin/\(env \)\?python$|#!/usr/bin/\1python2|" \
    $pkgdir/usr/bin/revelation \
    $pkgdir/usr/lib/python2.7/site-packages/revelation/bundle/PBKDFv2.py


  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain revelation ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
