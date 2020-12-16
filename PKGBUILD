# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=m64p
pkgver=20201215
pkgrel=1
pkgdesc='Mupen64Plus with custom plugins and Qt5 GUI'
arch=('x86_64')
url='https://m64p.github.io/'
license=('GPL3')
depends=('freetype2' 'hidapi' 'libgl' 'libpng' 'libsamplerate' 'minizip'
         'qt5-base' 'qt5-websockets' 'sdl2' 'sdl2_net' 'zlib' 'hicolor-icon-theme')
optdepends=('p7zip: for 7z/zip support')
makedepends=('git' 'cmake' 'nasm' 'python' 'zip' 'icoutils')
provides=('mupen64plus-gui' 'mupen64plus-video-gliden64')
conflicts=('mupen64plus-gui' 'mupen64plus-video-gliden64' 'mupen64plus')
_commit=da3fc8ee7d67a9f566ac9de438f56b94648de509
source=("git+https://github.com/loganmc10/m64p.git#commit=${_commit}"
        '010-m64p-remove-build-jobs-limitation.patch'
        '020-m64p-enable-optimizations.patch'
        '030-m64p-fix-paths.patch'
        '040-m64p-add-pie.patch'
        'm64p.desktop')
sha256sums=('SKIP'
            '4c483f9bf3230171c433d7f8310881babbd02416ce16079e85fd0ef254442d57'
            'a35c7370d4545356cfcc9b10ad84250685510744911fde8910ecd224da046711'
            'fe5d5e200f7c2fa5146b56346bd57d95c440e36569608ab0738700b0f57935cc'
            '3445f28451478a6b670d7193bd7a9607e51544438ac9b302228d3d343fec4476'
            '8df4e8076d28a1bc44f41b0129a9935da9839e8a8cb9944206757e47da561808')

prepare() {
    icotool -x m64p/mupen64plus-gui/mupen64plus.ico -o m64p/mupen64plus-gui
    patch -d m64p -Np1 -i "${srcdir}/010-m64p-remove-build-jobs-limitation.patch"
    patch -d m64p -Np1 -i "${srcdir}/020-m64p-enable-optimizations.patch"
    patch -d m64p -Np1 -i "${srcdir}/030-m64p-fix-paths.patch"
    patch -d m64p -Np1 -i "${srcdir}/040-m64p-add-pie.patch"
}

build() {
    cd m64p
    ./build.sh
}

package() {
    # mupen64plus-gui
    local _file
    local _res
    install -D -m755 m64p/mupen64plus/mupen64plus-gui -t "${pkgdir}/usr/bin"
    install -D -m644 m64p.desktop -t "${pkgdir}/usr/share/applications"
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/mupen64plus.png"
    done < <(find m64p/mupen64plus-gui -maxdepth 1 -type f -name 'mupen64plus_*_*x*x*.png' -print0)
    
    # mupen64plus components
    local _component
    local _sover
    for _component in core audio-sdl2 input-raphnetraw rsp-hle
    do
        make -C "m64p/mupen64plus-${_component}/projects/unix" DESTDIR="$pkgdir" PREFIX='/usr' LDCONFIG='true' OSD='0' install
    done
    _sover="$(find "${pkgdir}/usr/lib" -type f -name 'libmupen64plus.so.*.*.*' | sed 's/^.*\.so\.//')"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
    
    # other plugins and components
    install -D -m644 m64p/mupen64plus/libdiscord_game_sdk.so -t "${pkgdir}/usr/lib"
    install -D -m644 m64p/mupen64plus/mupen64plus-input-qt.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-rsp-parallel.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-video-angrylion-plus.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-video-GLideN64.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/GLideN64.custom.ini -t "${pkgdir}/usr/share/mupen64plus"
}
