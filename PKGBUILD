# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail MF com>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>
pkgname=mrswatson-git
_reponame=MrsWatson
pkgver=0.9.8.r132.g7108aad
pkgrel=1
pkgdesc="Apply VST to WAV files or convert MIDI files to WAV using VST plugins from the CLI"
arch=('x86_64')
#url="https://github.com/teragonaudio/$_reponame"
url="https://github.com/actionless/$_reponame"
license=('BSD')
depends=(libx11 lib32-libx11 flac lib32-flac audiofile)
makedepends=(gcc lib32-gcc-libs cmake git vst2sdk)
optdepends=('wine: render windows vst plugins')
conflicts=(mrswatson-bin)
source=(
	git+$url
	CMakeLists_vendor_arch.txt
)
sha256sums=('SKIP'
            '600fa7d38fc58239991786b6c78512ad0f00cd0933cde857517c107d6f0dc4a6')

pkgver() {
	cd $srcdir/$_reponame
	set -o pipefail
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo 0.0.1
}

prepare(){
	cd $srcdir/$_reponame
	git submodule sync
	git submodule update --init --recursive
	rm -fr vendor/{flac,flac-config}
	cp $srcdir/CMakeLists_vendor_arch.txt vendor/CMakeLists.txt
	sed -i -e 's/-1 << kScaleBits/-1U << kScaleBits/g' vendor/audiofile/libaudiofile/modules/SimpleModule.h
}

build(){
	cd $srcdir/$_reponame
	mkdir -p build
	cd build
	mkdir -p lib32
	ln -sf /usr/lib32/libX11.so lib32/libx11.so
	ln -sf /usr/lib32/libFLAC.so lib32/libflac32.so
	mkdir -p lib64
	ln -sf /usr/lib/libX11.so lib64/libx11.so
	ln -sf /usr/lib/libFLAC.so lib64/libflac64.so
	ln -sf /usr/lib/libaudiofile.so lib64/libaudiofile64.so
	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-DVERBOSE=TRUE \
		-DX11_X11_LIB=/usr/lib/libX11.so \
		-DX11=/usr/include/X11 \
		-DX11_X11_INCLUDE_PATH=/usr/include/X11 \
		-DX11_Xlib_INCLUDE_PATH=/usr/include/X11 \
		-DWITH_GUI=1 \
		-DWITH_FLAC=1 \
		-DCMAKE_LIBRARY_PATH=/usr/lib \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		"-DCMAKE_C_FLAGS_RELEASE=-O3 -DNDEBUG -fmessage-length=0 -pipe -Werror -Waddress -Wchar-subscripts -Wcomment -Wformat -Wmissing-field-initializers -Wno-trigraphs -Wnonnull -Wparentheses -Wreturn-type -Wsequence-point -Wshadow -Wsign-compare -Wstrict-aliasing -Wstrict-overflow=1 -Wswitch -Wswitch-default -Wtrigraphs -Wuninitialized -Wunused-label -Wunused-value -Wunused-variable -Wvolatile-register-var -Wmaybe-uninitialized -Wenum-compare -Wimplicit-int -Wimplicit-function-declaration -Wmain -Wmissing-braces -Wpointer-sign -std=c99 -Wno-error=uninitialized -Wno-unused-const-variable -Wno-error=unused-const-variable= -Wno-error=sign-compare" \
		"-DCMAKE_CXX_FLAGS_RELEASE=-O3 -DNDEBUG -fmessage-length=0 -pipe -Waddress -Wchar-subscripts -Wcomment -Wformat -Wmissing-field-initializers -Wno-trigraphs -Wnonnull -Wparentheses -Wreturn-type -Wsequence-point -Wshadow -Wsign-compare -Wstrict-aliasing -Wstrict-overflow=1 -Wswitch -Wswitch-default -Wtrigraphs -Wuninitialized -Wunused-label -Wunused-value -Wunused-variable -Wvolatile-register-var -Wmaybe-uninitialized -Wc++11-compat -Wreorder     -I /usr/src/vst2sdk/pluginterfaces/vst2.x/ -Wno-error=deprecated-declarations -Wno-error=maybe-uninitialized  -Wno-error=alloc-size-larger-than=" \
		"-DCMAKE_EXE_LINKER_FLAGS=-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now          -Wl,-z,pack-relative-relocs -flto=auto -L$srcdir/$_reponame/build/lib64 -L$srcdir/$_reponame/build/lib32" \
		..
	make
}

package(){
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/$_reponame
	install -Dm755 bin/Windows/mrswatson.exe $pkgdir/usr/bin/
	install -Dm755 bin/Windows/mrswatson64.exe $pkgdir/usr/bin/
	install -Dm755 build/main/mrswatson $pkgdir/usr/bin/
	install -Dm755 build/main/mrswatson64 $pkgdir/usr/bin/
}
