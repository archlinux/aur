# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>

pkgname=('anki-drive-sdk-git' 'libankidrive-git')
pkgver=0.3.0.r40.20180115
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/anki/drive-sdk"
license=('Apache')
optdepends=('bluez-utils: for command line tool btmgmt (hciconfig is deprecated)')
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
	# add ".r*.*" to package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}
prepare() {
	cd $pkgname
}
build() {
	echo "BUILD..."
	cd "$pkgbase"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX= -DBUILD_EXAMPLES=ON
}
package() {
	install -Dm644 "../../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
package_anki-drive-sdk-git() {
	pkgdesc="C SDK for message protocols and data parsing to communicate with Anki Drive vehicles"
	depends=('libankidrive')
	cd "$pkgbase/build/examples"
	make DESTDIR="${pkgdir}/usr" install
	package
}
package_libankidrive-git() {
	pkgdesc="C library of message protocols and data parsing to communicate with Anki Drive vehicles"
	depends=('glib2')
	conflicts=('libankidrive')
	replaces=('libankidrive')
	provides=('libankidrive')
	cd "$pkgbase/build/src"
	make DESTDIR="${pkgdir}/usr" install
	install -Dm644 '../../include/ankidrive.h' "${pkgdir}/usr/include/ankidrive.h"
	install -dm755 "${pkgdir}/usr/include/ankidrive"
	cp -a ../../include/ankidrive/*.h "${pkgdir}/usr/include/ankidrive/."
	package
}
