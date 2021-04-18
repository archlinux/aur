# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Miroslav Koškár

pkgname=vcvrack-git
pkgver=1.1.6.r18.ga5fc5891
pkgrel=3
pkgdesc="Open-source virtual Eurorack DAW"
url="https://github.com/VCVRack/Rack"
license=(BSD)
arch=(i686 x86_64)
depends=(glew glfw-x11 jansson libsamplerate curl libzip rtmidi rtaudio gtk2)
makedepends=(git unzip wget cmake)
provides=(vcvrack)
conflicts=(vcvrack)
source=(
    "${pkgname%-git}::git+https://github.com/VCVRack/Rack.git"
    git+https://github.com/memononen/nanovg.git
    git+https://github.com/memononen/nanosvg.git
    git+https://github.com/AndrewBelt/osdialog.git
    git+https://github.com/AndrewBelt/oui-blendish.git
    git+https://github.com/thestk/rtaudio.git
    git+https://github.com/AndrewBelt/glfw.git
    vcvrack.sh
    vcvrack.desktop
    https://github.com/nigels-com/glew/releases/download/glew-2.1.0/glew-2.1.0.tgz
    http://www.digip.org/jansson/releases/jansson-2.12.tar.gz
    https://vcvrack.com/downloads/dep/speexdsp-SpeexDSP-1.2rc3.tgz
    https://www.openssl.org/source/openssl-1.1.1b.tar.gz
    https://curl.haxx.se/download/curl-7.64.1.tar.gz
    https://libzip.org/download/libzip-1.5.2.tar.gz
    https://www.zlib.net/zlib-1.2.11.tar.gz
    http://www.music.mcgill.ca/~gary/rtmidi/release/rtmidi-4.0.0.tar.gz
    https://bitbucket.org/jpommier/pffft/get/2b2bd45bbf9b.zip
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6299d2de5b6c71db5c9e736095bbf141e4f0bc6eb90b4791aa384b3accd59bbd'
            'a7aa48156543ca6d05def561b6708935d7fd284baff4412716ad7077fb221b6c'
            '04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95'
            '5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9'
            'c8dded1454747f65956f981c95e7f89a06abdaa2a53e8aeaa66bab2a3d59cebd'
            '5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b'
            '432d3f466644b9416bc5b649d344116a753aeaa520c8beaf024a90cba9d3d35d'
            'be694a4abb2ffe5ec02074146757c8b56084dbcebf329123c84b205417435e15'
            'c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1'
            '370cfe710f43fbeba8d2b8c8bc310f314338c519c2cf2865e2d2737b251526cd'
            'f21913b96eb0f87839dcb363992cd619e7a9c4333685ad9627bc3da205e36a89')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    git submodule init
    git config submodule.dep/nanovg.url "$srcdir/nanovg"
    git config submodule.dep/nanosvg.url "$srcdir/nanosvg"
    git config submodule.dep/osdialog.url "$srcdir/osdialog"
    git config submodule.dep/oui-blendish.url "$srcdir/oui-blendish"
    git config submodule.dep/rtaudio.url "$srcdir/rtaudio"
    git config submodule.dep/glfw.url "$srcdir/glfw"
    git submodule update
    cp -a ../*.tar.gz dep
    cp -a ../*.zip dep
}

build() {
    cd "${pkgname%-git}"
    make dep
    local tag flags
    tag=$(git describe --tags --abbrev=0)
    export FLAGS=$(pkg-config --cflags-only-I glew glfw3 jansson samplerate libcurl libzip rtmidi rtaudio gtk+-2.0)
    make VERSION="${tag##v}"
}

package() {
    cd "${pkgname%-git}"
    install -D -m755 "$srcdir/vcvrack.sh" "$pkgdir/usr/bin/vcvrack"
    install -D -m644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}" LICENSE*
    install -D -m755 -t "$pkgdir/opt/${pkgname%-git}" Rack
    install -d "$pkgdir/opt/${pkgname%-git}/plugins"

    # headers (required for plugins)
    for _path in {app,dsp,engine,plugin,simd,ui,widget}; do
        install -vDm 644 "include/$_path/"* \
          -t "$pkgdir/usr/include/${pkgname%-git}/$_path/"
    done
    install -vDm 644 include/*.{h,hpp} -t "$pkgdir/usr/include/${pkgname%-git}/"
    install -vDm 644 dep/include/*.h -t "$pkgdir/usr/include/${pkgname%-git}/dep"
    # Makefile snippets required for plugins
    install -vDm 644 {arch,compile,dep,plugin}.mk -t "$pkgdir/usr/share/${pkgname%-git}"

    install -vD -m644 "$srcdir/vcvrack.desktop" -t "$pkgdir/usr/share/applications/"
    cp -dr --preserve=mode -t "$pkgdir/opt/${pkgname%-git}" res
}
