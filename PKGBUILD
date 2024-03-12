# ET:Legacy is provided as a cross-compiled 32 bit version for compatibility reason with existing 32 bit mods.
# On a 64 bits system, [multilib] must be enabled and multilib-devel installed for 32 bits cross-compilation.
# The engine is dynamically compiled, while the official precompiled mod libraries are provided.

_pkgbase=etlegacy
pkgbase=etlegacy32
pkgname=('etlegacy32' 'etlegacy32-mod')
pkgver=2.82.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.etlegacy.com/"
license=('GPL3' 'custom')
makedepends=('cmake' 'zip')
makedepends_i686=('alsa-lib' 'curl' 'freetype2' 'gcc-libs' 'glew' 'libjpeg-turbo' 'libvorbis' 'sdl2' 'minizip' 'openal' 'libtheora' 'sqlite' 'cjson')
makedepends_x86_64=('lib32-alsa-lib' 'lib32-curl' 'lib32-freetype2' 'lib32-gcc-libs' 'lib32-glew' 'lib32-libjpeg-turbo' 'lib32-libvorbis' 'lib32-sdl2' 'lib32-minizip' 'lib32-openal' 'lib32-libtheora' 'lib32-sqlite' 'lib32-cjson')
source=("https://github.com/etlegacy/etlegacy/archive/v$pkgver.tar.gz"
        "https://www.etlegacy.com/download/file/579")
sha256sums=('c5378180d9ff841959506d9374781a89714b945fb261bf7628ee9803d6b08c2f'
            '9ee1ea256d39f051caf1f0ac81c8aa9b9ebadb421bbd70fb04cc24bbd74416b6')

build() {
    cd "$_pkgbase-$pkgver"

    if [[ "$CARCH" == "i686" ]]; then
        cmakeopts+=(
            '-DCMAKE_LIBRARY_PATH=/usr/lib'
	    '-DCMAKE_PREFIX_PATH=/usr/lib/cmake'
            '-DCROSS_COMPILE32=0'
        )
    else
        cmakeopts+=(
            '-DCMAKE_LIBRARY_PATH=/usr/lib32'
	    '-DCMAKE_PREFIX_PATH=/usr/lib32/cmake'
            '-DCROSS_COMPILE32=1'
        )
    fi

    echo "OPTS" ${cmakeopts[@]}

    cmake . ${cmakeopts[@]} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_DEFAULT_BASEDIR=/usr/lib/etlegacy\
        -DINSTALL_DEFAULT_BINDIR=bin \
        -DINSTALL_DEFAULT_MODDIR=lib/etlegacy \
        -DBUILD_SERVER=1 \
        -DBUILD_CLIENT=1 \
        -DBUILD_MOD=0 \
        -DBUILD_MOD_PK3=0 \
        -DBUNDLED_LIBS=0 \
        -DFEATURE_AUTOUPDATE=0 \
        -DINSTALL_OMNIBOT=0

    make
}

package_etlegacy32() {
    pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit)"
    depends=('etlegacy32-mod')
    depends_i686=('alsa-lib' 'curl' 'freetype2' 'gcc-libs' 'glew' 'libjpeg-turbo' 'libvorbis' 'lua' 'sdl2' 'minizip' 'openal' 'libtheora' 'sqlite' 'cjson')
    depends_x86_64=('lib32-alsa-lib' 'lib32-curl' 'lib32-freetype2' 'lib32-gcc-libs' 'lib32-glew' 'lib32-libjpeg-turbo' 'lib32-libvorbis' 'lib32-lua' 'lib32-sdl2' 'lib32-minizip' 'lib32-openal' 'lib32-libtheora' 'lib32-sqlite' 'lib32-cjson')
    provides=('etlegacy')
    conflicts=('etlegacy')
    backup=('etc/xdg/etlegacy/etmain/etl_server.cfg'
            'etc/xdg/etlegacy/etmain/legacy.cfg'
            'etc/xdg/etlegacy/etmain/campaigncycle.cfg'
            'etc/xdg/etlegacy/etmain/lmscycle.cfg'
            'etc/xdg/etlegacy/etmain/mapvotecycle.cfg'
            'etc/xdg/etlegacy/etmain/objectivecycle.cfg')
    install=etlegacy.install

    cd "$_pkgbase-$pkgver"

    # engine
    make DESTDIR="$pkgdir/" install

    # mod
    rm -rf $pkgdir/usr/lib/$_pkgbase/legacy

    # assets
    ln -s /usr/share/enemy-territory/etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/lib/$_pkgbase/etmain/

    # doc
    mkdir -p $pkgdir/usr/share/doc/$_pkgbase
    install -m 644 docs/game/anticheat.html $pkgdir/usr/share/doc/$_pkgbase/

    # license
    mkdir -p $pkgdir/usr/share/licenses/$_pkgbase

    # systemd
    mkdir -p $pkgdir/etc/xdg/$_pkgbase/etmain
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -m 644 misc/etlegacy.conf $pkgdir/etc/xdg/$_pkgbase/
    install -m 644 misc/etlegacy.service.in $pkgdir/usr/lib/systemd/system/etlegacy-x86.service

    # config
    mv $pkgdir/usr/lib/$_pkgbase/etmain/*.cfg $pkgdir/etc/xdg/$_pkgbase/etmain/
    ln -s /etc/xdg/$_pkgbase/etmain/{etl_server,legacy,{campaign,lms,mapvote,objective}cycle}.cfg $pkgdir/usr/lib/$_pkgbase/etmain/

    # server
    mkdir -p $pkgdir/var/lib/$_pkgbase-server
    ln -s /etc/xdg/$_pkgbase/etmain $pkgdir/var/lib/$_pkgbase-server/
}

package_etlegacy32-mod() {
    pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy mod, 32 bit)"
    depends=('enemy-territory-data' 'geoip-database')
    optdepends=('etlegacy-omnibot: artificial intelligence (AI) controlled opponent'
                'geoip-database: GeoLite country geolocation database')
    provides=('etlegacy-mod')
    conflicts=('etlegacy-mod')

    # mod
    mkdir -p $pkgdir/usr/lib/$_pkgbase/legacy
    install -m 644 $srcdir/etlegacy-v$pkgver-i386/legacy/legacy_v$pkgver.pk3 $pkgdir/usr/lib/$_pkgbase/legacy
    install -m 644 $srcdir/etlegacy-v$pkgver-i386/legacy/qagame.mp.i386.so $pkgdir/usr/lib/$_pkgbase/legacy

    # geoip
    ln -s /usr/share/GeoIP/GeoIP.dat $pkgdir/usr/lib/$_pkgbase/legacy
}

