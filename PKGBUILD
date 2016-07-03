# Maintainer: Simon Brulhart <simon@brulhart.me>
# Based on the PKGBUILD of the ntfs-3g package

pkgname=ntfs-3g-compress-git
_pkgname=ntfs-3g
pkgver=2016.2.22.r4907.321c9da
pkgrel=2
pkgdesc='DEPRECATED: Use ntfs-3g-system-compression-git instead.'
url='https://github.com/ebiggers/ntfs-3g/tree/system_compression'
arch=('i686' 'x86_64')
install=deprecated.install
license=('GPL2')
depends=('util-linux' 'fuse')
makedepends=('git')
source=('git+https://github.com/ebiggers/ntfs-3g.git#branch=system_compression')
md5sums=('SKIP')

conflicts=('ntfsprogs' 'ntfs-3g')
provides=('ntfsprogs' 'ntfs-3g')
replaces=('ntfsprogs' 'ntfs-3g')

pkgver() {
	cd "${_pkgname}"
	local release="$(autoconf -t AC_INIT | sed -rn 's/.*AC_INIT:ntfs-3g:([^:]+):.*/\1/p')"
	printf "%s.r%s.%s" "${release}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

