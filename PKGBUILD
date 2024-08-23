# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Haruue Icymoon <i@haruue.moe>

pkgname=erofs-utils-git
pkgver=1.8.1.r0.gddbed14
pkgrel=1
pkgdesc='Userspace tools for EROFS'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git'
license=('GPL-2.0-or-later AND Apache-2.0')
depends=('glibc' 'libdeflate' 'lz4' 'zlib' 'util-linux' 'xz' 'zstd')
makedepends=('git' 'fuse2')
optdepends=('fuse2: for erofsfuse')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=('git+https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	autoreconf -fiv
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	./configure --prefix=/usr --enable-fuse --enable-lzma --with-libdeflate --enable-multithreading
	make
}

check() {
	cd "${srcdir}/${pkgname%-git}"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -vDm0644 {AUTHORS,ChangeLog,README} -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
