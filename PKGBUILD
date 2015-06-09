# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Bächler <thomas.archlinux.org>

pkgname=ntfs-3g-ar
_pkgname=ntfs-3g_ntfsprogs
_stablever=2015.3.14
pkgver=2015.3.14AR.1
pkgrel=1
pkgdesc='NTFS filesystem driver and utilities with experimental features'
url='http://www.tuxera.com/community/ntfs-3g-advanced/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('util-linux' 'fuse')
source=("http://tuxera.com/opensource/${_pkgname}-${_stablever}.tgz"
        "http://pagesperso-orange.fr/jp-andre/${_pkgname}-${pkgver}.tgz")
sha1sums=('0ebd9adffd5a6ddcfbacade6be8efe1eba4b1a08'
          '5cb2a01f267e226b4413d6f13792d9928da9b59a')

conflicts=('ntfsprogs' 'ntfs-3g')
provides=('ntfsprogs' "ntfs-3g=$_stablever-$pkgrel")

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
	cd "${srcdir}/${_pkgname}-${_stablever}"
	sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
}

_configure() {
	./configure \
		--prefix=/usr \
		--sbin=/usr/bin \
		--mandir=/usr/share/man \
		--disable-ldconfig \
		--disable-static \
		--with-fuse=external \
		--enable-posix-acls \
		--enable-extras \
		"$@"
}

build() {
	cd ${_pkgname}-${_stablever}
	_configure
	make -C libntfs-3g libntfs-3g.la

	cd ../${_pkgname}-${pkgver}
	_configure --enable-xattr-mappings
	make
}

package_ntfs-3g-ar() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" rootbindir=/usr/bin rootsbindir=/usr/bin rootlibdir=/usr/lib install
	ln -s /usr/bin/ntfs-3g "${pkgdir}/usr/bin/mount.ntfs"

	cd "${srcdir}/${_pkgname}-${_stablever}"
	make -C libntfs-3g DESTDIR="${pkgdir}" rootlibdir=/usr/lib install-libLTLIBRARIES
}
