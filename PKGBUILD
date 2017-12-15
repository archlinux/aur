# ET:Legacy is provided as a cross-compiled 32 bit version for compatibility reason with existing 32 bit mods.
# On a 64 bits system, [multilib] must be enabled and multilib-devel installed for 32 bits cross-compilation.
# The engine is dynamically compiled, while the official precompiled mod libraries are provided.

_pkgbase=etlegacy
pkgbase=etlegacy32
pkgname=('etlegacy32' 'etlegacy32-mod')
pkgver=2.75
pkgrel=3
arch=('i686' 'x86_64')
url="http://www.etlegacy.com/"
license=('GPL3' 'custom')
makedepends=('cmake' 'zip')
makedepends_i686=('alsa-lib' 'curl' 'freetype2' 'gcc-libs' 'glew' 'libjpeg-turbo' 'libvorbis' 'sdl2' 'minizip' 'openal' 'libtheora' 'sqlite')
makedepends_x86_64=('lib32-alsa-lib' 'lib32-curl' 'lib32-freetype2' 'lib32-gcc-libs' 'lib32-glew' 'lib32-libjpeg-turbo' 'lib32-libvorbis' 'lib32-sdl2' 'lib32-minizip' 'lib32-openal' 'lib32-libtheora' 'lib32-sqlite')
source=("https://github.com/etlegacy/etlegacy/archive/v$pkgver.tar.gz"
        "https://www.etlegacy.com/download/file/85")
sha512sums=('c1c5c5a3b06dadb0353d28e2b39d0151655f3ccc5e246759ffa2ca2cbe1ff35ebd1733df4708249e1229144253ff57c07edc825199faeba10db9231edc052587'
            'aecfe31a6bf00980887dc7e9e834cf2635d844ff76212e9c9c756b8df780aff08611d69d3e21ebff225533eb6638b454d0461504efd131c2bf9aec68dacd39b7')

build() {
    cd "$_pkgbase-$pkgver"

    if [[ "$CARCH" == "i686" ]]; then
        cmakeopts+=(
            '-DCMAKE_LIBRARY_PATH=/usr/lib'
            '-DCROSS_COMPILE32=0'
        )
    else
        cmakeopts+=(
            '-DCMAKE_LIBRARY_PATH=/usr/lib32'
            '-DCROSS_COMPILE32=1'
        )
    fi

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
        -DBUILD_PAK3_PK3=0 \
        -DBUNDLED_LIBS=0 \
        -DFEATURE_AUTOUPDATE=0 \
        -DINSTALL_OMNIBOT=0

    make
}

package_etlegacy32() {
    pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit)"
    depends=('etlegacy32-mod')
    depends_i686=('alsa-lib' 'curl' 'freetype2' 'gcc-libs' 'glew' 'libjpeg-turbo' 'libvorbis' 'lua' 'sdl2' 'minizip' 'openal' 'libtheora' 'sqlite')
    depends_x86_64=('lib32-alsa-lib' 'lib32-curl' 'lib32-freetype2' 'lib32-gcc-libs' 'lib32-glew' 'lib32-libjpeg-turbo' 'lib32-libvorbis' 'lib32-lua' 'lib32-sdl2' 'lib32-minizip' 'lib32-openal' 'lib32-libtheora' 'lib32-sqlite')
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
    mv $pkgdir/usr/lib/$_pkgbase/INSTALL.txt $pkgdir/usr/share/doc/$_pkgbase/
    install -m 644 docs/game/anticheat.html $pkgdir/usr/share/doc/$_pkgbase/

    # license
    mkdir -p $pkgdir/usr/share/licenses/$_pkgbase
    mv $pkgdir/usr/lib/$_pkgbase/COPYING.txt $pkgdir/usr/share/licenses/$_pkgbase/

    # systemd
    mkdir -p $pkgdir/etc/xdg/$_pkgbase/etmain
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -m 644 misc/etlegacy.conf $pkgdir/etc/xdg/$_pkgbase/
    install -m 644 misc/etlegacy.service $pkgdir/usr/lib/systemd/system/

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
    install -m 644 $srcdir/etlegacy-v$pkgver-i386/legacy/{etl_bin,pak3}_v$pkgver.pk3 $pkgdir/usr/lib/$_pkgbase/legacy
    install -m 644 $srcdir/etlegacy-v$pkgver-i386/legacy/qagame.mp.i386.so $pkgdir/usr/lib/$_pkgbase/legacy

    # geoip
    ln -s /usr/share/GeoIP/GeoIP.dat $pkgdir/usr/lib/$_pkgbase/legacy
}
