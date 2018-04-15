# Maintainer: Miroslav Koškár <http://mkoskar.com/>

pkgname='vcvrack'
pkgver=0.6.0
pkgrel=1
pkgdesc='Open-source virtual modular synthesizer'
url='https://vcvrack.com/'
license=(BSD)
arch=(i686 x86_64)
depends=(curl glew gtk2 jansson libzip openssl rtmidi speexdsp
    libxi libxrandr libxinerama libxcursor libgl
    jack libpulse)
makedepends=(git cmake mesa)

source=(
    "$pkgname::git+https://github.com/VCVRack/Rack.git#tag=v$pkgver"
    git+https://github.com/AndrewBelt/osdialog.git
    git+https://github.com/AndrewBelt/oui-blendish.git
    git+https://github.com/glfw/glfw.git
    git+https://github.com/memononen/nanosvg.git
    git+https://github.com/memononen/nanovg.git
    git+https://github.com/thestk/rtaudio.git
    vcvrack.sh
)
sha256sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    ed2da5d924a381cd50125db199578c15bc95c18be716abbd3ff310bbcf6773c0
)

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.ext/glfw.url "$srcdir/glfw"
    git config submodule.ext/nanosvg.url "$srcdir/nanosvg"
    git config submodule.ext/nanovg.url "$srcdir/nanovg"
    git config submodule.ext/osdialog.url "$srcdir/osdialog"
    git config submodule.ext/oui-blendish.url "$srcdir/oui-blendish"
    git config submodule.ext/rtaudio.url "$srcdir/rtaudio"
    git submodule update
}

build() {
    cd "$pkgname"
    make -C dep RTAUDIO_ALL_APIS=1 \
        lib/libglfw.so lib/librtaudio.so \
        include/blendish.h include/nanosvg.h \
        include/nanovg.h include/osdialog.h
    local CFLAGS
    CFLAGS=$(pkg-config --cflags glew jansson libcurl libzip openssl rtmidi speexdsp)
    sed -i '/\t$(MAKE) -C dep/d' Makefile
    CFLAGS="$CFLAGS" make RELEASE=1
}

package() {
    cd "$pkgname"
    install -D -m755 "$srcdir/vcvrack.sh" "$pkgdir/usr/bin/vcvrack"
    install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
    install -D -m755 -t "$pkgdir/opt/$pkgname" Rack
    install -D -m755 -t "$pkgdir/opt/$pkgname/lib" dep/lib/lib*
    cp -dr --preserve=mode -t "$pkgdir/opt/$pkgname" dep/include
    cp -dr --preserve=mode -t "$pkgdir/opt/$pkgname" res
}
