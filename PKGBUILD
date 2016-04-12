# Maintainer: X0rg

_realname=CPU-X
pkgname=cpu-x-git
pkgver=2.92.0.r123.g85e5be2
pkgrel=1
pkgdesc="A Free software that gathers information on CPU, motherboard and more (like CPU-Z)"
arch=('i686' 'x86_64')
url="https://github.com/X0rg/CPU-X"
license=('GPL3')
depends=('gtk3' 'ncurses' 'libcpuid-git' 'pciutils' 'procps-ng')
makedepends=('cmake' 'nasm')
provides=('cpu-x')
conflicts=('cpu-x')
options=('debug')
install=$pkgname.install
source=("git+https://github.com/X0rg/CPU-X.git")
md5sums=('SKIP')

pkgver() {
	cd "$_realname"
	v=$(grep "VERSION" CMakeLists.txt | sed -n 2p | awk '{ print $2 }')
	git describe --long --tags | sed -e "s/^v//;s/2.2.2/$v/;s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
	msg2 "Make 'build' directory..."
	mkdir -pv "$srcdir/$_realname/build"
}

build() {
	cd "$_realname/build"
	msg2 "Run 'cmake'..."
	cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ..

	msg2 "Run 'make'..."
	make
}

package() {
	cd "$_realname/build"
	msg2 "Install..."
	make DESTDIR="$pkgdir" install
}
