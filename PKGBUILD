# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Haruue Icymoon <i@haruue.moe>

pkgname=erofs-utils-git
pkgver=1.5.r0.ga2821a6
pkgrel=1
pkgdesc='Userspace tools for EROFS'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git'
license=('GPL2')
depends=('lz4' 'util-linux-libs' 'xz')
makedepends=('git' 'fuse2')
optdepends=('fuse2: for erofsfuse')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=('git+https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "${srcdir}/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr --with-lz4-libdir=/usr/lib --with-liblzma-libdir=/usr/lib --enable-fuse --enable-lzma
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -vDm0644 {AUTHORS,ChangeLog,README} -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
