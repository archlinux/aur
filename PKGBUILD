# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=trustedqsl-git
_pkgname=trustedqsl
__pkgname=tqsl
pkgver=2.6.5.rc2.r0.ge7d3796
#.rc2.r0.ge7d3796
#2.3.1.r4.g640e7ac
#.r4.g640e7ac
#.r0.ge165520
pkgrel=3
pkgdesc="QSO log signing & upload - ARRL's Logbook of The World (LoTW) - GIT version"
arch=('i686' 'x86_64')
url="http://lotw.arrl.org/"
license=('custom:ARRL')
depends=('lmdb' 'wxgtk3' 'hamradio-menus')
makedepends=('git' 'cmake' 'libxxf86vm')
provides=('tqsllib' 'trustedqsl')
conflicts=('trustedqsl' 'trustedqsl-devel')
replaces=('tqsl')
source=($pkgname::git+http://git.code.sf.net/p/$_pkgname/$__pkgname
	$_pkgname.desktop)

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	mkdir -p build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config' \
		-DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc' \
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

	rm -rf $pkgdir/usr/include $pkgdir/man5
}
md5sums=('SKIP'
         '6dd4296f5fda2d77922c9cbe4a120d3b')
sha256sums=('SKIP'
            '68129b7f7ddbb75be52f1b9164d43c6d9805c5877423546b50397c2d920c79e9')
