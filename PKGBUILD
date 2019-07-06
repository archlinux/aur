_pkgname=aspell
pkgname=mingw-w64-$_pkgname
_pkgver=0.60.7-rc1
pkgver=${_pkgver/-/}
_pkgmajorver=0.60
pkgrel=5
pkgdesc="A spell checker designed to eventually replace Ispell (mingw-w64)"
arch=(any)
url="http://aspell.net/"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pdcurses)
depends=(mingw-w64-gettext)
options=(!strip !buildflags staticlibs)
optdepends=(mingw-w64-pdcurses)
source=("https://github.com/GNUAspell/aspell/archive/rel-$_pkgver.tar.gz"
	"0001-use-namespace.mingw.patch"
	"0002-printf.mingw.patch"
	"0003-no-undefined-on.mingw.patch"
	"0004-reloc.mingw.patch"
	"0005-w32-home.all.patch"
	"0006-abort.mingw.patch"
	"0007-fix-including-langinfo.patch")
md5sums=('d0a766260a7877d1f06ed9aac74db5d5'
	'ee6e262260e11bc285ce6a242fec3aeb'
	'9f799391cc00cf9e0d5ffee88d103a97'
	'4aa79ac556d2cd42b1d736e031acdbac'
	'102bacf0b0c041f9d04aeb6bb0adb865'
	'3830ee14ff5b704a4e21b2c76f153217'
	'5ed7ead83958a39719242221c3669311'
	'50a79bb773b73cb3a69ec38cb086ca27')
sha1sums=('a1b34126ee0cceb3ee6cddf5997d15c63facd9ad'
	'be7c87411f47fe170e2b296553ce07b4272e2e0d'
	'c7bff3c45707095c16bda3d35ea95f3eb09683dc'
	'c0278c4d8cfe2e9dfee094b83197b2fb13d16126'
	'e38466e0e15458d73701b9fc224b31a3b5346b41'
	'1957646282ba00eabd7136fe67c6408a363f57b8'
	'f20a0677818cb24e32aefa5ea22662b9afe65360'
	'25a7919b90a9593cfc391ac0aa8fa6a2554c59cb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd $_pkgname-rel-$_pkgver
	patch -p1 -i ${srcdir}/0001-use-namespace.mingw.patch
	patch -p1 -i ${srcdir}/0002-printf.mingw.patch
	patch -p1 -i ${srcdir}/0003-no-undefined-on.mingw.patch
	patch -p1 -i ${srcdir}/0004-reloc.mingw.patch
	patch -p1 -i ${srcdir}/0005-w32-home.all.patch
	patch -p1 -i ${srcdir}/0006-abort.mingw.patch
	patch -p1 -i ${srcdir}/0007-fix-including-langinfo.patch
	PERLLIB=".:$PERLLIB" ./autogen
}

build() {
  for _arch in ${_architectures}; do
	CFLAGS+=" -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
	CPPFLAGS+=" -DENABLE_W32_PREFIX=1"
	mkdir -p build-${_arch} && cp -r $_pkgname-rel-$_pkgver/* build-${_arch}/ && pushd build-${_arch}
	./configure \
		--host=${_arch} \
		--build=$CHOST \
		--prefix=/usr/${_arch} \
		--libdir=/usr/${_arch}/lib \
		--includedir=/usr/${_arch}/include \
		--enable-shared \
		--enable-static
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/build-${_arch}"
		make -j1 DESTDIR="$pkgdir" install
		ln -s "/usr/${_arch}/lib/aspell-$_pkgmajorver" "${pkgdir}/usr/${_arch}/lib/aspell"
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
		rm "$pkgdir/usr/${_arch}/share/info/dir"
	done
}
