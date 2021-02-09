# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Bächler <thomas.archlinux.org>

pkgname=ntfs-3g-ar
_pkgname=ntfs-3g_ntfsprogs
pkgver=2017.3.23AR.6
pkgrel=5
pkgdesc='NTFS filesystem driver and utilities with experimental features'
url='https://jp-andre.pagesperso-orange.fr/advanced-ntfs-3g.html'
arch=('x86_64')
license=('GPL2')
depends=('util-linux' 'fuse2')
source=("https://tuxera.com/opensource/${_pkgname}-${pkgver%AR*}.tgz"
        "https://jp-andre.pagesperso-orange.fr/${_pkgname}-${pkgver}.tgz"
        'mftmirr.patch')
sha256sums=('3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5'
            'e60556afbe7bc2f5ad710baf0ee954682324d411c324d328c652e731c6b7abd3'
            '4166ff3021921d7a7ffac8f5de64b5735b1d5e365a024744bebc7260cf1ce726')

conflicts=('ntfsprogs' 'ntfs-3g')
provides=('ntfsprogs' "ntfs-3g=${pkgver%AR*}-$pkgrel")

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
	cd "../${_pkgname}-${pkgver%AR*}"
	sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
	patch -p1 -i ../mftmirr.patch
}

_build() {
	cd "${srcdir}/${_pkgname}-${1}"
	./configure \
		--prefix=/usr \
		--sbin=/usr/bin \
		--mandir=/usr/share/man \
		--disable-ldconfig \
		--disable-static \
		--with-fuse=external \
		--enable-xattr-mappings \
		--enable-posix-acls \
		--enable-extras \
		--enable-crypto \

	make "${@:2}"
}

build() {
	_build ${pkgver%AR*} -C libntfs-3g libntfs-3g.la
	_build ${pkgver}
}

package_ntfs-3g-ar() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" rootbindir=/usr/bin rootsbindir=/usr/bin rootlibdir=/usr/lib install
	rm "${pkgdir}"/usr/share/man/man8/ntfsfallocate.8 # uninstalled binary
	ln -s /usr/bin/ntfs-3g "${pkgdir}/usr/bin/mount.ntfs"

	cd ../${_pkgname}-${pkgver%AR*}
	make -C libntfs-3g DESTDIR="${pkgdir}" rootlibdir=/usr/lib install-libLTLIBRARIES
}
