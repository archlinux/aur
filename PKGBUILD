# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis-git
pkgver=0.2.r172.gd90f2af
pkgrel=1
pkgdesc='modern, legacy free, simple yet efficient vim-like editor - git checkout'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/vis/'
depends=('ncurses' 'libtermkey' 'lua')
makedepends=('git' 'markdown')
checkdepends=('vim')
optdepends=('lua-lpeg: for syntax highlighting')
conflicts=('vis')
provides=('vis')
license=('custom:ISC')
source=('git://github.com/martanne/vis.git'
	'git://github.com/martanne/vis-test.git')
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd vis/

	git config --file=.gitmodules submodule.git.url ../vis-test/
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

	markdown README.md > README.html
}

check() {
	cd vis/

	make -C test/
}

package() {
	cd vis/

	make DESTDIR="${pkgdir}" install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/vis/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/vis/README.html"
}

