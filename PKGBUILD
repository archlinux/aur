# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis-standalone
pkgver=0.2
pkgrel=2
_pkgver_libmusl=1.1.14
_pkgver_ncurses=6.0
_pkgver_libtermkey=0.18
_pkgver_lua=5.2.4
_pkgver_lpeg=1.0.0
pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/vis/'
makedepends=('markdown')
conflicts=('vis')
provides=('vis')
license=('custom:ISC')
source=("http://www.brain-dump.org/projects/vis/vis-${pkgver}.tar.gz"
	"http://www.musl-libc.org/releases/musl-${_pkgver_libmusl}.tar.gz"
	"http://ftp.gnu.org/gnu/ncurses/ncurses-${_pkgver_ncurses}.tar.gz"
	"http://www.leonerd.org.uk/code/libtermkey/libtermkey-${_pkgver_libtermkey}.tar.gz"
	"http://www.lua.org/ftp/lua-${_pkgver_lua}.tar.gz"
	"http://www.brain-dump.org/projects/vis/lua-${_pkgver_lua}-lpeg.patch"
	"http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-${_pkgver_lpeg}.tar.gz")
sha256sums=('3e5b81d760849c56ee378421e9ba0f653c641bf78e7594f71d85357be99a752d'
            '35f6c00c84a6091bd5dab29eedde7508dae755ead92dcc0239f3677d1055b9b5'
            'f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260'
            '239746de41c845af52bb3c14055558f743292dd6c24ac26c2d6567a5a6093926'
            'b9e2e4aad6789b3b63a056d442f7b39f0ecfca3ae0f1fc0ae4e9614401b69f4b'
            'a308a948696f21a0928505322c78ec48fffb88760ab795da2e390109e004b0cd'
	    '10190ae758a22a16415429a9eb70344cf29cbda738a6962a9f94a732340abf8e')

prepare() {
	cd vis-${pkgver}/

	# fix install path
	sed -i '/^SHAREPREFIX/c SHAREPREFIX ?= ${PREFIX}/share' Makefile

	mkdir -p dependency/sources/

	for SOURCE in "${source[@]}"; do
		SOURCE="$(basename ${SOURCE})"
		ln -s ../../../${SOURCE} dependency/sources/${SOURCE}
	done
}

build() {
	cd vis-${pkgver}/

	make PREFIX='/usr/' standalone

	markdown README.md > README.html
}

package() {
	cd vis-${pkgver}/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/vis/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/vis/README.html"
}

