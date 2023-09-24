# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Christoph Brill <egore911@gmail.com>
_pkgname=evtest-qt
pkgname=${_pkgname}-git
pkgver=r130.fb087f4
pkgrel=1
pkgdesc="Linux Joystick Tester for Qt"
arch=('i686' 'x86_64')
url="https://github.com/Grumbel/${_pkgname}"
license=('GPL3')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'tinycmmc')
source=("git+${url}.git" "fix-compilation-with-newer-gcc.patch")
md5sums=('SKIP'
         '31d7b01d019237b02ae61dc6b6e8afba')
provides=("$_pkgname")
conflicts=("$_pkgname")

prepare() {
	cd "$srcdir/${_pkgname}"

	patch -p1 < "$srcdir/fix-compilation-with-newer-gcc.patch"
}

pkgver()  {
	printf "r%s.%s" "$(git -C ${_pkgname} rev-list --count HEAD)" "$(git -C ${_pkgname} rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/${_pkgname}/build"
	cd "$srcdir/${_pkgname}/build"
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
        cd "$srcdir/${_pkgname}/build"
        make DESTDIR="$pkgdir/" install
}

