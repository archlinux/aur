# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=caveexpress
pkgver=2.6
pkgrel=1
pkgdesc="Classic 2D platformer with physics-based gameplay and dozens of levels"
arch=('i686' 'x86_64')
url="http://www.caveproductions.org"
license=('GPL-3.0-only' 'CCPL' 'MIT')
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_net' 'sqlite3' 'lua')
makedepends=('cmake' 'ninja' 'git')
_box2d_version=2.4.2
source=("git+https://github.com/mgerhardy/${pkgname}.git#tag=${pkgver}"
        $pkgname-installation-paths.patch
        "box2d-${_box2d_version}.tar.gz::https://github.com/erincatto/box2d/archive/refs/tags/v${_box2d_version}.tar.gz")
sha256sums=('e7b19e55c7cb3fc764a9f1f6bf5a5c9d1ada9dfae837fbd62671fabcbc3ada31'
            '2646b0c6d4a8174de00d58e3308ac138090a5b5746e9509af5631f46df0e8433'
            '85b9b104d256c985e6e244b4227d447897fac429071cc114e5cc819dae848852')

_srcdir="$pkgname"

prepare() {
	# packaging fixes
	cd "$_srcdir/cmake"
	patch -N -i "${srcdir}/$pkgname-installation-paths.patch"

	cd '..'
	sed -i 's/@APP@-icon/@APP@/' 'contrib/installer/linux/desktop.in'
}

build() {
	cmake -GNinja -S "box2d-${_box2d_version}" -B 'build-box2d' -DCMAKE_INSTALL_PREFIX="${srcdir}/prefix" \
		-DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=OFF \
		-DBOX2D_BUILD_DOCS=OFF -DBOX2D_BUILD_TESTBED=OFF
	cmake --build 'build-box2d'
	cmake --install 'build-box2d'

	export CFLAGS+=' -Wno-error=format-security'
	export CXXFLAGS+=" -I${srcdir}/prefix/include"
	cmake -GNinja -S "$_srcdir" -B 'build' \
		-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None \
		-DCMAKE_PREFIX_PATH="${srcdir}/prefix" \
		-DPKGDATADIR=/usr/share/games -DCAVEPACKER=ON -DUNITTESTS=OFF -DUSE_CCACHE=OFF
	cmake --build 'build'
}

package() {
	DESTDIR="${pkgdir}" cmake --install 'build'

	# doc
	cd "$_srcdir"
	install -d "$pkgdir"/usr/share/doc
	cp -rup docs/$pkgname "$pkgdir"/usr/share/doc

	rm -f "$pkgdir"/usr/share/applications/*.yaml

	install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dpm644 "${srcdir}/box2d-${_box2d_version}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/box2d-license"
}
