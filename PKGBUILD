# Maintainer: Xavier Moffett (sapphirus at azorium dot net)
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

_pkgbase=ocp
pkgname=('ocp' 'ocp-sdl2')
pkgver=3.0.1
pkgrel=1
pkgdesc="Open Cubic Player"
arch=('i686' 'x86_64')
url="https://stian.cubic.org/project-ocp.php"
license=('GPL')
source=(${_pkgbase}::git+https://github.com/mywave82/opencubicplayer.git#tag=v${pkgver})
sha256sums=('SKIP')
optdepends=('libvorbis: Vorbis codec support'
        'libmad: MPEG codec support'
        'flac: FLAC codec support'
        'libgme: Video game music emulation/playback support')
makedepends=('alsa-lib'
        'cjson'
        'desktop-file-utils'
        'freetype2'
        'flac'
        'git'
        'ncurses'
        'sdl2'
        'xa'
        'libgme'
        'libancient'
        'libdiscid'
        'libmad'
        'libjpeg-turbo'
        'libpng'
        'libvorbis')

prepare() {
        cd $_pkgbase
        git submodule init
        git submodule update --init --recursive
}

build() {
        cd $_pkgbase
        ./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core cross_compiling=yes\
        --without-update-desktop-database\
        --without-update-mime-database\
        --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf\
        --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf\
        --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf
        make DESTDIR="$pkgdir" subdirs ocp ocp.hlp
}

package_ocp-sdl2() {
        provides=(${_pkgbase}=${pkgver})
        conflicts=('ocp' 'ocp-curses')
        install=${_pkgbase}.install
        depends=('alsa-lib'
                'bzip2'
                'cjson'
                'freetype2'
                'hicolor-icon-theme'
                'ncurses'
                'sdl2'
                'shared-mime-info'
                'zlib'
                'libancient'
                'libdiscid'
                'libjpeg-turbo'
                'libpng'
                'ttf-unifont')
        cd $_pkgbase
        ./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core cross_compiling=yes\
        --without-sdl --without-x11\
        --without-update-desktop-database\
        --without-update-mime-database\
        --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf\
        --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf\
        --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf
        make DESTDIR="$pkgdir" libocp.so
        make DESTDIR="$pkgdir" install
}

package_ocp() {
        provides=(${_pkgbase}=${pkgver})
        conflicts=('ocp-curses' 'ocp-sdl2')
        depends=('alsa-lib'
                'bzip2'
                'cjson'
                'ncurses'
                'zlib'
                'libancient'
                'libdiscid')
        cd $_pkgbase
        ./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core\
        --without-x11 --without-sdl --without-sdl2\
        --without-update-desktop-database\
        --without-update-mime-database
        make DESTDIR="$pkgdir" libocp.so
        make DESTDIR="$pkgdir" install
}

# vim:set ts=4 sw=4 et:1
