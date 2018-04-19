# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.9.0
_gitrev=824
_gitver=706dec50
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="28-f0f7af5c3e00d3"
_web_desktop_ver="3.47.1-c3e00d3"
_web_tv_ver="3.48.1-f0f7af5"
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine>=5.6' 'libcec' 'sdl2' 'qt5-x11extras' 'qt5-quickcontrols' 'p8-platform' 'protobuf')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${_fullver}.tar.gz"
        "buildid-${_web_buildid}.cmake::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/buildid.cmake"
        "https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-desktop-${_web_desktop_ver}.tar.xz"{,.sha1}
        "https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-tv-${_web_tv_ver}.tar.xz"{,.sha1}
        'plex-media-player.desktop')
noextract=("web-client-desktop-${_web_desktop_ver}.tar.xz"
           "web-client-tv-${_web_tv_ver}.tar.xz")
sha512sums=('77a7c8125d40bf0b80f6afc28329ae908403ce62bd9d79d23e4b5796ddb452e2da65788d32b8b34965814c3ce4f29163ec9a6ec259aaf592f2b8ecb1025e00d5'
            'ed240b70c5ef14b6141b1e5cc5493f5ffa520f5c54769a55a8dae450048f9b98a7dcb587544c4053d5c222378ad7cd9c514d77b8d3e4283445747c0c36c74b78'
            'e484991acf2b2fb48a77cd24efefedfd73aea20cd0ae03e089f18adc5874ef0b050c848415cbc3cbf8b53b459fa4ba64a7e274369c89aeb5b82008199d96c0ef'
            'fff1b25b8537ceb2c1cfc8ed1946c3c37b4aa4863175dd519dda4aadcb481dc2c3006a3719c0cec2110cc83e93d5d04abc903fa25a741689acf68fbc367b1869'
            '168fd8148648c81c26cdd1663da681427b7176c436d514e1c1c248fdffa4eff3e1880a8bdbcf1023d36d4e232e0ac7efb8cdf04f9a33fd99a9e8e9900b75d204'
            '2e04ca6112b6ae65db967183e4e9a6c0fb7809e5ffe6d413f80312066d4bed58d274cab1bb0cd61e6dfaa3dff67fbb3c03cdc2eda0188c697ef39d92ae04ffc4'
            'f24d70646babc2d248d6159442e3b9d5518276e7d8e33004f13d260953ebcd741067c507a47de25c24842e4391f4c403cdb46dc989b52fa1dde38a7312382db1')

prepare() {
    cd "${srcdir}/$_fullname"

    # All this git version junk fails, just remove it we already have the version
    sed -i 's|include(GetGitRevisionDescription)||
            s|get_git_head_revision(REFSPEC FULL_GIT_REVISION)||' \
           CMakeModules/VersionConfiguration.cmake

    mkdir -p build/dependencies
    for f in "buildid-${_web_buildid}.cmake" "web-client-desktop-${_web_desktop_ver}.tar.xz"{,.sha1} "web-client-tv-${_web_tv_ver}.tar.xz"{,.sha1}; do
        ln -sf "${srcdir}/${f}" "build/dependencies/${f}"
    done
}

build() {
    cd "${srcdir}/$_fullname/build"

    cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 \
          -DFULL_GIT_REVISION="$_gitver" -DQTROOT='/usr/share/qt' \
          ..
    make
}

package() {
    cd "${srcdir}/$_fullname/build"

    DESTDIR="$pkgdir" make install

    install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
    install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
