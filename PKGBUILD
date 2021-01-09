# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# The additional field in $pkgver is in the format 'YYYMMDD.HHMMSS', which
# is the the date (in UTC time) of the last git commit from all git sources.
# This additional field allows to trigger an upgrade in the package when any
# mupen64plus component receives a new commit.

pkgname=mupen64plus-git
pkgver=2.5.9.r164.gaf812317.20210102.183932
pkgrel=1
pkgdesc='Nintendo64 Emulator (git version)'
arch=('x86_64')
url='https://www.mupen64plus.org/'
license=('GPL')
depends=('boost-libs' 'freetype2' 'glu' 'libgl' 'libpng' 'libsamplerate'
         'minizip' 'sdl2' 'speexdsp' 'zlib' 'hicolor-icon-theme')
makedepends=('git' 'nasm' 'boost' 'mesa')
provides=('mupen64plus')
conflicts=('mupen64plus')
source=('git+https://github.com/mupen64plus/mupen64plus-core.git'
        'git+https://github.com/mupen64plus/mupen64plus-rsp-hle.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-rice.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-glide64mk2.git'
        'git+https://github.com/mupen64plus/mupen64plus-audio-sdl.git'
        'git+https://github.com/mupen64plus/mupen64plus-input-sdl.git'
        'git+https://github.com/mupen64plus/mupen64plus-ui-console.git'
        '010-mupen64plus-git-install-fix.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '57d44edf46bafc6dbdf82e6db204c50bac1c2ea5c07aef7d3f84818f87e671a5')

_m64p_components='core rsp-hle video-rice video-glide64mk2 audio-sdl input-sdl ui-console'

prepare() {
    # extract install script
    bsdtar -xf "${srcdir}/mupen64plus-core/tools/m64p_helper_scripts.tar.gz" m64p_install.sh
    
    # remove uneedeed 'source' directory references from install script
    patch -Np1 -i 010-mupen64plus-git-install-fix.patch
}

pkgver() {
    local _component
    local _date
    local _latest_date
    
    for _component in $_m64p_components
    do
        cd "${srcdir}/mupen64plus-${_component}"
        _date="$(TZ='UTC' date -d "$(git log -1 --date='short' --pretty='format:%ci')" '+%Y%m%d.%H%M%S')"
        [ "$(vercmp "$_date" "$_latest_date")" -gt '0' ] && _latest_date="$_date"
    done
    
    cd "${srcdir}/mupen64plus-core"
    printf "%s.${_latest_date}\n" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
    
}

build() {
    local _component
    for _component in $_m64p_components
    do
        printf '%s\n' "  -> Building component '${_component}'..."
        make -C "mupen64plus-${_component}/projects/unix" clean
        make -C "mupen64plus-${_component}/projects/unix" PREFIX='/usr' all
    done
}

package() {
    # set LDCONFIG since we are using fakeroot and scripts run root commands by checking the uid
    ./m64p_install.sh DESTDIR="$pkgdir" PREFIX='/usr' LDCONFIG='true'
    
    local _sover
    _sover="$(find mupen64plus-core/projects/unix -type f -name 'libmupen64plus.so.*.*' | sed 's/^.*\.so\.//')"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
}
