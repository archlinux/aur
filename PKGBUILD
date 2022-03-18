# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Miroslav Koškár

pkgname=vcvrack-git
_branchname=v1
pkgver=1.1.6.r18.ga5fc5891
pkgrel=9
pkgdesc="Open-source virtual Eurorack DAW"
url="https://github.com/VCVRack/Rack"
license=(BSD)
arch=(i686 x86_64 armv7h armv8 riscv32 riscv64)
depends=(glew glfw-x11 jansson libsamplerate curl libzip rtmidi rtaudio gtk2 gtk3 jq)
makedepends=(git unzip wget cmake)
provides=(vcvrack)
conflicts=(vcvrack)
source=(
   "${pkgname%-git}::git+https://github.com/VCVRack/Rack.git#branch=${_branchname}"
    "vcvrack.desktop"
    "vcvrack.sh"
)
sha256sums=('SKIP'
            '6da49236dff903c6d84f74c4fe753125c5884b6119cadbc735b2bd652df39f07'
            '6299d2de5b6c71db5c9e736095bbf141e4f0bc6eb90b4791aa384b3accd59bbd')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    git submodule update --init --recursive
}

build() {
    cd "${pkgname%-git}"
    make dep
    local tag flags
    tag=$(git describe --tags --abbrev=0)
    make VERSION="${tag##v}"
}

package() {
    cd "${pkgname%-git}"
    install -D -m755 "$srcdir/vcvrack.sh" "$pkgdir/usr/bin/vcvrack"
    if [ ${_branchname} == "v2" ]; then
      install -D -m644 -t "$pkgdir/usr/lib" "libRack.so"
    fi
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
