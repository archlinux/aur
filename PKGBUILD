# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>
# Contributor: David Madl <xuphiexu@abanbytes.eu>


pkgname=gnucash-python
_realname=gnucash
pkgver=2.7.3
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application with enabled python bindings."
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('slib' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'aqbanking' 'webkit2gtk' 'libgnome-keyring' 'libgnomecanvas' 'boost-libs' 'python2')
makedepends=('intltool' 'boost' 'swig' 'gtest' 'gmock' 'gconf')
optdepends=('evince: for print preview'
	    'yelp: help browser'
            'perl-finance-quote: for stock information lookups'
            'perl-date-manip: for stock information lookups')
options=('!makeflags' '!emptydirs')
provides=('gnucash')
conflicts=('gnucash')
source=(
	https://github.com/Gnucash/${_realname}/releases/download/${pkgver}/${_realname}-${pkgver}.tar.bz2
	autogen.sh::https://raw.githubusercontent.com/Gnucash/gnucash/2.7.3/autogen.sh
	configure.ac.patch
)
backup=(
	'etc/gnucash/config'
	'etc/gnucash/environment'
) 
sha1sums=('d6d760092a30ffdab52f59f208e58017ec0dc7d6'
          '6e605b8ccdaca0b8a35969d4cfb9a6e85c263795'
          'da39a3ee5e6b4b0d3255bfef95601890afd80709')
sha256sums=('5ea0912a527874f8410e80f63d94d63608ead2ff4c3ae25a8b203c25d1ee4749'
            '637d74fe58c7e7e1140b243476abe5a6f76893d2fe41e444c4d6dabaef80dfba'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
sha512sums=('78c482eb3146406d561320866c480101cf35c51d8ab789e8d2688c7f7e16d1870b33feb7bcdb3cd8feaca300ce9bcf9fa05ba8e1804b221526d181763dcea611'
            '958bc0adf143b8b54378227d8fa74a9fe5e6b05df1b2d79f4253b3b252800749c193c5a8509bfd9a06da29486ed808f8c73baca77273bafa4137a088d0199ca9'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')

prepare() {
  # The autogen.sh and the patch are needed to ensure that we don't get a false positive on the boost libraries in the configure step later on.
  cp "${srcdir}/autogen.sh" "${srcdir}/${pkgname}-${pkgver}/autogen.sh" 
  chmod +x "${srcdir}/${pkgname}-${pkgver}/autogen.sh"
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../configure.ac.patch
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  export PYTHON=$(which python2)
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
    --libexecdir=/usr/lib --disable-schemas-compile --enable-ofx --enable-aqbanking \
    --disable-error-on-warning

  make -j $(cat /proc/cpuinfo | grep -ci '^processor')
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  cd libgnucash/doc/design
  make DESTDIR="${pkgdir}" install-info

  install -dm755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_realname}.schemas" --domain gnucash "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind

}
