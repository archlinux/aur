# $Id: PKGBUILD 291809 2017-03-29 19:52:16Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Bächler <thomas.archlinux.org>

pkgname=ntfs-3g-wimlib-patched
_pkgname=ntfs-3g_ntfsprogs
pkgver=2017.3.23
pkgrel=1
provides=("ntfs-3g=${pkgver}")
conflicts=('ntfs-3g')
pkgdesc='NTFS filesystem driver and utilities - with patch from https://wimlib.net/forums/viewtopic.php?f=1&t=4&p=693#p596 applied'
url='https://www.tuxera.com/community/open-source-ntfs-3g/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('util-linux' 'fuse2')
source=("https://tuxera.com/opensource/${_pkgname}-${pkgver}.tgz" 'ntfs-3g_fix.patch')
sha256sums=('3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5'
            '64a9f00ca46f58649ae4e5a5965024876c0a933de08917a8026455fe66bfdb17')

conflicts=('ntfsprogs')
provides=('ntfsprogs')
replaces=('ntfsprogs')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
	patch -Np1 -i "${srcdir}/ntfs-3g_fix.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sbin=/usr/bin \
		--mandir=/usr/share/man \
		--disable-ldconfig \
		--disable-static \
		--with-fuse=external \
		--enable-posix-acls \
		--enable-extras \

	make
}

package_ntfs-3g-wimlib-patched() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" rootbindir=/usr/bin rootsbindir=/usr/bin rootlibdir=/usr/lib install
	ln -s /usr/bin/ntfs-3g "${pkgdir}/usr/bin/mount.ntfs"
}
