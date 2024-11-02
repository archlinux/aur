# Maintainer:  CloverGit <clovergit@hotmail.com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Schala

pkgname=mingw-w64-wxmsw-git
pkgver=3.2.0.rc1.r4246.g12b09a5
pkgrel=1
pkgdesc="Win32 implementation of wxWidgets API for GUI (mingw-w64)"
arch=(any)
url="https://wxwidgets.org"
license=("custom:wxWindows")
makedepends=(mingw-w64-cmake
	mingw-w64-configure)
depends=(mingw-w64-crt
	mingw-w64-expat
	mingw-w64-libpng
	mingw-w64-libjpeg-turbo
	mingw-w64-libtiff)
options=(staticlibs !strip !buildflags)
conflicts=(mingw-w64-wxmsw mingw-w64-wxmsw2.9 mingw-w64-wxmsw-static)
provides=(mingw-w64-wxmsw mingw-w64-wxmsw2.9 mingw-w64-wxmsw-static)
source=("git+https://github.com/wxWidgets/wxWidgets.git")
b2sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd "${srcdir}/wxWidgets"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
	cd "${srcdir}/wxWidgets"
	git submodule update --init --recursive
	# wxWidgets do not check MINGW and use MSVC_NAME
	sed -i 's|AND NOT MSYS|AND NOT MSYS AND NOT MINGW|' build/cmake/functions.cmake
}

build() {
	local _build_flags="\
      -DwxBUILD_PRECOMP=OFF \
      -DwxBUILD_TOOLKIT=msw \
      -DwxUSE_EXPAT=sys \
      -DwxUSE_GRAPHICS_CONTEXT=ON \
      -DwxUSE_LIBJPEG=sys \
      -DwxUSE_LIBPNG=sys \
      -DwxUSE_LIBTIFF=sys \
      -DwxUSE_MEDIACTRL=ON \
      -DwxUSE_OPENGL=ON \
      -DwxUSE_REGEX=builtin \
      -DwxUSE_UNICODE=ON \
      -DwxUSE_WEBVIEW=ON \
      -DwxUSE_ZLIB=sys"

	cd "${srcdir}/wxWidgets"
	for _arch in ${_architectures}; do
		# shared build
		mkdir -p build-shared-${_arch} && pushd build-shared-${_arch}
		${_arch}-cmake .. \
			-DBUILD_SHARED_LIBS:BOOL=ON \
			-DwxBUILD_MONOLITHIC=ON \
			${_build_flags}
		cmake --build .
		popd

		# static build
		mkdir -p build-static-${_arch} && pushd build-static-${_arch}
		${_arch}-cmake .. \
			-DBUILD_SHARED_LIBS:BOOL=OFF \
			${_build_flags}
		cmake --build .
		popd

		# Run configure to generate the Makefile, cmake doesn't install translations
		mkdir -p build-locale-${_arch} && pushd build-locale-${_arch}
		${_arch}-configure --disable-option-checking ..
		popd
	done
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	for _arch in ${_architectures}; do
		for _build in shared static; do
			cd "${srcdir}/wxWidgets/build-${_build}-${_arch}"
			DESTDIR="${pkgdir}" cmake --install .
		done

		# Install translations
		cd "${srcdir}/wxWidgets/build-locale-${_arch}"
		make DESTDIR="$pkgdir" locale_install

		# FIXME: move DLL to bin/
		mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/

		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

		ln -s /usr/${_arch}/lib/wx/config/msw-unicode-${pkgver:0:2}* \
			"$pkgdir/usr/bin/${_arch}-wx-config"

		install -Dm644 "${srcdir}/wxWidgets/wxwin.m4" -t "$pkgdir"/usr/${_arch}/share/aclocal
	done

	install -Dm644 "${srcdir}/wxWidgets/docs/licence.txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim: set sw=2 ts=2 et:
