# Maintainer: Miroslav Koškár <http://mkoskar.com/>

_basename='vcvrack'

pkgname='vcvrack-git'
pkgver=r141.9e5076a
pkgrel=1
pkgdesc='Open-source virtual Eurorack DAW'
url='https://github.com/VCVRack/Rack'
license=(BSD)
arch=(i686 x86_64)
depends=(glew glfw-x11 jansson libsamplerate libcurl-compat libzip portmidi portaudio gtk2)
makedepends=(git)

source=(
    "$_basename::git+https://github.com/VCVRack/Rack.git"
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

pkgver() {
    cd "$_basename"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" \
                    "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_basename"
    git submodule init
    git config submodule.ext/dr_libs.url "$srcdir/dr_libs"
    git config submodule.ext/nanosvg.url "$srcdir/nanosvg"
    git config submodule.ext/nanovg.url "$srcdir/nanovg"
    git config submodule.ext/osdialog.url "$srcdir/osdialog"
    git config submodule.ext/oui-blendish.url "$srcdir/oui-blendish"
    git submodule update
}

build() {
    cd "$_basename"
    make
}

package() {
    cd "$_basename"
    install -D -m755 "$srcdir/vcvrack.sh" "$pkgdir/usr/bin/vcvrack"
    install -D -m644 -t "$pkgdir/usr/share/licenses/$_basename" LICENSE*
    install -D -m755 -t "$pkgdir/opt/$_basename" Rack
    install -d "$pkgdir/opt/$_basename/plugins"
    cp -dr --preserve=mode -t "$pkgdir/opt/$_basename" res
}
