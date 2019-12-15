# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# music add-on:
# -------------
# Roland SC-55 (sc55): for an authentic gaming experience, as they
#                      were meant to be heard in the 90s (default)
#
# Yamaha YMF262 OPL3 (opl3): for a nostalgic gaming experience

_music='sc55' # (sc55/opl3) - update checksums if you change

pkgbase=dxx-rebirth-git
pkgname=('d1x-rebirth-git' 'd2x-rebirth-git')
pkgver=0.60.0.beta2.r575.gca383c1fe
pkgrel=1
pkgdesc='A source port of the Descent and Descent 2 engines (git version)'
arch=('x86_64')
url='https://www.dxx-rebirth.com/'
license=('GPL3' 'custom:Parallax')
depends=('glu' 'libgl' 'libpng' 'sdl' 'sdl_mixer' 'physfs')
makedepends=('git' 'scons')
source=('git+https://github.com/dxx-rebirth/dxx-rebirth.git'
        'https://www.dxx-rebirth.com/download/dxx/res/d1xr-hires.dxa'
        "https://www.dxx-rebirth.com/download/dxx/res/d1xr-${_music}-music.dxa"
        "https://www.dxx-rebirth.com/download/dxx/res/d2xr-${_music}-music.dxa")
noextract=('d1xr-hires.dxa'
           "d1xr-${_music}-music.dxa"
           "d2xr-${_music}-music.dxa")
sha256sums=('SKIP'
            'b30a164fa9c6dff05eda6d50f777777df843968d32053f5cc9453fe89d5bed19'
            'b27f7b9dc5f9c2744402c56c9499dfd9503c17e73a2a5223e745529d7867962f'
            'ace152182c70b9a7ae6f911bddbc239566220a287ab5419cab260d5af739bf16')

pkgver() {
    cd dxx-rebirth
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    local -a _common_opts=(
        "$MAKEFLAGS"
        'lto=1'
        'sdlmixer=1'
        'builddir=./build'
        'prefix=/usr'
        'opengl=yes'
        'sdlmixer=yes'
        'ipv6=yes'
        'use_udp=yes'
        'use_tracker=yes'
        'screenshot=png')
    
    cd dxx-rebirth
    scons "${_common_opts[@]}" 'd1x=1' 'd2x=0' 'sharepath=/usr/share/d1x-rebirth'
    scons "${_common_opts[@]}" 'd1x=0' 'd2x=1' 'sharepath=/usr/share/d2x-rebirth'
}

package_d1x-rebirth-git() {
    pkgdesc='A source port of the Descent engine (git version)'
    provides=('d1x-rebirth')
    conflicts=('d1x-rebirth')
    
    # binary executable
    install -D -m755 dxx-rebirth/build/d1x-rebirth/d1x-rebirth -t "${pkgdir}/usr/bin"
    
    # add-ons
    install -D -m644  d1xr-hires.dxa            -t "${pkgdir}/usr/share/d1x-rebirth"
    install -D -m644 "d1xr-${_music}-music.dxa" -t "${pkgdir}/usr/share/d1x-rebirth"
    
    # desktop file
    install -D -m644 dxx-rebirth/d1x-rebirth/d1x-rebirth.desktop -t "${pkgdir}/usr/share/applications"
    
    # icon
    install -D -m644 dxx-rebirth/d1x-rebirth/d1x-rebirth.xpm -t "${pkgdir}/usr/share/pixmaps"
    
    # license
    install -D -m644 dxx-rebirth/COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_d2x-rebirth-git() {
    pkgdesc='A source port of the Descent 2 engine (git version)'
    provides=('d2x-rebirth')
    conflicts=('d2x-rebirth')
    
    # binary executable
    install -D -m755 dxx-rebirth/build/d2x-rebirth/d2x-rebirth -t "${pkgdir}/usr/bin"
    
    # add-on
    install -D -m644 "d2xr-${_music}-music.dxa" -t "${pkgdir}/usr/share/d2x-rebirth"
    
    # desktop file
    install -D -m644 dxx-rebirth/d2x-rebirth/d2x-rebirth.desktop -t "${pkgdir}/usr/share/applications"
    
    # icon
    install -D -m644 dxx-rebirth/d2x-rebirth/d2x-rebirth.xpm -t "${pkgdir}/usr/share/pixmaps"
    
    # license
    install -D -m644 dxx-rebirth/COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
