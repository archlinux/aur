# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash
pkgver=2.7.3
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'webkit2gtk' 'libgnome-keyring' 'libgnomecanvas' 'boost-libs')
makedepends=('intltool' 'boost' 'swig' 'gtest' 'gmock' 'gconf')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
backup=(
	'etc/gnucash/config'
	'etc/gnucash/environment'
) 
source=(
	https://github.com/Gnucash/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2
	autogen.sh::https://raw.githubusercontent.com/Gnucash/gnucash/2.7.3/autogen.sh
	configure.ac.patch
)
sha1sums=('d6d760092a30ffdab52f59f208e58017ec0dc7d6'
          '6e605b8ccdaca0b8a35969d4cfb9a6e85c263795'
          'd87dc553b5912f829e5b39c6e2a99bb323939c41')
sha256sums=('5ea0912a527874f8410e80f63d94d63608ead2ff4c3ae25a8b203c25d1ee4749'
            '637d74fe58c7e7e1140b243476abe5a6f76893d2fe41e444c4d6dabaef80dfba'
            '9aab33524405424ca6ebd51763bf1a07c20286643f6c77e3f8daa012f84d6c79')
sha512sums=('78c482eb3146406d561320866c480101cf35c51d8ab789e8d2688c7f7e16d1870b33feb7bcdb3cd8feaca300ce9bcf9fa05ba8e1804b221526d181763dcea611'
            '958bc0adf143b8b54378227d8fa74a9fe5e6b05df1b2d79f4253b3b252800749c193c5a8509bfd9a06da29486ed808f8c73baca77273bafa4137a088d0199ca9'
            '08a88cf55293709258a5b3d679f4ec096989c4b01b6c737f76b2de7605b1c71d6fd749ac93e0c9c97e036dfc170fd8255649dea7cbed3b6753ac4364a20ac247')

prepare() {
  # The autogen.sh and the patch are needed to ensure that we don't get a false positive on the boost libraries in the configure step later on.
  cp "${srcdir}/autogen.sh" "${srcdir}/${pkgname}-${pkgver}/autogen.sh" 
  chmod +x "${srcdir}/${pkgname}-${pkgver}/autogen.sh"
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../configure.ac.patch
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking \
    --disable-error-on-warning

  make -j $(cat /proc/cpuinfo | grep -ci '^processor')
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  cd libgnucash/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
