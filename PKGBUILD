# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.39.0
_gitrev=1005
_gitver=1b0839a8
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="140-c9c2b5c1b12c68"
_web_desktop_ver="3.104.2-1b12c68"
_web_tv_ver="4.1.1-c9c2b5c"
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
sha512sums=('b2c1ba67c808a8de378f22dc99bf6cb9c85518bfcd0ce557f293d068a193a6f66f9fc963489c33547af097370b7142b7482f4e10b6c942158ef1bc5431c1de29'
            'beab4f6cb449c62ce3603118dab52aa964dcb87cbfba1d531719e92f59c0ec7d40edfd7c292334dd8de84ec8af0b8ed6cd855be97e95cc724d3c2e218e6b98cb'
            '905f13f392acf4ad8e999489adcbe0ad700f09aeabc32258f144d661831ecd69e367af4cfa4e56111094bd18ca212bed3a34bc8bae500927e3f88d817b301dd2'
            '388292bb38c19626551a7689b0ee8198bea09958a53e5e9bd7f0bafbcf9b983373adf0a6e490a594b9ca0d421ccc97b403c9f6e4c401655975ffd0cc93348376'
            '5b3019a16fa5080b060fbbef9ac80bfc65e9fc7e15744738cddbb5cbfe5938aa8cae1ccb6f88ff28369e30fca1b2925b3383935d53c07b4af29d47128cb10590'
            '2abdcca222caf828150742545ff80539dfe66f2bff267d2631046d3d4b06a254b81417bf4393960a6a77f1a4ef5633a740c681cf56986fdcb3951b8308ae3151'
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
