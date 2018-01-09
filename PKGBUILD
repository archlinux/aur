# Maintainer: Miroslav Koškár <http://mkoskar.com/>

pkgname='vcvrack'
pkgver=0.5.1
pkgrel=1
pkgdesc='Open-source virtual modular synthesizer'
url='https://vcvrack.com/'
license=(BSD)
arch=(i686 x86_64)
depends=(glew glfw-x11 jansson libsamplerate openssl curl libzip rtmidi rtaudio gtk2)
makedepends=(git)

source=(
    "$pkgname::git+https://github.com/VCVRack/Rack.git#tag=v$pkgver"
    git+https://github.com/AndrewBelt/osdialog.git
    git+https://github.com/AndrewBelt/oui-blendish.git
    git+https://github.com/mackron/dr_libs.git
    git+https://github.com/memononen/nanosvg.git
    git+https://github.com/memononen/nanovg.git
    vcvrack.sh
)
sha256sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    69736bbb5f49f9ce451c1311ec4399f4f59a86056233f151b9457116089a502d
)

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.ext/dr_libs.url "$srcdir/dr_libs"
    git config submodule.ext/nanosvg.url "$srcdir/nanosvg"
    git config submodule.ext/nanovg.url "$srcdir/nanovg"
    git config submodule.ext/osdialog.url "$srcdir/osdialog"
    git config submodule.ext/oui-blendish.url "$srcdir/oui-blendish"
    git submodule update
}

build() {
    cd "$pkgname"
    local FLAGS
    FLAGS=$(pkg-config --cflags glew glfw3 jansson samplerate openssl \
        libcurl libzip rtmidi rtaudio)
    FLAGS="$FLAGS" VERSION="$pkgver" make
}

package() {
    cd "$pkgname"
    install -D -m755 "$srcdir/vcvrack.sh" "$pkgdir/usr/bin/vcvrack"
    install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
    install -D -m755 -t "$pkgdir/opt/$pkgname" Rack
    install -d "$pkgdir/opt/$pkgname/plugins"
    cp -dr --preserve=mode -t "$pkgdir/opt/$pkgname" res
}
