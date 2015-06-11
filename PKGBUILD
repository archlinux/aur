# Maintainer: Carsten Feuls <archlinux at carstenfeuls.de>
pkgname=soundmodem-server
_pkgname=soundmodem
pkgver=0.18
pkgrel=1
pkgdesc="Multiplatform Soundcard Packet Radio Modem without configuration GUI"
url="http://pv529.ncsrv.de/soundmodem/"
license=('GPL2')
provides="soundmodem"
conflicts="soundmodem"
source=("configure_ac.patch"
	"0001-Search-replace-of-extern-inline-static-inline.patch"
	"soundmodem.conf"
	"soundmodem_conf.d"
        "http://pv529.ncsrv.de/soundmodem/${_pkgname}-${pkgver}.tar.gz"
	"soundmodem.service")
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
backup=('etc/ax25/soundmodem.conf'
        'etc/conf.d/soundmodem')
depends=('audiofile' 'libxml2' 'alsa-lib')
sha256sums=('c97f91b5ac9ad0b218a3d2de3b843cc934d6112da9df4c1c9b72d4f04fd03520'
            '3a6e57ae1b89acbc25cb4758f2130e936f83fcec0aa1488f92f46c3d59e2d9b1'
            '36ed996571e2b39c75b27a5f765527bdcc737c4d30a681983c8415f4c742b825'
            '6719bc2d61dcf6edc4a8bcad4467a58696e0ce0f066badc39f6c0d47686cc2c3'
            'f033c1716df1378cda646dbb1c48ea9fb9a068772c6686f2ca411bfa64245c1c'
            '3be5b647f4798ff93df84a02097f97223f00508e6d2031cdbf0ee5f85397de81')

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}
        if [ -d configapp ]
        then
                rm -r configapp
        fi
        mv configure.in configure.ac
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" afsk/Makefile.am
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" directx/Makefile.am
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" flexdrv/Makefile.am
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" fsk/Makefile.am
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" newqpsk/Makefile.am
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" p3dmodem/Makefile.am
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" pammodem/Makefile.am
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" pskmodem/Makefile.am
        sed -i  "s/INCLUDES/AM_CPPFLAGS/g" soundcard/Makefile.am
        sed -i  "s/configapp\/src\/Makefile//g" configure
        sed -i  "s/configapp//g" Makefile.in
        sed -i  "s/configapp//g" Makefile.am
        sed -i  "s/configapp\/Makefile//g" configure.ac
	sed -i  "s/configapp\/src\/Makefile//g" configure.ac
        patch -p0 < ../../configure_ac.patch
        aclocal
	autoconf
	automake --add-missing
        autoreconf
	patch -p1 <$srcdir/0001-Search-replace-of-extern-inline-static-inline.patch
}


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}

  mkdir -p ${pkgdir}/etc/ax25
  mkdir -p ${pkgdir}/etc/conf.d
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  mkdir -p ${pkgdir}/usr/bin
  install -m 644 ${srcdir}/soundmodem.conf ${pkgdir}/etc/ax25/soundmodem.conf
  install -m 644 ${srcdir}/soundmodem_conf.d ${pkgdir}/etc/conf.d/soundmodem
  install -m 644 ${srcdir}/soundmodem.service ${pkgdir}/usr/lib/systemd/system/soundmodem.service
  mv ${pkgdir}/usr/sbin/soundmodem ${pkgdir}/usr/bin/soundmodem
  rmdir ${pkgdir}/usr/sbin
}
