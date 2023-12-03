# Maintainer: SelfRef <arch@selfref.dev>
_basename=xfce-winxp-tc
pkgname=('xfce-winxp-tc-git' 'libwintc-git')
pkgver=r274.7ac4c6f
pkgrel=1
pkgdesc="Windows XP Total Conversion for XFCE"
arch=('x86_64')
url="https://github.com/rozniak/xfce-winxp-tc"
license=('GPL')
makedepends=('git' 'cmake' 'python' 'xorg-xcursorgen' 'ruby-sass' 'garcon' 'lightdm')
source=("${_basename}"::"git+https://github.com/rozniak/xfce-winxp-tc.git")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/${_basename}/packaging"
	sed -i 's/distro_in_use=.*$/distro_in_use=arch/' distid.sh
}

pkgver() {
	cd "${_basename}"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname%-git}/packaging"
	CFLAGS='-w' ./buildall.sh -z
}

# Package shared libraries
package_libwintc-git() {
	pkgdesc="Windows XP Total Conversion for XFCE (libraries)"
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/${_basename}/packaging/build/shared"
	lib_list=$(find . -mindepth 1 -maxdepth 1 -type d)
	for lib in $lib_list; do
		cd "$lib"
		make DESTDIR="$pkgdir/" install
		cd -
	done
}

# Package components
package_xfce-winxp-tc-git() {
	depends=('xdg-utils' 'libwintc')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/${_basename}/packaging/build"
	#comp_list=$(find . -type d -exec test -f {}/Makefile \; -print) # Legacy way
	comp_list=$(sed 's/#.*$//g' < "../targets")
	for comp in $comp_list; do
		cd "$comp"
		make DESTDIR="$pkgdir/" install
		cd -
	done
}
