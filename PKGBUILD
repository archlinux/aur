pkgname=mingw-w64-libxslt
pkgver=1.1.29+42+gac341cbd
_commit=ac341cbd792ee572941cc9a66e73800219a1a386
pkgrel=1
pkgdesc="XML stylesheet transformation library (mingw-w64)"
arch=(any)
url="http://xmlsoft.org/XSLT/"
license=("custom")
depends=(mingw-w64-libxml2 mingw-w64-libgcrypt)
makedepends=(mingw-w64-configure)
options=(!strip staticlibs !buildflags !emptydirs)
source=("git://git.gnome.org/libxslt#commit=$_commit"
"libxslt-1.1.26-w64.patch"
"libxslt.m4-libxslt-1.1.26.patch"
"0003-fix-concurrent-directory-creation.all.patch")
md5sums=('SKIP'
         'b994c0d9df0f644e219cf63561ee0d4e'
         '61b520bbd42006c16bbfc85bc5342b96'
         '6da8eb266e6be4f843cf63bd74c6388b')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/libxslt"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$srcdir/libxslt"
	patch -p1 -i "${srcdir}/libxslt-1.1.26-w64.patch"
  patch -p1 -i "${srcdir}/libxslt.m4-libxslt-1.1.26.patch"
  patch -p1 -i "${srcdir}/0003-fix-concurrent-directory-creation.all.patch"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$srcdir/libxslt"
	unset LDFLAGS
	for _arch in ${_architectures}; do
		mkdir -p "build-${_arch}" && pushd "build-${_arch}"
		${_arch}-configure \
			--with-libxml-prefix=/usr/${_arch} \
			--without-python
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "$srcdir/libxslt/build-${_arch}"
		make DESTDIR="$pkgdir" install
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
	done
}

