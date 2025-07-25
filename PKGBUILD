# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=pinfo-git
pkgver=0.6.13.r21.g4d635ab
pkgrel=1
epoch=2
pkgdesc="A hypertext info file viewer"
arch=('x86_64')
url="https://github.com/baszoetekouw/pinfo"
license=('GPL-2.0-only')
makedepends=('git' 'meson')
depends=('ncurses' 'readline')
conflicts=('pinfo')
source=("$pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
	unset LDFLAGS
	[ -x configure ] || ./autogen.sh
	sed -i 's|nogroup|nobody|' src/pinforc.in src/utils.c
	[ -f Makefile ] || ./configure --prefix=/usr --sysconfdir=/etc --enable-cursor --mandir=/usr/share/man --infodir=/usr/share/info
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
	rm -f "$pkgdir/usr/share/info/dir"
}
