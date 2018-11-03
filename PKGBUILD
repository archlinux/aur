# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.21.0
_gitrev=914
_gitver=4839cbf2
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="80-af3977f757f795"
_web_desktop_ver="3.71.1-757f795"
_web_tv_ver="3.74.0-af3977f"
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
sha512sums=('241332bb3e7dd4c63ee0f4d3b7aedeeccd59d59f35ea43a61389ea186754d18d5272452a22294cf9ee7f79c024b9bf3cf61af8eaff2b2bb3f631696a538f4dd6'
            '4e512a0516850070b4d36f10fe0a9e15d5480fd62482acd2a8f5f2dc9941b6328bb0ac9104ae6e4b31c85a0cd62660d8b7b75cda14d520018bf804d941c1917c'
            'b3871d38bdb5e9afbced422d2ad126dfb3fe015e698d90f44b36f9c6a75de6bfae93df5c52f8a76783111a0ab96dc4c347ef456402b59745b2424d1cf035c31a'
            '60474074a1143b29e847ea9e793d4d1ff8315b453302e8acdeebce0f1d8d2dead605c3871831e2ae9c0f2724e3ec8c57794569016f101aa2c0479c60768211d0'
            'd3fffd4b89ddb31f9a8f58abfe18903d92562ba0483a56e73b583e7b1d2dc3ed3920ca706c14b1f2f851587ed449b722b1fb8c573cf6ede2506256a2f504f240'
            '1311c07b14389279976f14966b205ecd15400a3932eb0443d23b8057462842cb67f54ada1df0116d5ced4bd44da034d057c450f1fa3e2c7883ab7db6547733fd'
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
