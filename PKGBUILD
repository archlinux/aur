# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# The additional field in $pkgver is in the format 'YYYMMDD.HHMMSS', which
# is the the date (in UTC time) of the last git commit from all git sources.
# This additional field allows to trigger an upgrade in the package when any
# mupen64plus component receives a new commit.

pkgname=mupen64plus-git
pkgver=2.5.r477.g138625a.20170819.230455
pkgrel=1
pkgdesc='Nintendo64 Emulator (git version)'
arch=('i686' 'x86_64')
url='http://www.mupen64plus.org/'
license=('GPL')
depends=('speexdsp' 'minizip' 'hicolor-icon-theme' 'sdl2'
         'glu' 'libsamplerate' 'libpng' 'freetype2' 'boost-libs')
makedepends=('git' 'nasm' 'mesa' 'boost')
provides=('mupen64plus')
conflicts=('mupen64plus')
source=('git+https://github.com/mupen64plus/mupen64plus-core.git'
        'git+https://github.com/mupen64plus/mupen64plus-rsp-hle.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-rice.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-glide64mk2.git'
        'git+https://github.com/mupen64plus/mupen64plus-audio-sdl.git'
        'git+https://github.com/mupen64plus/mupen64plus-input-sdl.git'
        'git+https://github.com/mupen64plus/mupen64plus-ui-console.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
_m64p_components='core rsp-hle video-rice video-glide64mk2 audio-sdl input-sdl ui-console'

prepare() {
    # extract install script and remove unecessary 'source' directory references from it
    bsdtar -xf "${srcdir}/mupen64plus-core/tools/m64p_helper_scripts.tar.gz" m64p_install.sh
    sed -i 's/source\///g' m64p_install.sh
}

pkgver() {
    local _date=''
    local _latest_date=''
    
    for _component in $_m64p_components
    do
        cd "${srcdir}/mupen64plus-${_component}"
        _date="$(TZ='UTC' date -d "$(git log -1 --date='short' --pretty='format:%ci')" '+%Y%m%d.%H%M%S')"
        [ "$(vercmp "$_date" "$_latest_date")" -gt '0' ] && _latest_date="$_date"
    done
    
    unset _component
    
    cd "${srcdir}/mupen64plus-core"
    printf "%s.${_latest_date}\n" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
    
}

build() {
    for _component in $_m64p_components
    do
        # fix for 'ui-console' component (it needs to be compiled with -fPIC)
        if [ "$_component" = 'ui-console' ] 
        then
            _target_line="$(sed -n '/^ifeq ($(OS), LINUX)/='   "mupen64plus-${_component}/projects/unix/Makefile")"
            sed -i "$((_target_line + 1))i\  \CFLAGS += -fPIC" "mupen64plus-${_component}/projects/unix/Makefile"
        fi
        
        msg2 "Building component '${_component}'..."
        make -C "mupen64plus-${_component}/projects/unix" clean $@
        make -C "mupen64plus-${_component}/projects/unix" all $@
    done
    
    unset _component
}

package() {
    # set LDCONFIG since we are using fakeroot and scripts run root commands by checking the uid
    ./m64p_install.sh DESTDIR="$pkgdir" PREFIX='/usr' MANDIR='/usr/share/man' LDCONFIG='true'
}
