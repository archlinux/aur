# ET:Legacy should be cross-compiled in 32 bit for compatibility reason with existing 32 bit only mods.
# This package requires multilib-devel and [multilib] enabled
# This package requires 32 bits gfx and sound drivers
# Other optional deps: '(lib32-)ncurses' '(lib32-)jansson'

pkgbase=etlegacy32-git
pkgname=('etlegacy32-git' 'etlegacy32-mod-git')
pkgver=2.75.529.gefdfbdd1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.etlegacy.com/"
license=('GPL3')
makedepends=('git' 'cmake' 'zip')
makedepends_i686=('alsa-lib' 'curl' 'freetype2' 'glew' 'libjpeg-turbo' 'libtheora' 'libvorbis' 'lua' 'minizip' 'openal' 'sdl2' 'sqlite')
makedepends_x86_64=('lib32-alsa-lib' 'lib32-curl' 'lib32-freetype2' 'lib32-glew' 'lib32-libjpeg-turbo' 'lib32-libtheora' 'lib32-libvorbis' 'lib32-lua' 'lib32-minizip' 'lib32-openal' 'lib32-sdl2' 'lib32-sqlite')
options=(!strip)
source=('git://github.com/etlegacy/etlegacy.git')
md5sums=('SKIP')
_gitname=etlegacy

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed -r 's/^v//;s/-/./g;'
}

prepare() {
    # cleanup
    [[ -e "$HOME/.etlegacy/legacy" ]] && cd $HOME/.etlegacy/legacy && rm -f *.so && rm -f *.dat
    cd "$srcdir/$_gitname"
    rm -rf CMakeFiles include legacy glsl
    rm -f etl etlded *.so *.a *.cmake CMakeCache.txt install_manifest.txt
}

build() {
    cd "$srcdir/$_gitname"

    # build type and path
    cmakeopts+=(
        "-D CMAKE_BUILD_TYPE=Debug"
        "-D CMAKE_INSTALL_PREFIX=/usr"
        "-D INSTALL_DEFAULT_BASEDIR=/usr/lib/etlegacy"
        "-D INSTALL_DEFAULT_BINDIR=bin"
        "-D INSTALL_DEFAULT_MODDIR=lib/etlegacy"
    )

    # arch && cross-compilation
    if [[ "$CARCH" == "i686" ]]; then
        cmakeopts+=(
            "-D CMAKE_LIBRARY_PATH=/usr/lib"
            "-D CMAKE_INCLUDE_PATH=/usr/include"
            "-D CROSS_COMPILE32=0"
        )
    else
        cmakeopts+=(
            "-D CMAKE_LIBRARY_PATH=/usr/lib32"
            "-D CMAKE_INCLUDE_PATH=/usr/include"
            "-D CROSS_COMPILE32=1"
        )
    fi

    # options
    cmakeopts+=(
        "-D BUNDLED_LIBS=0"
        "-D FEATURE_AUTOUPDATE=0"
        "-D FEATURE_OMNIBOT=1"
        "-D INSTALL_OMNIBOT=0"
    )

    cmake ${cmakeopts[@]} .
    make
}

package_etlegacy32-git() {
    pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit)"
    depends=('etlegacy32-mod-git')
    depends_i686=('etlegacy32-mod-git' 'alsa-lib' 'curl' 'freetype2' 'gcc-libs' 'glew' 'libjpeg-turbo' 'libtheora' 'libvorbis' 'lua' 'minizip' 'openal' 'sdl2' 'sqlite')
    depends_x86_64=('etlegacy32-mod-git' 'lib32-alsa-lib' 'lib32-curl' 'lib32-freetype2' 'lib32-gcc-libs' 'lib32-glew' 'lib32-libjpeg-turbo' 'lib32-libtheora' 'lib32-libvorbis' 'lib32-lua' 'lib32-minizip' 'lib32-openal' 'lib32-sdl2' 'lib32-sqlite')
    provides=('etlegacy32' 'etlegacy')
    conflicts=('etlegacy32' 'etlegacy')
    backup=('etc/xdg/etlegacy/etmain/etl_server.cfg'
            'etc/xdg/etlegacy/etmain/legacy.cfg'
            'etc/xdg/etlegacy/etmain/campaigncycle.cfg'
            'etc/xdg/etlegacy/etmain/lmscycle.cfg'
            'etc/xdg/etlegacy/etmain/mapvotecycle.cfg'
            'etc/xdg/etlegacy/etmain/objectivecycle.cfg')
    install=etlegacy.install

    cd "$srcdir/$_gitname"

    # engine
    make DESTDIR="$pkgdir/" install

    # mod
    rm -rf $pkgdir/usr/lib/$_gitname/legacy

    # assets
    ln -s /usr/share/enemy-territory/etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/lib/$_gitname/etmain/

    # doc
    mkdir -p $pkgdir/usr/share/doc/$_gitname
    mv $pkgdir/usr/lib/$_gitname/INSTALL.txt $pkgdir/usr/share/doc/$_gitname/
    install -m 644 docs/game/anticheat.html $pkgdir/usr/share/doc/$_gitname/

    # license
    mkdir -p $pkgdir/usr/share/licenses/$_gitname
    mv $pkgdir/usr/lib/$_gitname/COPYING.txt $pkgdir/usr/share/licenses/$_gitname/

    # systemd
    mkdir -p $pkgdir/etc/xdg/$_gitname/etmain
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -m 644 misc/etlegacy.conf $pkgdir/etc/xdg/$_gitname/
    install -m 644 misc/etlegacy.service $pkgdir/usr/lib/systemd/system/

    # config
    mv $pkgdir/usr/lib/$_gitname/etmain/*.cfg $pkgdir/etc/xdg/$_gitname/etmain/
    ln -s /etc/xdg/$_gitname/etmain/{etl_server,legacy,{campaign,lms,mapvote,objective}cycle}.cfg $pkgdir/usr/lib/$_gitname/etmain/

    # server
    mkdir -p $pkgdir/var/lib/$_gitname-server
    ln -s /etc/xdg/$_gitname/etmain $pkgdir/var/lib/$_gitname-server/
}

package_etlegacy32-mod-git() {
    pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy mod, 32 bit)"
    depends=('enemy-territory-data' 'geoip-database')
    optdepends=('etlegacy-omnibot: artificial intelligence (AI) controlled opponent')
    provides=('etlegacy32-mod' 'etlegacy-mod')
    conflicts=('etlegacy32-mod' 'etlegacy-mod')

    cd "$srcdir/$_gitname"

    # mod
    mkdir -p $pkgdir/usr/lib/$_gitname/legacy
    install legacy/{*.pk3,qagame.*.so} -t $pkgdir/usr/lib/$_gitname/legacy

    # geoip
    ln -s /usr/share/GeoIP/GeoIP.dat $pkgdir/usr/lib/$_gitname/legacy
}

# vim:set ts=4 sw=2 et:
