# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Miroslav Koškár

pkgname=vcvrack-git
pkgver=1.1.6.r18.ga5fc5891
pkgrel=5
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
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6299d2de5b6c71db5c9e736095bbf141e4f0bc6eb90b4791aa384b3accd59bbd'
            'a7aa48156543ca6d05def561b6708935d7fd284baff4412716ad7077fb221b6c')

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
    #cp -a ../*.zip dep
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

    install -D -m644 -t "$pkgdir/opt/${pkgname%-git}" Core.json template.vcv

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
