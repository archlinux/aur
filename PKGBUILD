# Maintainer: John Regan <john@jrjrtech.com>
pkgname=('libvgm-player-git' 'libvgm-emu-git' 'libvgm-utils-git' 'libvgm-audio-git' 'libvgm-common-git' 'vgm2wav-git' 'vgmplayer-git')
pkgbase=libvgm-git
pkgver=r447.dd7acb8
pkgrel=1
pkgdesc="Library for decoding and playing VGM files"
arch=(x86_64 i686)
url="https://github.com/ValleyBell/libvgm"
license=('GPL')
makedepends=('zlib' 'alsa-lib' 'libpulse' 'libao' 'git' 'cmake')

source=('git+https://github.com/ValleyBell/libvgm.git'
'libvgm-fix-strncasecmp.patch')

md5sums=('SKIP'
'e6535e390c4a689744cde3e3286c2355')

pkgver() {
	cd "$srcdir/${pkgbase%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgbase%-git}"
    patch --forward --strip=1 --input="${srcdir}/libvgm-fix-strncasecmp.patch"
}

build() {
	cd "$srcdir/${pkgbase%-git}"
    rm -rf build
    mkdir build
    cd build
    cmake \
      -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-Bsymbolic -Wl,-Bsymbolic-functions" \
      -DCMAKE_MODULE_LINKER_FLAGS="-Wl,-Bsymbolic -Wl,-Bsymbolic-functions" \
      -DLIBRARY_TYPE=SHARED \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_SKIP_BUILD_RPATH=TRUE \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
	make V=1 VERBOSE=1
}

package_libvgm-common-git() {
    pkgdesc="libvgm common headers"
	cd "$srcdir/${pkgbase%-git}/build"
	make DESTDIR="$pkgdir/" install

    rm -rf "$pkgdir/usr/bin"

    rm -rf "$pkgdir/usr/lib/libvgm-audio"*
    rm -rf "$pkgdir/usr/lib/libvgm-emu"*
    rm -rf "$pkgdir/usr/lib/libvgm-player"*
    rm -rf "$pkgdir/usr/lib/libvgm-utils"*

    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-audio.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-emu.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-player.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-utils.pc"

    rm -rf "$pkgdir/usr/include/vgm/audio"
    rm -rf "$pkgdir/usr/include/vgm/emu"
    rm -rf "$pkgdir/usr/include/vgm/player"
    rm -rf "$pkgdir/usr/include/vgm/utils"
}

package_libvgm-audio-git() {
    pkgdesc="libvgm audio playing library"
    depends=('libvgm-common-git' 'alsa-lib' 'libpulse' 'libao')
	cd "$srcdir/${pkgbase%-git}/build"
	make DESTDIR="$pkgdir/" install

    rm -rf "$pkgdir/usr/bin"
    rm -rf "$pkgdir/usr/lib/libvgm-emu"*
    rm -rf "$pkgdir/usr/lib/libvgm-player"*
    rm -rf "$pkgdir/usr/lib/libvgm-utils"*

    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-emu.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-player.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-utils.pc"

    rm -rf "$pkgdir/usr/include/vgm/emu"
    rm -rf "$pkgdir/usr/include/vgm/player"
    rm -rf "$pkgdir/usr/include/vgm/utils"
    rm -rf "$pkgdir/usr/lib/cmake"

    rm "$pkgdir/usr/include/vgm/common_def.h"
    rm "$pkgdir/usr/include/vgm/stdbool.h"
    rm "$pkgdir/usr/include/vgm/stdtype.h"

}

package_libvgm-emu-git() {
    pkgdesc="libvgm emulation library"
    depends=('libvgm-common-git')
	cd "$srcdir/${pkgbase%-git}/build"
	make DESTDIR="$pkgdir/" install

    rm -rf "$pkgdir/usr/bin"
    rm -rf "$pkgdir/usr/lib/libvgm-audio"*
    rm -rf "$pkgdir/usr/lib/libvgm-player"*
    rm -rf "$pkgdir/usr/lib/libvgm-utils"*

    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-audio.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-player.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-utils.pc"

    rm -rf "$pkgdir/usr/include/vgm/audio"
    rm -rf "$pkgdir/usr/include/vgm/player"
    rm -rf "$pkgdir/usr/include/vgm/utils"
    rm -rf "$pkgdir/usr/lib/cmake"

    rm "$pkgdir/usr/include/vgm/common_def.h"
    rm "$pkgdir/usr/include/vgm/stdbool.h"
    rm "$pkgdir/usr/include/vgm/stdtype.h"
}

package_libvgm-player-git() {
    pkgdesc="libvgm player library"
    depends=('libvgm-common-git' 'libvgm-emu-git' 'libvgm-utils-git')
	cd "$srcdir/${pkgbase%-git}/build"
	make DESTDIR="$pkgdir/" install

    rm -rf "$pkgdir/usr/bin"
    rm -rf "$pkgdir/usr/lib/libvgm-audio"*
    rm -rf "$pkgdir/usr/lib/libvgm-emu"*
    rm -rf "$pkgdir/usr/lib/libvgm-utils"*

    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-audio.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-emu.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-utils.pc"

    rm -rf "$pkgdir/usr/include/vgm/audio"
    rm -rf "$pkgdir/usr/include/vgm/emu"
    rm -rf "$pkgdir/usr/include/vgm/utils"
    rm -rf "$pkgdir/usr/lib/cmake"

    rm "$pkgdir/usr/include/vgm/common_def.h"
    rm "$pkgdir/usr/include/vgm/stdbool.h"
    rm "$pkgdir/usr/include/vgm/stdtype.h"
}

package_libvgm-utils-git() {
    pkgdesc="libvgm utility library"
    depends=('libvgm-common-git' 'zlib')
	cd "$srcdir/${pkgbase%-git}/build"
	make DESTDIR="$pkgdir/" install

    rm -rf "$pkgdir/usr/bin"
    rm -rf "$pkgdir/usr/lib/libvgm-audio"*
    rm -rf "$pkgdir/usr/lib/libvgm-emu"*
    rm -rf "$pkgdir/usr/lib/libvgm-player"*

    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-audio.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-emu.pc"
    rm -rf "$pkgdir/usr/lib/pkgconfig/vgm-player.pc"

    rm -rf "$pkgdir/usr/include/vgm/audio"
    rm -rf "$pkgdir/usr/include/vgm/emu"
    rm -rf "$pkgdir/usr/include/vgm/player"
    rm -rf "$pkgdir/usr/lib/cmake"

    rm "$pkgdir/usr/include/vgm/common_def.h"
    rm "$pkgdir/usr/include/vgm/stdbool.h"
    rm "$pkgdir/usr/include/vgm/stdtype.h"
}

package_vgm2wav-git() {
    pkgdesc="VGM to WAVE utility"
    depends=('libvgm-utils-git' 'libvgm-player-git')
	cd "$srcdir/${pkgbase%-git}/build"
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 bin/vgm2wav "$pkgdir/usr/bin/vgm2wav"
}

package_vgmplayer-git() {
    pkgdesc="Interactive VGM player"
    depends=('libvgm-utils-git' 'libvgm-player-git' 'libvgm-audio-git')
	cd "$srcdir/${pkgbase%-git}/build"
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 bin/player "$pkgdir/usr/bin/vgmplayer"
}
