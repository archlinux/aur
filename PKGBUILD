# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis-git
pkgver=0.2.r774.g6ef95bc
pkgrel=1
pkgdesc='modern, legacy free, simple yet efficient vim-like editor - git checkout'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/vis/'
depends=('ncurses' 'libtermkey' 'lua' 'lua-lpeg' 'tre' 'file')
makedepends=('git')
checkdepends=('vim')
conflicts=('vis')
provides=('vis')
license=('custom:ISC')
backup=('etc/vis/visrc.lua')
source=('git://github.com/martanne/vis.git'
        'git://github.com/martanne/vis-test.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
	cd vis/

	git config --file=.gitmodules submodule.test.url ../vis-test/
	git update-index --assume-unchanged .gitmodules
	git submodule init
	git submodule update
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

	./configure \
		--prefix=/usr

	make
}

check() {
	cd vis/

	LANG='en_US.UTF-8' make -C test/
}

package() {
	cd vis/

	make DESTDIR="${pkgdir}" install

	install -D -m0644 lua/visrc.lua "${pkgdir}"/etc/vis/visrc.lua
}

