# Maintainer: Swyter <swyterzone+aur@gmail.com>

pkgname=xbfuse-git
pkgver=r4.99db830
pkgrel=1
pkgdesc="Mount Xbox and Xbox 360 disk images via FUSE"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://multimedia.cx/xbfuse/"
license=('GPL')
depends=('fuse')
makedepends=('git' 'sed')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/multimediamike/xbfuse')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver()
{
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build()
{
	cd "$srcdir/${pkgname%-git}"

    # fix the autoconf script to stop checking for an specific FUSE version...
	sed -i '/fuse\/fuse.h/d' ./configure.ac
	sed -i 's/.*FUSE_USE_VERSION.*/\[/g' ./configure.ac
	sed -i 's/.*#include <fuse.h>.*/\]/g' ./configure.ac

    # add mandatory flags requested by FUSE, what a pain :(
    export CPPFLAGS=-D_FILE_OFFSET_BITS=64

	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
