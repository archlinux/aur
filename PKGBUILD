# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.23.0
_gitrev=920
_gitver=5bc1a2e5
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="85-88b3ac67015f76"
_web_desktop_ver="3.77.2-7015f76"
_web_tv_ver="3.78.0-88b3ac6"
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine' 'libcec' 'sdl2' 'qt5-x11extras' 'qt5-quickcontrols' 'p8-platform' 'protobuf')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${_fullver}.tar.gz"
        "buildid-${_web_buildid}.cmake::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/buildid.cmake"
        "https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-desktop-${_web_desktop_ver}.tar.xz"{,.sha1}
        "https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-tv-${_web_tv_ver}.tar.xz"{,.sha1}
        'plex-media-player.desktop')
noextract=("web-client-desktop-${_web_desktop_ver}.tar.xz"
           "web-client-tv-${_web_tv_ver}.tar.xz")
sha512sums=('7bfba04bcc494cfbba693ed78efe4ac9b501960df3000915ab35acdb385e715597f9dcb11981bba5ace5b26910c89e42f36a73a233598201e3d668cfb5901abd'
            'a4ed962f527803fb1d29f26618e87951049b52ece3206e8861d48dc1beb6668b5734164dfb56e972f8059fda1f734bd87f062a973709f49821311af44fb866be'
            'cb4d38f6ce2f18bd74298174953f79ffe30165df0badc103813852d0fb7702f81696f315f57b29bf31b3bfc9c9ccec19d43331b7f9d63247968a68a4c65e1a68'
            '024f29ca0ba9a0879812212dfecaf0a83be96a6b186bf5452b030f44831273f4071616ee023409e78053f551495fec24133eb562f79cda6b8aac171109000bf2'
            '3cd51917e5639f43adb6ae9479320a91e3ba0bf5a066b20631fee48786e9300d589df3ab2c14c31c0617a47af9fbf2b190207a6756f8f18a6baa523d52740f45'
            '137521ef8efe233ac6cac17b0bec5761996099a78b573509da72feebccb17d7414cf9d418b6315cab92bcf4fecf582507a799490500ad6871f81f021a173a55b'
            'd3dbd66be744f497e095eb118ea28180769c74b3e8a8d3554b1570a224bdcd66c0c1416a3baaa72e6fff5a63beda30d3ce953cd886a2f313a655fee5d8f26019')

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
          -DFULL_GIT_REVISION="$_gitver" -DQTROOT='/usr' \
          ..
    make
}

package() {
    cd "${srcdir}/$_fullname/build"

    DESTDIR="$pkgdir" make install

    install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
    install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
