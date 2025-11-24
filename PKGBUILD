# Maintainer: SelfRef <arch@selfref.dev>

_basename=xfce-winxp-tc
pkgname=('xfce-winxp-tc-git' 'libwintc-git')
pkgver=r416.1a2f8d5
pkgrel=1
pkgdesc="Windows XP Total Conversion for XFCE"
arch=('x86_64' 'aarch64')
url="https://github.com/rozniak/xfce-winxp-tc"
license=('GPL')
depends=(
	'python'
	'sqlite'
	'libxml2'
)
makedepends=(
	'git'
	'cmake'
	'python-packaging'
	'xorg-xcursorgen'
	'ruby-sass'
	'garcon'
	'lightdm'
	'libpulse'
	'glib2-devel'
	'libcanberra'
	'webkit2gtk-4.1'
	'libzip'
	'upower'
	'networkmanager'
)
optdepends=(
	'lightdm: LightDM theme'
	'libcanberra: Sound theme'
	'libpulse: Volume control in tray'
	'upower: Battery indicator in tray'
	'webkit2gtk-4.1: Internet Explorer'
	'libzip: Browsing ZIP files in Windows Explorer'
	'networkmanager: Network status in tray'
)
source=("${_basename}"::"git+https://github.com/rozniak/xfce-winxp-tc.git")
md5sums=('SKIP')

pkgver() {
	cd "${_basename}"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname%-git}/packaging"
	CFLAGS='-w' ./buildall.sh -z -t archpkg
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
