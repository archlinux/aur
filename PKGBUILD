# Maintainer: John N Bilbrey <beelzebud@gmail.com>
_pkgname=plug
pkgname=$_pkgname-git
pkgver=v1.4.3.r0.ge21406f
pkgrel=1
pkgdesc="Software for the Fender Mustang series of guitar amplifiers."
arch=(x86_64)
url="https://github.com/offa/plug"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake' 'git' 'gtest' 'gmock' 'libusb')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
	"fixed_path.patch")
sha256sums=('SKIP'
            '899fd86ed0e7022470cb3194cd5809fe0198fafe404f55b714d9718570fd2c8f')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
    cd ../src/plug/cmake
    patch --forward --strip=3 --input="${srcdir}/fixed_path.patch"
    cd ../
    mkdir build
}

build() {
	cd $_pkgname/build
	cmake ..
	make
	make unittest
}

package() {
	cd $srcdir
	install -Dm755 $_pkgname/build/src/plug "$pkgdir"/usr/bin/plug
	install -Dm644 $_pkgname/cmake/50-mustang.rules "$pkgdir"/usr/lib/udev/rules.d/50-mustang.rules
	install -Dm644 $_pkgname/cmake/plug.desktop "$pkgdir"/usr/share/applications/plug.desktop
	install -Dm644 $_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LISENSE
	install -d "$pkgdir"/usr/share/doc/$_pkgname
	install -m644 $_pkgname/*.md "$pkgdir"/usr/share/doc/$_pkgname/
}
