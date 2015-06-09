pkgname=mingw-w64-smpeg
epoch=1
pkgver=0.4.5
pkgrel=2
pkgdesc="SDL MPEG Player Library (mingw-w64)"
arch=(any)
url="http://icculus.org/smpeg"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config subversion)
depends=(mingw-w64-crt mingw-w64-sdl)
provides=("mingw-w64-smpeg-svn=399")
source=("${pkgname}::svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
md5sums=('SKIP')
options=(staticlibs !strip !buildflags)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/$pkgname"
  ./autogen.sh
}

build() {
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		"${srcdir}"/$pkgname/configure \
			--prefix=/usr/${_arch} \
			--build=$CHOST \
			--host=${_arch} \
			--disable-sdltest \
			--disable-gtk-player \
			--disable-gtktest \
			--disable-opengl-player \
			--with-sdl-prefix=/usr/${_arch} \
			--without-x
		make LDFLAGS+="-lstdc++"
		${_arch}-gcc -shared .libs/*.o -lSDL -lstdc++ -o smpeg.dll -Xlinker --out-implib \
			-Xlinker libsmpeg.dll.a
	done
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	for _arch in ${_architectures}; do
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		make DESTDIR="$pkgdir" install
		install -m644 smpeg.dll "$pkgdir/usr/$_arch/bin/"
		install -m644 libsmpeg.dll.a "$pkgdir/usr/$_arch/lib/"
		find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
		find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
		rm -r "$pkgdir/usr/${_arch}/share"
		ln -s "/usr/${_arch}/bin/smpeg-config" "$pkgdir/usr/bin/${_arch}-smpeg-config"
	done
}
