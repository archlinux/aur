# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=vis-standalone-git
pkgname=(vis-standalone-git vis-single-git)
pkgver=0.2.r774.g6ef95bc
pkgrel=1
_pkgver_libmusl=1.1.16
_pkgver_ncurses=6.0
_pkgver_libtermkey=0.19
_pkgver_lua=5.3.4
_pkgver_lpeg=1.0.1
_pkgver_attr='c1a7b53073202c67becf4df36cadc32ef4759c8a'
_pkgver_acl='38f32ea1865bcc44185f4118fde469cb962cff68'
pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked - git checkout'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/vis/'
makedepends=('git' 'libtermkey')
checkdepends=('vim')
conflicts=('vis')
provides=('vis')
license=('custom:ISC')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F'  # musl libc <musl@libc.org>
              'C52048C0C0748FEE227D47A2702353E0F7E48EDB'  # Thomas Dickey <dickey@invisible-island.net>
              '600CD204FBCEA418BD2CA74F154343260542DF34') # Brandon Philips
source=('git://github.com/martanne/vis.git'
        'git://github.com/martanne/vis-test.git'
        "http://www.musl-libc.org/releases/musl-${_pkgver_libmusl}.tar.gz"{,.asc}
        "http://ftp.gnu.org/gnu/ncurses/ncurses-${_pkgver_ncurses}.tar.gz"{,.sig}
        "http://www.leonerd.org.uk/code/libtermkey/libtermkey-${_pkgver_libtermkey}.tar.gz"
        "http://www.lua.org/ftp/lua-${_pkgver_lua}.tar.gz"
        "http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-${_pkgver_lpeg}.tar.gz"
        "attr-${_pkgver_attr}.tar.gz::http://git.savannah.gnu.org/cgit/attr.git/snapshot/attr-${_pkgver_attr}.tar.gz"
        "acl-${_pkgver_acl}.tar.gz::http://git.savannah.gnu.org/cgit/acl.git/snapshot/acl-${_pkgver_acl}.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            '937185a5e5d721050306cf106507a006c3f1f86d86cd550024ea7be909071011'
            'SKIP'
            'f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260'
            'SKIP'
            'c505aa4cb48c8fa59c526265576b97a19e6ebe7b7da20f4ecaae898b727b48b7'
            'f681aa518233bc407e23acf0f5887c884f17436f000d453b2491a9f11a52400c'
            '62d9f7a9ea3c1f215c77e0cadd8534c6ad9af0fb711c3f89188a8891c72f026b'
            'faf6e5cbfa71153bd1049206ca70690c5dc96e2ec3db50eae107092c3de900ca'
            '98598b0bb154ab294d9a695fd08b0e06516e770bbd1d78937905f0dd8ebe485c')

prepare() {
	cd vis/

	git config --file=.gitmodules submodule.test.url ../vis-test/
	git update-index --assume-unchanged .gitmodules
	git submodule init
	git submodule update

	mkdir -p dependency/sources/

	for SOURCE in "${source[@]}"; do
		SOURCE="${SOURCE%::*}"
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

        # prepare test environment
        ./configure
        make -C test/core/
        make -C test/util/

	unset CFLAGS LDFLAGS

	make PREFIX='/usr/' single
}

check() {
	cd vis/

	LANG='en_US.UTF-8' make -C test/
}

package_vis-standalone-git() {
	pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked - git checkout'
	backup=('etc/vis/visrc.lua')

	cd vis/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 lua/visrc.lua "${pkgdir}"/etc/vis/visrc.lua
}

package_vis-single-git() {
	pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked, self-extracting - git checkout'

	cd vis/

	install -D -m0755 vis-single "${pkgdir}/usr/bin/vis"
}

