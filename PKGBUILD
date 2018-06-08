# Maintainer: Benjamin Hodgetts <ben@xnode.org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: ceri

_pkgbase='citra'
pkgname="citra-ex-git"
pkgver=r6193.98438258c
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger (single package)"
arch=('i686' 'x86_64')
url="https://github.com/citra-emu/citra/"
license=('GPL2')
provides=('citra')
conflicts=('citra-git' 'citra-qt-git')
depends=('qt5-base' 'sdl2' 'shared-mime-info' 'desktop-file-utils')
makedepends=('git' 'cmake' 'sdl2' 'qt5-base' 'shared-mime-info' 'desktop-file-utils')
source=(
	'git+https://github.com/citra-emu/citra'
	'git+https://github.com/citra-emu/ext-boost'
	'git+https://github.com/neobrain/nihstro'
	'git+https://github.com/citra-emu/ext-soundtouch'
	'git+https://github.com/philsquared/Catch'
	'git+https://github.com/MerryMage/dynarmic'
	'git+https://github.com/herumi/xbyak'
	'git+https://github.com/weidai11/cryptopp'
	'git+https://github.com/fmtlib/fmt'
	'git+https://github.com/lsalzman/enet'
	'git+https://github.com/whoshuu/cpr'
	'git+https://github.com/benhoyt/inih'
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgbase}"
	mkdir -p build

	git submodule init
	git config submodule.boost.url "${srcdir}/ext-boost"
	git config submodule.nihstro.url "${srcdir}/nihstro"
	git config submodule.soundtouch.url "${srcdir}/ext-soundtouch"
	git config submodule.catch.url "${srcdir}/Catch"
	git config submodule.dynarmic.url "${srcdir}/dynarmic"
	git config submodule.xbyak.url "${srcdir}/xbyak"
	git config submodule.cryptopp.url "${srcdir}/cryptopp"
	git config submodule.fmt.url "${srcdir}/fmt"
	git config submodule.enet.url "${srcdir}/enet"
	git config submodule.cpr.url "${srcdir}/cpr"
	git config submodule.inih.url "${srcdir}/inih"
	git submodule update --init --recursive

	cd externals/dynarmic
	git config submodule.externals/fmt.url "${srcdir}/fmt"
	git config submodule.externals/xbyak.url "${srcdir}/xbyak"
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${_pkgbase}/build"
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${srcdir}/${_pkgbase}/build"
	install -Dm755 "src/citra/citra" "${pkgdir}/usr/bin/citra"
	install -Dm755 "src/citra_qt/citra-qt" "${pkgdir}/usr/bin/citra-qt"
}
