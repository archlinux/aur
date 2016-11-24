# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>

pkgname=anki-drive-sdk-git
pkgver=0.3.0.r30.20161116
pkgrel=1
pkgdesc="C implementation of message protocols and data parsing to communicate with Anki Drive vehicles"
arch=('i686' 'x86_64')
url="https://github.com/anki/drive-sdk"
license=('Apache')
depends=('glib2')
optdepends=('bluez-utils: for command line tool hciconfig')
makedepends=('cmake' 'gcc')
source=(
	"$pkgname::git+https://github.com/anki/drive-sdk.git"
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
	# add ".r*.*" from package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}
prepare() {
	cd $pkgname
}
build() {
	cd "$pkgname"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX= -DBUILD_EXAMPLES=ON
	make
}
package() {
	cd "$pkgname/build"
	make DESTDIR="${pkgdir}/usr" install
	install -Dm644 '../include/ankidrive.h' "${pkgdir}/usr/include/ankidrive.h"
	# delete hciconfig, because it is already included in optional package bluez-utils
	rm "${pkgdir}/usr/bin/hciconfig"
	install -Dm644 '../LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
