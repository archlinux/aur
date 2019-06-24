# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>

pkgname='vcvrack'
pkgver=1.0.0
pkgrel=1
pkgdesc='Open-source virtual modular synthesizer'
url='https://vcvrack.com/'
license=(BSD)
arch=(i686 x86_64)
provides=(vcvrack-fundamental)
conflicts=(vcvrack-fundamental)
depends=(curl glew gtk2 jansson libzip openssl rtmidi speexdsp
    libxi libxrandr libxinerama libxcursor libgl
    jack libpulse)
makedepends=(git cmake mesa zip)

source=(
    "$pkgname::git+https://github.com/VCVRack/Rack.git#tag=v$pkgver"
    "fundamental::git+https://github.com/VCVRack/Fundamental.git"
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
    SKIP
    ed2da5d924a381cd50125db199578c15bc95c18be716abbd3ff310bbcf6773c0
)

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.ext/glfw.url "$srcdir/glfw"
    git config submodule.ext/nanosvg.url "$srcdir/nanosvg"
    git config submodule.ext/nanovg.url "$srcdir/nanovg"
    git config submodule.ext/osdialog.url "$srcdir/osdialog"
    git config submodule.ext/oui-blendish.url "$srcdir/oui-blendish"
    git config submodule.ext/rtaudio.url "$srcdir/rtaudio"
    git submodule update

    cd "$srcdir/$pkgname/plugins"
    git clone "$srcdir/fundamental" "Fundamental"
}

build() {
    cd "$srcdir/$pkgname"
    make dep
    CFLAGS="$CFLAGS $(pkg-config --cflags glew jansson libcurl libzip openssl rtmidi speexdsp)" make RELEASE=1
    
    cd "$srcdir/$pkgname/plugins/Fundamental"
    RACK_DIR="$srcdir/$pkgname" make dep
    RACK_DIR="$srcdir/$pkgname" make dist
}

package() {
    cd "$srcdir/$pkgname"
    install -D -m755 "$srcdir/vcvrack.sh" "$pkgdir/usr/bin/vcvrack"
    install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
    install -D -m755 -t "$pkgdir/opt/$pkgname" Rack
    install -D -m755 -t "$pkgdir/opt/$pkgname/lib" dep/lib/lib*
    install -D -m644 -t "$pkgdir/opt/$pkgname" Core.json
    cp -dr --preserve=mode -t "$pkgdir/opt/$pkgname" dep/include
    cp -dr --preserve=mode -t "$pkgdir/opt/$pkgname" res

    cd "$srcdir/$pkgname/plugins/Fundamental"
    install -D -m644 dist/Fundamental-*-lin.zip "$pkgdir/opt/vcvrack/Fundamental.zip"
}
