# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# The additional field in $pkgver is in the format 'YYYMMDD.HHMMSS', which
# is the the date (in UTC time) of the last git commit from all git sources.
# This additional field allows to trigger an upgrade in the package when any
# mupen64plus component receives a new commit.

pkgname=mupen64plus-git
pkgver=2.5.9.r8.gb4566a65.20190318.054142
pkgrel=1
pkgdesc='Nintendo64 Emulator (git version)'
arch=('i686' 'x86_64')
url='https://www.mupen64plus.org/'
license=('GPL')
depends=('speexdsp' 'minizip' 'sdl2' 'glu' 'libsamplerate' 'libpng'
         'freetype2' 'boost-libs' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'nasm' 'mesa' 'boost')
provides=('mupen64plus')
conflicts=('mupen64plus')
source=('git+https://github.com/mupen64plus/mupen64plus-core.git'
        'git+https://github.com/mupen64plus/mupen64plus-rsp-hle.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-rice.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-glide64mk2.git'
        'git+https://github.com/mupen64plus/mupen64plus-audio-sdl.git'
        'git+https://github.com/mupen64plus/mupen64plus-input-sdl.git'
        'git+https://github.com/mupen64plus/mupen64plus-ui-console.git'
        'mupen64plus-git-install-fix.patch'
        'mupen64plus-git-core-exe-stack.patch'
        'mupen64plus-git-ui-console-pie.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'd45208a1d9e5a08e6711739c9f52bd88ff016fa5c382a85f305cd4b69dbf62d1'
            'a0e0d8cec5bb22e6e5f0e75dde970562bdc7ac94190d66a4cdeea769ac44c77f'
            'e0e6b47aa5ea7b72f2bd5d5ad5e42fee870d947177f2b7e0137b6a93540b894d')

_m64p_components='core rsp-hle video-rice video-glide64mk2 audio-sdl input-sdl ui-console'

prepare() {
    # extract install script
    bsdtar -xf "${srcdir}/mupen64plus-core/tools/m64p_helper_scripts.tar.gz" m64p_install.sh
    
    # remove uneedeed 'source' directory references from install script
    patch -Np1 -i mupen64plus-git-install-fix.patch
    
    # remove executable stack from core library
    patch -Np1 -i mupen64plus-git-core-exe-stack.patch
    
    # enable PIE for ui-console interface
    patch -Np1 -i mupen64plus-git-ui-console-pie.patch
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
        make -C "mupen64plus-${_component}/projects/unix" clean $@
        make -C "mupen64plus-${_component}/projects/unix" PREFIX='/usr' all $@
    done
}

package() {
    # set LDCONFIG since we are using fakeroot and scripts run root commands by checking the uid
    ./m64p_install.sh DESTDIR="$pkgdir" PREFIX='/usr' MANDIR='/usr/share/man' LDCONFIG='true'
}
