# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=mupen64plus-extraplugins-git
pkgver=20170624.193503
pkgrel=1
pkgdesc='Additional plugins for Mupen64Plus (git version)'
arch=('i686' 'x86_64')
url='http://www.mupen64plus.org/'
license=('GPL' 'CC0-1.0')
depends=('mupen64plus' 'sdl2' 'glew')
makedepends=('git')
provides=('mupen64plus-extraplugins')
conflicts=('mupen64plus-extraplugins')
source=('git+https://github.com/mupen64plus/mupen64plus-rsp-z64.git'
        'git+https://github.com/mupen64plus/mupen64plus-rsp-cxd4.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-arachnoid.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-z64.git'
        'git+https://github.com/mupen64plus/mupen64plus-video-glide64.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
_m64p_plugins='rsp-z64 rsp-cxd4 video-arachnoid video-z64 video-glide64'

prepare() {
    # patch min/max macros
    cd "$srcdir/mupen64plus-video-glide64/src"
    sed -i *.cpp *.h \
        -e 's|min[[:blank:]]*(|glide_min(|g' \
        -e 's|max[[:blank:]]*(|glide_max(|g'
}

pkgver() {
    local _date=''
    local _latest_date=''
    
    for _plugin in $_m64p_plugins
    do
        cd "${srcdir}/mupen64plus-${_plugin}"
        _date="$(TZ='UTC' date -d "$(git log -1 --date='short' --pretty='format:%ci')" '+%Y%m%d.%H%M%S')"
        [ "$(vercmp "$_date" "$_latest_date")" -gt '0' ] && _latest_date="$_date"
    done
    
    unset _plugin
    
    printf '%s\n' "${_latest_date}"
}

build() {
    for _plugin in $_m64p_plugins
    do
        msg2 "Building plugin '${_plugin}'..."
        make -C "mupen64plus-${_plugin}/projects/unix" clean $@
        make -C "mupen64plus-${_plugin}/projects/unix" all $@
    done
    
    unset _plugin
}

package() {
    for _plugin in $_m64p_plugins
    do
        printf '%s\n' "************************************ Installing ${_plugin} plugin"
        make -C "mupen64plus-${_plugin}/projects/unix" PREFIX='/usr' DESTDIR="$pkgdir" LDCONFIG='true' install $@
    done
    
    unset _plugin
}
