# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=trustedqsl-git
_pkgname=trustedqsl
__pkgname=tqsl
pkgver=2.3.1.r0.ge165520
#.r0.ge165520
pkgrel=1
pkgdesc="QSO log signing & upload - ARRL's Logbook of The World (LoTW) - GIT version"
arch=('i686' 'x86_64')
url="http://lotw.arrl.org/"
license=('custom:ARRL')
depends=('wxgtk2.8' 'curl' 'hamradio-menus')
makedepends=('cmake')
provides=('tqsllib' 'trustedqsl')
conflicts=('trustedqsl' 'trustedqsl-devel')
replaces=('tqsl')
source=("$pkgname::git+http://git.code.sf.net/p/${_pkgname}/${__pkgname}"
	diff.CMakeLists.txt.apps
	diff.CMakeLists.txt.src
	${_pkgname}.desktop)

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	patch -p0 < ../diff.CMakeLists.txt.apps
	patch -p0 < ../diff.CMakeLists.txt.src
}

build() {
	cd "$srcdir/$pkgname"

	mkdir -p build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' \
		-DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8' \
		../
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install

	find "$pkgdir" -name wxstd* -exec rm {} +

	install -D -m644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

	mkdir -p $pkgdir/usr/share/applications
	install -D -m 644 ../../${_pkgname}.desktop $pkgdir/usr/share/applications

	rm -rf $pkgdir/usr/include
}
md5sums=('SKIP'
         'bbdec5f6ae2d23bb2c74c84df07d2c70'
         'b52832f551af286f208a47154504cfba'
         '860b305f9cf6db8cc1c14dc88cef34fc')
sha256sums=('SKIP'
            '84eb4f182e90d6996d687952e82c47c2cc7c8fcd95a4290ef7b8c77b4d7b6e4e'
            '42998a3ace2fe998b1aa7c17be1eedde40a52fd8b1529f93f1bac8f8ca16699a'
            'cb638467e305f6f9426a22841dbbb4d656a30f48e4c1c27e87dd82890794c167')
