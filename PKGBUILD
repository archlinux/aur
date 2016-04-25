# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis-standalone-git
pkgver=0.2.r183.geb176b4
pkgrel=1
_pkgver_libmusl=1.1.14
_pkgver_ncurses=6.0
_pkgver_libtermkey=0.18
_pkgver_lua=5.2.4
_pkgver_lpeg=1.0.0
pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked - git checkout'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/vis/'
makedepends=('git' 'markdown')
conflicts=('vis' 'vis-standalone')
provides=('vis')
license=('custom:ISC')
source=('git://github.com/martanne/vis.git'
	"http://www.musl-libc.org/releases/musl-${_pkgver_libmusl}.tar.gz"
	"http://ftp.gnu.org/gnu/ncurses/ncurses-${_pkgver_ncurses}.tar.gz"
	"http://www.leonerd.org.uk/code/libtermkey/libtermkey-${_pkgver_libtermkey}.tar.gz"
	"http://www.lua.org/ftp/lua-${_pkgver_lua}.tar.gz"
	"http://www.brain-dump.org/projects/vis/lua-${_pkgver_lua}-lpeg.patch1"
	"http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-${_pkgver_lpeg}.tar.gz")
sha256sums=('SKIP'
            '35f6c00c84a6091bd5dab29eedde7508dae755ead92dcc0239f3677d1055b9b5'
            'f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260'
            '239746de41c845af52bb3c14055558f743292dd6c24ac26c2d6567a5a6093926'
            'b9e2e4aad6789b3b63a056d442f7b39f0ecfca3ae0f1fc0ae4e9614401b69f4b'
            '1142e1b75d528de87e08c6580309c93d63150dc74a43c05afdf6644e426b10b9'
	    '10190ae758a22a16415429a9eb70344cf29cbda738a6962a9f94a732340abf8e')

prepare() {
	cd vis/

	mkdir -p dependency/sources/

	for SOURCE in "${source[@]}"; do
		SOURCE="$(basename ${SOURCE})"
		ln -s ../../../${SOURCE} dependency/sources/${SOURCE}
	done
}

pkgver() {
	cd vis/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

build() {
	cd vis/

	make PREFIX='/usr/' standalone

	markdown README.md > README.html
}

package() {
	cd vis/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/vis/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/vis/README.html"
}

