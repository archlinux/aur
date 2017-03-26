# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=vis-standalone
pkgname=(vis-standalone vis-single)
pkgver=0.3
pkgrel=1
_pkgname_test=vis-test
_pkgver_test=0.1
_pkgver_libmusl=1.1.16
_pkgver_ncurses=6.0
_pkgver_libtermkey=0.19
_pkgver_lua=5.3.4
_pkgver_lpeg=1.0.1
_pkgver_attr='c1a7b53073202c67becf4df36cadc32ef4759c8a'
_pkgver_acl='38f32ea1865bcc44185f4118fde469cb962cff68'
pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/vis/'
conflicts=('vis')
provides=('vis')
license=('custom:ISC')
validpgpkeys=('836489290BB6B70F99FFDA0556BCDB593020450F'  # musl libc <musl@libc.org>
              'C52048C0C0748FEE227D47A2702353E0F7E48EDB'  # Thomas Dickey <dickey@invisible-island.net>
              '600CD204FBCEA418BD2CA74F154343260542DF34') # Brandon Philips
source=("vis-${pkgver}.tar.gz::https://github.com/martanne/vis/archive/v${pkgver}.tar.gz"
        "${_pkgname_test}-${_pkgver_test}.tar.gz::https://github.com/martanne/${_pkgname_test}/archive/v${_pkgver_test}.tar.gz"
        "http://www.musl-libc.org/releases/musl-${_pkgver_libmusl}.tar.gz"{,.asc}
        "http://ftp.gnu.org/gnu/ncurses/ncurses-${_pkgver_ncurses}.tar.gz"{,.sig}
        "http://www.leonerd.org.uk/code/libtermkey/libtermkey-${_pkgver_libtermkey}.tar.gz"
        "http://www.lua.org/ftp/lua-${_pkgver_lua}.tar.gz"
        "http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-${_pkgver_lpeg}.tar.gz"
        "attr-${_pkgver_attr}.tar.gz::http://git.savannah.gnu.org/cgit/attr.git/snapshot/attr-${_pkgver_attr}.tar.gz"
        "acl-${_pkgver_acl}.tar.gz::http://git.savannah.gnu.org/cgit/acl.git/snapshot/acl-${_pkgver_acl}.tar.gz")
sha256sums=('bed8ed32ef4f81bc4fd28e297ea8edc80027ac6923b9d3b5bd955d24899c7077'
            '78c2c4416ef284e2362bb0e761ee9c4add106d122ac44b341c6bcf449f0b17a6'
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
	cd vis-${pkgver}/

	# fix install path
	sed -i '/^SHAREPREFIX/c SHAREPREFIX ?= ${PREFIX}/share' Makefile

	mkdir -p dependency/sources/

	for SOURCE in "${source[@]}"; do
		SOURCE="${SOURCE%::*}"
		SOURCE="$(basename ${SOURCE})"
		ln -s ../../../${SOURCE} dependency/sources/${SOURCE}
	done

	rmdir test/
	mv "../${_pkgname_test}-${_pkgver_test}" test
}

build() {
	cd vis-${pkgver}/

        # prepare test environment
        ./configure
        make -C test/core/
        make -C test/util/

	unset CFLAGS LDFLAGS

	make PREFIX='/usr/' single
}

check() {
	cd vis-${pkgver}/

	make -C test/
}

package_vis-standalone() {
	pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked'
	backup=('etc/vis/visrc.lua')

	cd vis-${pkgver}/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 lua/visrc.lua "${pkgdir}"/etc/vis/visrc.lua

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
}

package_vis-single() {
	pkgdesc='modern, legacy free, simple yet efficient vim-like editor - statically linked, self-extracting'

	cd vis-${pkgver}/

	install -D -m0755 vis-single "${pkgdir}/usr/bin/vis"
}

