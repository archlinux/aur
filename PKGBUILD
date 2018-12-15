# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.24.0
_gitrev=924
_gitver=63fcaa8e
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="87-ac3c1b07015f76"
_web_desktop_ver="3.77.2-7015f76"
_web_tv_ver="3.80.1-ac3c1b0"
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
sha512sums=('82a54bdacdcc299d18cae46de81350c99710c1fe37904d2ed53b5d05f6929282e232cd8d07f412838ba415e03f13d24285c232e24813dbca3ec904eb500d4862'
            '593493d64af62999f179d1e16cde29e111735c871ac0dab4d65ea3359bda18f62f58de94fe8615ea42fcd5736da7357eb24f4fa5ed33c74bcfda85fb90bc303e'
            '2b59c6e0d455709e7040e7a1d11a02d1eca83530d76a535ec8418701e8eccd61e790567422bf606e611003e5efad6d0a8bb467d4cad601c249485c4df70d6b7c'
            'bd9021773dc12573ac4790824d6451ad6a0611f174337a4c6572c67f601d31c698227dcf8e9c8cf0840023088014b2dfff255b45fec90d7f484d6da087bb0e5e'
            'c27f0107c4bcede3d4069dd303d90c169fc0213a1655d2776798053cddb06e334edd20b1d7455c331468ca666b9efc64b5726e40a9347116cfa4dc160f3c2ecf'
            '4c965075e48c1901e814315040346825cff4545ab0fd117eaa459d197e191276e49b586e4fa1e0398beddb473cb4a446bfc00ea699e4c219ba9c47cbaa2f8fb2'
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
