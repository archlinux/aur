# Maintainer: SelfRef <arch@selfref.dev>
_basename=xfce-winxp-tc
pkgname=('xfce-winxp-tc-git' 'libwintc-git')
pkgver=r243.2811c5b
pkgrel=1
pkgdesc="Windows XP Total Conversion for XFCE"
arch=('x86_64')
url="https://github.com/rozniak/xfce-winxp-tc"
license=('GPL')
makedepends=('git' 'cmake' 'python' 'xorg-xcursorgen' 'ruby-sass' 'garcon')
source=("${_basename}"::"git+https://github.com/rozniak/xfce-winxp-tc.git"
	'components.build')
md5sums=('SKIP'
	'e7e1fe38fe4f7d5a0455573199f8a943')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	find . -iname CMakeLists.txt -exec sed -i '/REQUIRED wintc-comgtk/d' {} +
	find . -iname CMakeLists.txt -exec sed -i '/REQUIRED wintc-exec/d' {} +
	find . -iname CMakeLists.txt -exec sed -i '/REQUIRED wintc-shllang/d' {} +
	find . -iname CMakeLists.txt -exec sed -i '/REQUIRED wintc-winbrand/d' {} +
	find . -iname CMakeLists.txt -exec sed -i 's/LIB_DIR lib64/LIB_DIR lib/g' {} +
}

pkgver() {
	cd "${_basename}"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	lib_list=$(find "${_basename}/shared/" -mindepth 1 -maxdepth 1 -type d | cut -sd / -f 2-)
	comp_list=$(sed 's/#.*$//g' < "../components.build")

	# Build shared libraries
	for lib in $lib_list; do
		build_dir=$(echo "$lib" | sed 's/\//_/g')
		if [ -d "$build_dir" ]; then rm -rf "$build_dir"; fi
		mkdir "$build_dir"
		cd "$build_dir"
		cmake \
			-DWINTC_SKU=xpclient-pro \
			-DBUILD_SHARED_LIBS=ON \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DWINTC_PKGMGR=raw \
			-DCMAKE_INSTALL_LIBDIR=/usr/lib \
			-DCMAKE_C_FLAGS="-w \
				-I$srcdir/${_basename}/shared/comgtk/public \
				-I$srcdir/${_basename}/shared/exec/public \
				-I$srcdir/${_basename}/shared/shllang/public \
				-I$srcdir/${_basename}/shared/winbrand/public" \
			"$srcdir/${_basename}/$lib"
		make
		cd ..
	done

	# Build components
	for component in $comp_list; do
		build_dir=$(echo "$component" | sed 's/\//_/g')
		if [ -d "$build_dir" ]; then rm -rf "$build_dir"; fi
		mkdir "$build_dir"
		cd "$build_dir"
		pwd
		cmake \
			-DWINTC_SKU=xpclient-pro \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DWINTC_PKGMGR=raw \
			-DCMAKE_C_FLAGS="-w \
				-I$srcdir/${_basename}/shared/comgtk/public \
				-I$srcdir/${_basename}/shared/exec/public \
				-I$srcdir/${_basename}/shared/shllang/public \
				-I$srcdir/${_basename}/shared/winbrand/public" \
			-DCMAKE_EXE_LINKER_FLAGS="\
				-L$srcdir/shared_comgtk -lwintc-comgtk \
				-L$srcdir/shared_shllang -lwintc-shllang \
				-L$srcdir/shared_exec -lwintc-exec \
				-L$srcdir/shared_winbrand -lwintc-winbrand" \
			"$srcdir/${_basename}/$component"
		make
		cd ..
	done
}

# Package shared libraries
package_libwintc-git() {
	pkgdesc="Windows XP Total Conversion for XFCE (libraries)"
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	lib_list=$(find "${_basename}/shared/" -mindepth 1 -maxdepth 1 -type d | cut -sd / -f 2-)
	for component in $lib_list; do
		build_dir=$(echo "$component" | sed 's/\//_/g')
		cd "./$build_dir"
		make DESTDIR="$pkgdir/" install
		cd ..
	done
}

# Package components
package_xfce-winxp-tc-git() {
	depends=('xdg-utils' 'libwintc')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	comp_list=$(sed 's/#.*$//g' < "../components.build")
	for component in $comp_list; do
		build_dir=$(echo "$component" | sed 's/\//_/g')
		cd "./$build_dir"
		make DESTDIR="$pkgdir/" install
		cd ..
	done
}
