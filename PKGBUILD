# Maintainer: Björn Wiedenmann <archlinux at xorxor dot de>
# Contributor: nl6720 <nl6720 at gmail dot com>
# Contributor: Andreas B. Wagner <AndreasBWagner at pointfree dot net>
# Contributor: Eric Belanger <eric at archlinux dot org>
# Contributor: Jeff Mickey <jeff at archlinux dot org>
pkgname=yodl-git
pkgver=4.02.00.r0.g2174c2f
pkgrel=1
pkgdesc='Implements a pre-document language and tools to process it - Git Checkout'
arch=( 'x86_64' 'i686' 'armv7h' )
url='https://fbb-git.github.io/yodl/'
license=( 'GPL3' )
makedepends=( 'icmake>=8.00.00' 'git' ) ## Add 'texlive-bin' for PDF manual generation
                                        ## (see ./build manual in build() below)
provides=( 'yodl' )
conflicts=( 'yodl' )
install="${pkgname}.install"
source=( "${pkgname}::git+https://github.com/fbb-git/yodl/" )
md5sums=( 'SKIP' )

pkgver() {
	cd "${srcdir}/${pkgname}/"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}/yodl/"
	./build programs
	./build macros
	## Ordering below violates the instructions in
	## INSTALL.txt but seems required for building
	./build man
	./build html
	## Below includes the html part above but requires
	## LaTeX for PDF generation (Package: texlive-bin)
	#./build manual
}

package() {
	cd "${srcdir}/${pkgname}/yodl/"
	./build install programs "${pkgdir}"
	./build install macros "${pkgdir}"
	./build install man "${pkgdir}"
	./build install manual "${pkgdir}"
	./build install docs "${pkgdir}"
}
