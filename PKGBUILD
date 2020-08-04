# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: SJ_UnderWater
# Based on netatalk package:
# Maintainer: Dominik Dingel <mail at wodar dot de>
# Contributor: William Udovich <nerdzrule7 at earthlink dot net>
# Contributor: Farhan Yousaf <farhany at xaviya dot com>

pkgname=netatalk-ddp
pkgver=2.2.6
pkgrel=5
pkgdesc='A kernel-level implementation of AppleTalk, AFP, and PAP services'
arch=('i686' 'x86_64')
url='http://netatalk.sourceforge.net'
license=('GPL')
depends=('openslp' 'libcups' 'libgcrypt15' 'libtirpc' 'libwrap' 'rpcsvc-proto')
optdepends=('cups: required for PAP support')
replaces=('netatalk-git' 'netatalk2')
conflicts=('netatalk')
backup=('etc/netatalk/afpd.conf'
	'etc/netatalk/afp_ldap.conf'
	'etc/netatalk/netatalk.conf'
	'etc/netatalk/AppleVolumes.default'
	'etc/netatalk/AppleVolumes.system'
	'etc/netatalk/atalkd.conf'
	'etc/netatalk/papd.conf'
	'etc/pam.d/netatalk')
options=('!libtool')
source=(https://svwh.dl.sourceforge.net/project/netatalk/netatalk/$pkgver/netatalk-$pkgver.tar.bz2 netatalk-invalid_dircache_entries.patch netatalk-current_vol.patch netatalk-uams_dhx_passwd.patch netatalk-uams_dhx_pam.patch netatalk-uams_randnum.patch netatalk-papd_print_cups.patch a2boot.service atalk.service netatalk-cnid.service netatalk.service pap.service timelord.service)
md5sums=('cd8ca5be7ebb0ac42d5576f401a8a8ba'
         'e56ca98c7399916d73cd6de1beb4a567'
         '3a9237d97a109e1d7923c93e6c91c182'
         'be2aae358f7e119cac04d0647b313dde'
         'ced20afc4ac36220efbb452fc8d56881'
         'e57f9714b04c9b52f40260ed62dce82d'
         '6d8c7d17632dcb6d062987dba43089f0'
         'fb2a3edcde5924932d1e40d77ea10087'
         'f7deb64d6d5ea9c8e1245662206771f0'
         '0063d66bf9649d585f3a5c6915d840ce'
         'd4bdcf02712beae9bce2b147b1861920'
         '2dc6baaaf73a5c7ada9dea018dae1ac9'
         '03de1519d7bebedd09748a215537e0cb')

build() {
	cd netatalk-$pkgver
	msg2 'Fixing...'
        patch --forward --strip=1 --input="${srcdir}/netatalk-invalid_dircache_entries.patch"
        patch --forward --strip=1 --input="${srcdir}/netatalk-current_vol.patch"
        patch --forward --strip=0 --input="${srcdir}/netatalk-uams_randnum.patch"
        patch --forward --strip=0 --input="${srcdir}/netatalk-uams_dhx_passwd.patch"
        patch --forward --strip=0 --input="${srcdir}/netatalk-uams_dhx_pam.patch"
        patch --forward --strip=0 --input="${srcdir}/netatalk-papd_print_cups.patch"
        sed -i 's/#include <unistd.h>/#include <stdlib.h>\n#include <unistd.h>/' contrib/a2boot/a2boot.c
	sed -i 's:/lib:/usr/lib:' distrib/initscripts/Makefile.{am,in}
	msg2 'Configuring...'
        CFLAGS="-O -I/usr/include/tirpc" CPPFLAGS="-DNEED_RQUOTA" LIBS="-ltirpc" ./configure --prefix=/usr  --sbindir=/usr/bin --localstatedir=/var --libexecdir='${libdir}' --disable-static --enable-shared --with-cracklib --with-cnid-cdb-backend --enable-systemd --enable-fhs --enable-ddp --enable-srvloc --enable-timelord --enable-cups --enable-a2boot --enable-tcp-wrappers
	msg2 'Making...'
	make
}
package() {
	cd netatalk-$pkgver
	msg2 'Building...'
	make DESTDIR="$pkgdir" install
	msg2 'Moving Files...'
	cp "${srcdir}"/*.service "$pkgdir"/usr/lib/systemd/system/
        rm "$pkgdir"/usr/include/netatalk/at.h
}
