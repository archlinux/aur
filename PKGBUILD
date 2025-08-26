# Full 64 bit ET:Legacy clients can only connect to ET:Legacy servers running mods providing a 64 bit version.
# If you want to connect to existing 32 bit only mods, install the cross-compiled "etlegacy32" package instead.
# The engine is dynamically compiled, while the official precompiled mod libraries are provided.

_pkgbase=etlegacy
pkgbase=etlegacy
pkgname=('etlegacy' 'etlegacy-mod')
pkgver=2.83.2
_binaryversion=700
pkgrel=4
arch=('x86_64' 'aarch64')
url="http://www.etlegacy.com/"
license=('GPL3' 'custom')
makedepends=('cmake' 'zip' 'alsa-lib' 'curl' 'freetype2' 'gcc-libs' 'glew' 'libjpeg-turbo' 'libvorbis' 'libtheora' 'minizip' 'openal>=1.14' 'sdl2' 'cjson')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/etlegacy/$_pkgbase/archive/v$pkgver.tar.gz"
        "${_pkgbase}-${pkgver}-${arch}-binary.tar.gz::http://www.etlegacy.com/download/file/${_binaryversion}")
#noextract=("etl_bin_v$pkgver.pk3" "pak3_v$pkgver.pk3")
sha256sums=('cf84afa485b4d3ae32b638672678cb19ec4dd1ce8df0fbe10af540bc565e16ba'
            'd97b2a4be89b59924044d43e9391686b1b18919e32f97248d1b412235530ee67')

build() {
    cd "$_pkgbase-$pkgver"

    export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security \
        -fstack-clash-protection -fcf-protection \
        -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
    export CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"

    cmake . ${cmakeopts[@]} \
        -DCMAKE_LIBRARY_PATH=/usr/lib \
        -DCROSS_COMPILE32=0 \
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

package_etlegacy() {
    pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine)"
    depends=('etlegacy-mod' 'alsa-lib' 'curl' 'freetype2' 'gcc-libs' 'glew' 'libjpeg-turbo' 'libvorbis' 'lua' 'minizip' 'openal' 'sdl2')
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
    install -m 644 VERSION.txt $pkgdir/usr/share/doc/$_pkgbase/
    install -m 644 *.md $pkgdir/usr/share/doc/$_pkgbase/
    install -m 644 docs/game/anticheat.html $pkgdir/usr/share/doc/$_pkgbase/

    # license
    mkdir -p $pkgdir/usr/share/licenses/$_pkgbase
    install -m 644 COPYING.txt $pkgdir/usr/share/licenses/$_pkgbase/LICENSE

    # systemd
    mkdir -p $pkgdir/etc/xdg/$_pkgbase/etmain
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -m 644 misc/etlegacy.conf $pkgdir/etc/xdg/$_pkgbase/
    install -m 644 misc/etlegacy.x86_64.service $pkgdir/usr/lib/systemd/system/etlegacy.service

    # config
    mv $pkgdir/usr/lib/$_pkgbase/etmain/*.cfg $pkgdir/etc/xdg/$_pkgbase/etmain/
    ln -s /etc/xdg/$_pkgbase/etmain/{etl_server,legacy,{campaign,lms,mapvote,objective}cycle}.cfg $pkgdir/usr/lib/$_pkgbase/etmain/

    # server
    mkdir -p $pkgdir/var/lib/$_pkgbase-server
    ln -s /etc/xdg/$_pkgbase/etmain $pkgdir/var/lib/$_pkgbase-server/
}

package_etlegacy-mod() {
    pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy mod)"
    depends=('enemy-territory-data' 'geoip-database')
    optdepends=('etlegacy-omnibot: artificial intelligence (AI) controlled opponent'
                'geoip-database: GeoLite country geolocation database')

    # mod
    mkdir -p $pkgdir/usr/lib/$_pkgbase/legacy
    install -m 644 $srcdir/etlegacy-v$pkgver-x86_64/legacy/legacy_v$pkgver.pk3 $pkgdir/usr/lib/$_pkgbase/legacy
    install -m 644 $srcdir/etlegacy-v$pkgver-x86_64/legacy/qagame.mp.x86_64.so $pkgdir/usr/lib/$_pkgbase/legacy

    # geoip
    ln -s /usr/share/GeoIP/GeoIP.dat $pkgdir/usr/lib/$_pkgbase/legacy
}
