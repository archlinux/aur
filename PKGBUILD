# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=trustedqsl-git
_pkgname=trustedqsl
__pkgname=tqsl
pkgver=2.1
#.beta3.r4.gc1bddf9
pkgrel=1
pkgdesc="QSO log signing & upload - ARRL's Logbook of The World (LoTW) - GIT version"
arch=('i686' 'x86_64')
url="http://lotw.arrl.org/"
license=('custom:ARRL')
depends=('wxgtk2.8' 'curl' 'desktop-file-utils')
makedepends=('cmake')
provides=('tqsllib')
conflicts=('trustedqsl' 'trustedqsl-devel')
replaces=('tqsl')
install=${_pkgname}.install
source=("$pkgname::git+http://git.code.sf.net/p/${_pkgname}/${__pkgname}"
	diff.CMakeLists.txt.apps
	diff.CMakeLists.txt.src
	${_pkgname}.desktop
	${_pkgname}.install)

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
         '8f401e02bfdefb486bbbeaba58522486'
         '860b305f9cf6db8cc1c14dc88cef34fc'
         'f7e1e2722c972f3420cfd69492c79073')
sha256sums=('SKIP'
            '84eb4f182e90d6996d687952e82c47c2cc7c8fcd95a4290ef7b8c77b4d7b6e4e'
            '0adb97d5a65701465309b8fed0fe8fbc04400d3342102887f05fddf52d985f87'
            'cb638467e305f6f9426a22841dbbb4d656a30f48e4c1c27e87dd82890794c167'
            'f703f8de14eb277dc72cc837086fbd55f5d772049a44200686c8ae76348f6614')
