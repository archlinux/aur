# $Id: PKGBUILD 299071 2017-06-20 16:53:25Z juergen $
# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>
# Contributor: David Madl <xuphiexu@abanbytes.eu>


pkgname=gnucash-python
_realname=gnucash
pkgver=2.6.19
pkgrel=2
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
sha1sums=('d2ae5c7855fac30d88fe889d47a441e8a887b19c'
          '6e605b8ccdaca0b8a35969d4cfb9a6e85c263795'
          'da39a3ee5e6b4b0d3255bfef95601890afd80709')
sha256sums=('50b89367246ec2d51e9765bd6bd8c669e35ceb4ac5ab92636f76758a9f3f7fd1'
            '637d74fe58c7e7e1140b243476abe5a6f76893d2fe41e444c4d6dabaef80dfba'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
sha512sums=('0a979caf48ba96d6f37a929036e7172855cfb03af8832f479966bce72fad3400903925134d33aaa31eb6b36a2041f5e0d3f74b88e95b83c7d76e96b1503bec13'
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
