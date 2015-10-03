# Maintainer: Simon Brulhart <simon@brulhart.me>

pkgname=ntfs-3g-compress-git
_pkgname=ntfs-3g
pkgver=2015.3.14.r4839.5981531
_pkgver=2015.3.14
pkgrel=1
pkgdesc='Fork of ntfs-3g with experimental Windows 10 System Compression support'
url='https://github.com/ebiggers/ntfs-3g/tree/system_compression'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('util-linux' 'fuse')
makedepends=('git')
source=('git+https://github.com/ebiggers/ntfs-3g.git#branch=system_compression')
md5sums=('SKIP')

conflicts=('ntfsprogs')
provides=('ntfsprogs')
replaces=('ntfsprogs')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	./autogen.sh
	sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
}

build() {
	cd "${_pkgname}"
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

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" rootbindir=/usr/bin rootsbindir=/usr/bin rootlibdir=/usr/lib install
	ln -s /usr/bin/ntfs-3g "${pkgdir}/usr/bin/mount.ntfs"
}

