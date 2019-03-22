# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Bächler <thomas.archlinux.org>

pkgname=ntfs-3g-ar
_pkgname=ntfs-3g_ntfsprogs
_stablever=2017.3.23
pkgver=${_stablever}AR.4
pkgrel=1
pkgdesc='NTFS filesystem driver and utilities with experimental features'
url='http://jp-andre.pagesperso-orange.fr/advanced-ntfs-3g.html'
arch=('x86_64')
license=('GPL2')
depends=('util-linux' 'fuse2')
source=("https://tuxera.com/opensource/${_pkgname}-${_stablever}.tgz"
        "http://pagesperso-orange.fr/jp-andre/${_pkgname}-${pkgver}.tgz"
        'mftmirr.patch')
sha256sums=('3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5'
            '46e1edb27362d2f24cbc04db7d81ae2241d8ff6a45bb72240a316b1635caca0b'
            '4166ff3021921d7a7ffac8f5de64b5735b1d5e365a024744bebc7260cf1ce726')

conflicts=('ntfsprogs' 'ntfs-3g')
provides=('ntfsprogs' "ntfs-3g=$_stablever-$pkgrel")

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
	cd "../${_pkgname}-${_stablever}"
	sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
	patch -p1 -i ../mftmirr.patch
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

	cd ../${_pkgname}-${_stablever}
	make -C libntfs-3g DESTDIR="${pkgdir}" rootlibdir=/usr/lib install-libLTLIBRARIES
}
