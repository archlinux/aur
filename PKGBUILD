# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>
_pkgbase="rv8"
pkgname="rv8-git"
pkgver=2279.8342590
pkgrel=2
pkgdesc="RISC-V simulator for x86-64"
arch=('x86_64')
url="https://github.com/michaeljclark/rv8"
license=('MIT')
depends=('riscv64-linux-gnu-gcc')
makedepends=('git')
provides=("rv8")
conflicts=("rv8")
source=("rv8::git+https://github.com/michaeljclark/rv8.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgbase"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgbase"
	git submodule update --init --recursive
}

build() {
	cd "$_pkgbase"
	# https://stackoverflow.com/a/68149587/2475176
	GCC_VER=$(g++ -dumpversion)
	sed -i 's|\(CXXFLAGS =.*\)|\1\nCXXFLAGS += -include /usr/include/c++/'$GCC_VER'/limits|' Makefile
	export RISCV="/usr"
	make DEST_DIR="/usr" enable_harden=1
}

package() {
	cd "$_pkgbase"
	mkdir "$pkgdir/usr/" "$pkgdir/usr/bin/" "$pkgdir/usr/lib/"
	make DEST_DIR="$pkgdir/usr" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgbase"/LICENSE
}
