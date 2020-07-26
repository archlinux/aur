# Maintainer: oakszyjrnrdy <oakszyjrnrdy at outlook dot com>
_pkgname="chicony-ir-toggle"
pkgname="$_pkgname-git"
pkgver=r12.ed296dd
pkgrel=1
pkgdesc="A controller for IR emitters of howdy enabled IR cameras"
arch=("x86_64")
url="https://github.com/PetePriority/$_pkgname"
license=('MIT')
makedepends=(
	"git"
	"cmake"
	)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	sed -i "s@/lib@/usr/lib@" "CMakeLists.txt"
	# change the following local variables to match your IR camera
	# you may use this command to get the information if /dev/video2 is your IR camera
	# udevadm info --attribute-walk --path=$(udevadm info --query=path --name=/dev/video2)
	## device
	local kernel="video2"
	local attr_index="0"
	local attr_name="Integrated Camera: Integrated I"
	## parent device
	local attrs_idVendor="13d3"
	local attrs_idProduct="56ba"
	sed -i "s@ATTRS{idVendor}==\"04f2\", ATTRS{idProduct}==\"b67c\"@KERNEL==\"$kernel\", ATTR{index}==\"$attr_index\", ATTR{name}==\"$attr_name\", ATTRS{idVendor}==\"$attrs_idVendor\", ATTRS{idProduct}==\"$attrs_idProduct\"@" "system/99-ir-led.rules.cmake"
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="/usr/" ..
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "build"
	make DESTDIR="$pkgdir/" install
}
