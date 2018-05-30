# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.11.0
_gitrev=867
_gitver=f27f8d2a
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="37-567b69ec3e00d3"
_web_desktop_ver="3.47.1-c3e00d3"
_web_tv_ver="3.54.1-567b69e"
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
sha512sums=('7f7463f5609ac5c798033cbe6efdb8d544f711d89dfdb428a35a749681ee62f45d9169f2dca7d784f148baa3d27a0a7b76872519f46272009c51688c97eae0dd'
            'e6dc07131dd3b2ff5f02b209ae5df423b9a6acc6bcafede0d9909dc865435d65c4605491d5944802f7fcfd12e407a49c190055e8bffc41e8fa6c0d613383ad7c'
            'd1eaccbe926c103d2351786589595e07fed33771afd62df6aa97aa02b49fd8983e183fe3dd3822dde8ba99987c998d36e0f60dff7d8b96da61f9adba84f22482'
            'dd4a89406a3ee8ce554793af45d2639a777f6136a26063a19f3804e3645c6eeec230359bfe0e86f3afa7794e564247792363c646f52c58f3f1acca84f62dcd9c'
            '219f7387e2591c666264dca7adc94012c6c75b57740df47d07440bd24323a3bba9a7c2bcda9edd5d6db42fb33a1cf0733f288f97c5c0b528b1bc13fa78dd52ea'
            'd96c9439c7a1e4b592b466661b1a560cdc98a41acfd1293c12e4a58006ebf4d156e9390b83a93e8903bd7ce8138d90247867b8c48731417000ba2330187a4a16'
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
