# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis-standalone-git
pkgver=0.2.r622.gaff8ffe
pkgrel=1
_pkgver_libmusl=1.1.15
_pkgver_ncurses=6.0
_pkgver_libtermkey=0.19
_pkgver_lua=5.3.3
_pkgver_lpeg=1.0.0
pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked - git checkout'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/vis/'
makedepends=('git')
conflicts=('vis' 'vis-standalone')
provides=('vis')
license=('custom:ISC')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F'  # musl libc <musl@libc.org>
              'C52048C0C0748FEE227D47A2702353E0F7E48EDB') # Thomas Dickey <dickey@invisible-island.net>
source=('git://github.com/martanne/vis.git'
	"http://www.musl-libc.org/releases/musl-${_pkgver_libmusl}.tar.gz"{,.asc}
	"http://ftp.gnu.org/gnu/ncurses/ncurses-${_pkgver_ncurses}.tar.gz"{,.sig}
	"http://www.leonerd.org.uk/code/libtermkey/libtermkey-${_pkgver_libtermkey}.tar.gz"
	"http://www.lua.org/ftp/lua-${_pkgver_lua}.tar.gz"
	"http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-${_pkgver_lpeg}.tar.gz")
sha256sums=('SKIP'
            '97e447c7ee2a7f613186ec54a93054fe15469fe34d7d323080f7ef38f5ecb0fa'
            'SKIP'
            'f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260'
            'SKIP'
            'c505aa4cb48c8fa59c526265576b97a19e6ebe7b7da20f4ecaae898b727b48b7'
            '5113c06884f7de453ce57702abaac1d618307f33f6789fa870e87a59d772aca2'
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

	unset CFLAGS LDFLAGS

	make PREFIX='/usr/' standalone
}

package() {
	cd vis/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install
}

