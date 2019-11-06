# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>

pkgname=('anki-drive-sdk-git')
pkgdesc="C SDK for message protocols and data parsing to communicate with Anki Drive vehicles"
pkgver=0.3.0.r41.20191106
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/anki/drive-sdk"
license=('Apache')
depends=('glib2')
optdepends=(
	'bluez-utils: for command line tool btmgmt (hciconfig is deprecated)'
	'readline: for command line tool vehicle-tool to communicate with Anki cars'
)
makedepends=('cmake' 'gcc')
conflicts=('libankidrive')
replaces=('libankidrive')
source=(
#	"$pkgname::git+https://github.com/anki/drive-sdk.git"
	"$pkgname::git+https://github.com/OpenHelios/drive-sdk.git"
)
md5sums=('SKIP')
pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" to package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}
build() {
	cd "$pkgbase"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX= -DBUILD_EXAMPLES=ON
}
package() {
	pushd "$pkgbase/build/src"
	make DESTDIR="$pkgdir/usr" install
	popd
	cd "$pkgbase/build/examples"
	make DESTDIR="$pkgdir/usr" install
	install -Dm644 '../../include/ankidrive.h' "${pkgdir}/usr/include/ankidrive.h"
	install -dm755 "$pkgdir/usr/include/ankidrive"
	cp -a ../../include/ankidrive/*.h "$pkgdir/usr/include/ankidrive/."
	install -Dm644 "../../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
