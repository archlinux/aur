# Maintainer: SelfRef <arch@selfref.dev>
pkgname=xfce-winxp-tc-git
pkgver=r242.484ec47
pkgrel=2
pkgdesc="Windows XP Total Conversion for XFCE"
arch=('x86_64')
url="https://github.com/rozniak/xfce-winxp-tc"
license=('GPL')
depends=('xfce4-panel')
makedepends=('git' 'cmake' 'xorg-xcursorgen' 'ruby-sass' 'xfce4-panel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rozniak/xfce-winxp-tc.git'
		'components.build')
md5sums=('SKIP'
		 '52dee916cabb7dafb573974688b6272f')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	find . -iname CMakeLists.txt -exec sed -i '/REQUIRED wintc-comgtk/d' {} +
	find . -iname CMakeLists.txt -exec sed -i '/REQUIRED wintc-exec/d' {} +
	find . -iname CMakeLists.txt -exec sed -i '/REQUIRED wintc-shllang/d' {} +
	find . -iname CMakeLists.txt -exec sed -i '/REQUIRED wintc-winbrand/d' {} +
	find . -iname CMakeLists.txt -exec sed -i 's/LIB_DIR lib64/LIB_DIR lib/g' {} +
}

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
	build_list=$(sed 's/#.*$//g' < ../components.build)
	rm -rf ./build
	mkdir ./build
	cd ./build
	for component in $build_list; do
		build_dir=$(echo "$component" | sed 's/\//_/g')
		mkdir -p "./$build_dir"
		cd "./$build_dir"
		cmake \
			-DWINTC_SKU=xpclient-pro \
			-DBUILD_SHARED_LIBS=ON \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DWINTC_PKGMGR=raw \
			-DCMAKE_INSTALL_LIBDIR=/usr/lib \
			-DCMAKE_C_FLAGS="-w \
				-I$srcdir/${pkgname%-git}/shared/comgtk/public \
				-I$srcdir/${pkgname%-git}/shared/exec/public \
				-I$srcdir/${pkgname%-git}/shared/shllang/public \
				-I$srcdir/${pkgname%-git}/shared/winbrand/public" \
			-DCMAKE_EXE_LINKER_FLAGS="\
				-L$srcdir/build/shared_comgtk -lwintc-comgtk \
				-L$srcdir/build/shared_shllang -lwintc-shllang \
				-L$srcdir/build/shared_exec -lwintc-exec \
				-L$srcdir/build/shared_winbrand -lwintc-winbrand" \
			"$srcdir/${pkgname%-git}/$component"
		make
		cd ..
	done
}

package() {
	build_list=$(sed 's/#.*$//g' < ../components.build)
	cd ./build
	for component in $build_list; do
		build_dir=$(echo "$component" | sed 's/\//_/g')
		cd "./$build_dir"
		make DESTDIR="$pkgdir/" install
		cd ..
	done
}
