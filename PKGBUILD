# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# music add-on:
# -------------
# Roland SC-55 (sc55): for an authentic gaming experience, as they
#                      were meant to be heard in the 90s (default)
#
# Yamaha YMF262 OPL3 (opl3): for a nostalgic gaming experience

_music='sc55' # (sc55/opl3)

pkgbase=dxx-rebirth-git
pkgname=('d1x-rebirth-git' 'd2x-rebirth-git')
pkgver=0.60.0.beta2.r3132.g5b8dc756f
pkgrel=1
pkgdesc='A source port of the Descent and Descent 2 engines (git version)'
arch=('x86_64')
url='https://www.dxx-rebirth.com/'
license=('GPL-3.0-only' 'LicenseRef-Parallax-License')
depends=('glu' 'libgl' 'libpng' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'physfs')
makedepends=('git' 'scons')
source=('git+https://github.com/dxx-rebirth/dxx-rebirth.git'
        'https://www.dxx-rebirth.com/d1x-rebirth_addons.zip'
        'https://www.dxx-rebirth.com/d2x-rebirth_addons.zip')
sha256sums=('SKIP'
            '68eab65a757c060e4588acd7d1cb72ef96505f5b0c86d27c546a4a7bb6113b97'
            '6b70773148f6241901e1b7831e1044cfb734c53095570c9c96bb994362a6fa6b')

pkgver() {
    git -C dxx-rebirth describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    local -a _common_opts=(
        "$MAKEFLAGS"
        '-Cdxx-rebirth'
        'builddir=./build'
        'prefix=/usr'
        'opengl=yes'
        'sdl2=yes'
        'sdlmixer=yes'
        'ipv6=yes'
        'use_udp=yes'
        'use_tracker=yes'
        'screenshot=png')
    
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
    scons "${_common_opts[@]}" 'd1x=1' 'd2x=0' 'sharepath=/usr/share/d1x-rebirth'
    scons "${_common_opts[@]}" 'd1x=0' 'd2x=1' 'sharepath=/usr/share/d2x-rebirth'
}

package_d1x-rebirth-git() {
    pkgdesc='A source port of the Descent engine (git version)'
    provides=('d1x-rebirth')
    conflicts=('d1x-rebirth')
    
    install -D -m755 dxx-rebirth/build/d1x-rebirth/d1x-rebirth -t "${pkgdir}/usr/bin"
    install -D -m644 'd1x-rebirth addons'/d1xr-hires.dxa -t "${pkgdir}/usr/share/d1x-rebirth"
    install -D -m644 'd1x-rebirth addons'/"d1xr-${_music}-music.dxa" -t "${pkgdir}/usr/share/d1x-rebirth"
    install -D -m644 dxx-rebirth/d1x-rebirth/d1x-rebirth.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 dxx-rebirth/d1x-rebirth/d1x-rebirth.xpm -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 dxx-rebirth/COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_d2x-rebirth-git() {
    pkgdesc='A source port of the Descent 2 engine (git version)'
    provides=('d2x-rebirth')
    conflicts=('d2x-rebirth')
    
    install -D -m755 dxx-rebirth/build/d2x-rebirth/d2x-rebirth -t "${pkgdir}/usr/bin"
    install -D -m644 'd2x-rebirth addons'/"d2xr-${_music}-music.dxa" -t "${pkgdir}/usr/share/d2x-rebirth"
    install -D -m644 dxx-rebirth/d2x-rebirth/d2x-rebirth.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 dxx-rebirth/d2x-rebirth/d2x-rebirth.xpm -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 dxx-rebirth/COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
