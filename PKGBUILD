# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.17.0
_gitrev=890
_gitver=7d18e33d
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="65-ec66d5dd11aa09"
_web_desktop_ver="3.65.1-d11aa09"
_web_tv_ver="3.66.1-ec66d5d"
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
sha512sums=('5d39eebf68c190b5a083058bb04bccc886d1a74bbc1c907aab2e65d4d841981d2a75b2f48a215d6ca7030f3dc4673247626d629c144dbd5323eeb18d9da366f4'
            '04fc62729187f878f24a2429cb77f81555b5579a24b6f742051e09353c8f8f189c9c7469b84733bb3aba05769ff27e0ed6c0b2170af43ebb6733eb003c47e33e'
            'bbd6853d2d9f988fa2020e2f046842cf525aedd061467daed3f81e3f6645498c6f23f6d0b2b7cca1a92eb3c2337627e7ba515355e7171b5718a731bb2d520433'
            'd9b9a1d265f8b257d8005197cf8a73752acee4779ca21a36dcdb62a1c8433730e46fa6b38b02505f8328adb73536499b81d211d2701475a90a009b8afdf5ceea'
            '1d66ad7391c23e8aa09c8c26d7a9f031dc557a8b5e44b9c2cf5b35085a32ad433ce9923df8e9f27e2dec717637fdda3274c8ac0b211bc2cc69d254d2d80c8ce7'
            '84a623ceadeb0d09af8c82e2d6d7c6fcd1592b564cfffbfdd1ff5f7869da798fd930cb643b8aa7ebf116aa984bb9b958ce8e5d699cf16e45d2b1253856c41797'
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
