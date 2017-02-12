# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=dosbox-daum
pkgver=20150125
pkgrel=2
pkgdesc="Emulator with builtin DOS for running DOS Games (Daum version)"
arch=('i686' 'x86_64')
url="http://ykhwong.x-y.net/"
license=('GPL')
depends=('sdl_net' 'zlib' 'sdl_sound-hg' 'libgl' 'libpng' 'alsa-lib' 'gcc-libs'
         'glu' 'intel-tbb' 'sdl-openglhq' 'openglide-cvs')
makedepends=('dos2unix' 'gendesk' 'mesa')

provides=("dosbox")
conflicts=("dosbox")

source=("source-${pkgver}.7z::http://ykhwong.x-y.net/downloads/dosbox/patch/source.7z"
        '0001-fix_missing_stdlib_include.patch'
        '0002-fix_gcc_51_stumbling_over_lambda.patch'
        '0003-intel-tbb-needs-new-cpp-std-and-ld-lookup.patch'
        '0004-fix-64bit-pointersize.patch'
        '0005-fix-MIN.patch'
        '0006-fix-std-pow.patch'
        '0007-fix-wrong-return-value.patch'
				'dosbox.png')
sha256sums=('061336cd3971e37fa0d342c6644e19776a2ddfc20d8f197abca1f8ee27dabea6'
            'cbe78dab758c5ece5616b2456178fe3ebe1429e9796b4088902c6c0856475bf6'
            '49670bccca020004af2fdbd77b98375bef7b9f469bea12c6e173ac6e9646f6e9'
            'c42273cfe631b44a909ed5f444374244d801859a211d53ee842801336c1d4fb0'
            '8125c7fb2f1428e25f4d50a48df16bb5b692286216bfe5a8ef463d15cef25831'
            '224bb0b5b45941baae9ad02cb4da7eef5186d4a05ead4e4b70d4e6b371f73c85'
            'b9165a8f814977ba26938214927c42073d5fcc5d226c1005d525c0eed43d7d32'
            '30144bd197a8e78d68b591ef77cf712e9d96de12e186a06c9e454db9e91c3687'
						'491c42d16fc5ef7ee2eca1b736f7801249d4ca8c0b236a001aec0d3e24504f3b')

prepare(){
	cd "${srcdir}"


	dos2unix autogen.sh
	dos2unix configure.ac
	chmod +x autogen.sh

	patch -p1 -i "$srcdir"/0001-fix_missing_stdlib_include.patch
	patch -p0 -i "$srcdir"/0002-fix_gcc_51_stumbling_over_lambda.patch
	patch -p0 -i "$srcdir"/0003-intel-tbb-needs-new-cpp-std-and-ld-lookup.patch

	if [[ $CARCH == "x86_64" ]]; then
		patch -p0 -i "$srcdir"/0004-fix-64bit-pointersize.patch
	fi

	patch -p0 -i "$srcdir"/0005-fix-MIN.patch
	patch -p1 -i "$srcdir"/0006-fix-std-pow.patch
	patch -p1 -i "$srcdir"/0007-fix-wrong-return-value.patch

	gendesk -f --pkgname "dosbox" --pkgdesc "$pkgdesc"

	mkdir -p include/GL
	cp /usr/include/GL/gl.h include/GL/gl.h
	sed -i 's/ifndef GL_ARB_multitexture/if 0/g' include/GL/gl.h
}

build(){
	cd "${srcdir}"

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc/dosbox

	make
}

package(){
	make DESTDIR="${pkgdir}" install

	install -Dm644 "$srcdir/dosbox.png" \
		"$pkgdir/usr/share/pixmaps/dosbox.png"
	install -Dm644 "$srcdir/dosbox.desktop" \
		"$pkgdir/usr/share/applications/dosbox.desktop"
}
