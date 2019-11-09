# Contributor: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=linuxtv-dvb-apps
pkgver=1505
pkgrel=2
_hgrev=3d43b280298c
pkgdesc='Linux DVB API applications and utilities'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.linuxtv.org'
license=('GPL')
depends=('glibc')
makedepends=('mercurial')
optdepends=('dtv-scan-tables-git: initial tuning data necessary for scanning utils')
source=("hg+https://linuxtv.org/hg/dvb-apps/#revision=${_hgrev}"
        'https://gitweb.gentoo.org/repo/gentoo.git/plain/media-tv/linuxtv-dvb-apps/files/linuxtv-dvb-apps-1.1.1.20100223-perl526.patch'
        'https://git.busybox.net/buildroot/plain/package/dvb-apps/0003-handle-static-shared-only-build.patch'
        'https://git.busybox.net/buildroot/plain/package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch')
sha256sums=('SKIP'
            '4460c9c8f4474fcc776b8d02d1c527584a81dbc84b69db9ed9a8b43ca24d49c5'
            'ea5915194b00b7275eaac6902f9a4aa07a61c17e14010b9ea453c0e53c57612a'
            'f9793b4e490f43e1cefbb94f44db3d8799c5a6ca51168cb7e79a518e3efbb7ad')

prepare() {
	cd ${srcdir}/dvb-apps
	patch -p1 -i ${srcdir}/0003-handle-static-shared-only-build.patch
	patch -p1 -i ${srcdir}/0005-utils-fix-build-with-kernel-headers-4.14.patch
	patch -p1 -i ${srcdir}/linuxtv-dvb-apps-1.1.1.20100223-perl526.patch
}

pkgver() {
	cd ${srcdir}/dvb-apps
	echo $(hg identify -n | sed 's/+//')
}

build() {
	cd ${srcdir}/dvb-apps
	make
}

package() {
	cd ${srcdir}/dvb-apps
	make DESTDIR="${pkgdir}" install
	# Remove conflict with xbase (FS#37862)
	mv ${pkgdir}/usr/bin/{zap,dvbzap}
}
