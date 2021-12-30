# Maintainer: Paul Oppenheimer <bepvte at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Christian Hesse <mail at eworm.de>
# Contributor: figue <ffigue at gmail.com>
# Contributor: vinibali <vinibali1 at gmail.com>

pkgname=f2fs-tools-progress-patch-git
pkgver=1.13.0.r142.g27bf6c7
pkgrel=1
pkgdesc='Tools for Flash-Friendly File System (F2FS) with progress feedback'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/about/'
depends=('util-linux')
makedepends=('git')
license=('GPL')
provides=('f2fs-tools')
conflicts=('f2fs-tools')
validpgpkeys=('D3452A79D8C2B4EAC656F4224014A87E824850D2') # Jaegeuk Kim <jaegeuk@kernel.org>
source=("$pkgname::git+https://gitlab.lesviallon.fr/aviallon/f2fs-tools.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"

	# /usr/bin/sg_write_buffer is provided in sg3_utils
	sed -i '/sg_write_buffer/d' tools/Makefile.am

	autoreconf -fi
}

build() {
	cd "${pkgname}"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin
	make
}

package() {
	cd "${pkgname}"

	make DESTDIR="${pkgdir}/" sbindir=/usr/bin install
}
