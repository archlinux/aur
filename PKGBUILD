# Maintainer: Troy Will <com[dot]gmail[at]troydwill>
# Contributor: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=dvb-apps
pkgver=1.1.1
pkgrel=2
builddir=dvb-apps-3d43b280298c
pkgdesc='Linux DVB API applications and utilities'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.linuxtv.org/wiki/index.php/LinuxTV_dvb-apps'
license=('GPL')
conflicts=('linuxtv-dvb-apps')
depends=('glibc')
makedepends=('gcc')
source=('https://linuxtv.org/hg/dvb-apps/archive/tip.tar.gz'
	'https://gitweb.gentoo.org/repo/gentoo.git/plain/media-tv/linuxtv-dvb-apps/files/linuxtv-dvb-apps-1.1.1.20100223-perl526.patch'
	'https://git.busybox.net/buildroot/plain/package/dvb-apps/0003-handle-static-shared-only-build.patch'
	'https://git.busybox.net/buildroot/plain/package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch'
	'atsc_epg-64-bit-and-fault-tolerance.patch' )
sha256sums=('6ff30437bf514739e9981e1002a0853be10accf827511a7aa6a66f041d95f45a'
	    '4460c9c8f4474fcc776b8d02d1c527584a81dbc84b69db9ed9a8b43ca24d49c5'
	    'ea5915194b00b7275eaac6902f9a4aa07a61c17e14010b9ea453c0e53c57612a'
	    'f9793b4e490f43e1cefbb94f44db3d8799c5a6ca51168cb7e79a518e3efbb7ad'
	    '849e6ea61281ad5d678aa6c92107d33564b5e04aca7eb2c122475f70efe9ad00' )

prepare() {
	cd "$srcdir/$builddir"
	patch -p1 -i ${srcdir}/0003-handle-static-shared-only-build.patch
	patch -p1 -i ${srcdir}/0005-utils-fix-build-with-kernel-headers-4.14.patch
	patch -p1 -i ${srcdir}/linuxtv-dvb-apps-1.1.1.20100223-perl526.patch
	patch -p1 -i ${srcdir}/atsc_epg-64-bit-and-fault-tolerance.patch
}

build() {
	cd "$srcdir/$builddir"
	make
}

package() {
	cd "$srcdir/$builddir"
	make DESTDIR="${pkgdir}" install
	# Remove conflict with xbase (FS#37862) by renaming zap to zap-dvb
	mv -v ${pkgdir}/usr/bin/{zap,zap-dvb}
}
