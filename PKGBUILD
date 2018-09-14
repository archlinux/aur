# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.18.0
_gitrev=893
_gitver=48795f25
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="67-df70e10f20e61c"
_web_desktop_ver="3.67.1-f20e61c"
_web_tv_ver="3.68.1-df70e10"
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-pmp-webengine' 'libcec' 'sdl2' 'qt5-pmp-x11extras' 'qt5-pmp-quickcontrols' 'p8-platform' 'protobuf')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${_fullver}.tar.gz"
        "buildid-${_web_buildid}.cmake::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/buildid.cmake"
        "https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-desktop-${_web_desktop_ver}.tar.xz"{,.sha1}
        "https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-tv-${_web_tv_ver}.tar.xz"{,.sha1}
        'plex-media-player.desktop')
noextract=("web-client-desktop-${_web_desktop_ver}.tar.xz"
           "web-client-tv-${_web_tv_ver}.tar.xz")
sha512sums=('43254efaaef0fca36236c7962548081c97dccc47080cbae51ef00deb688aa488ceb280bbd9a73cf0ebb97dad8201fb372de4a680a67222f239d5a0957c22f7a3'
            'a5478a3cecf3ba2fb2f9b5060eac3319bf00db84f99a5c7c0957d044ed7532d83f88abda4e923754e0d0ddcc1b42954692d2c60f8b5abf2201af49133782a3a3'
            '8471183722d7ece9e769e0b9a7ec4ab9eae4edce5384b7321e0e4d19a08f35014dd40ea1b2f719d1802f0a1caac154e91bbf8301297b09d46b04a13644707c85'
            'df1436b3ba31d8b2bda1c39fa4c4464282a91dee358e9bf289e52361a248cf08792dc2cffbbe5349bb9d257415afcc6ae338c052f41e79a0f395e9f65e79099e'
            '81accda4f0c38d449640a74ab53df232bd2e74fd3ca9d2c24c359caeb2f7c9dc8a01ba755f5eb964d268b279fced6889dcbc5df48c1e14434b63e03a53f26427'
            '02d7d571598e50eb9108402f9e61386b3bf9663368a1439fdadb3da497efc5c46a3bff6b201fedb7261cd7b5efd75f6644a3d85315d0a23172a771d9662295a2'
            '892f05cbdb3f3efedf0dfe63ae14f8b009841162eba85f505e371dc55b4240a612706a9ead0e94ed8c1e83f53da0e969f317b1790ef65fd5891863db37a8df54')

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
          -DFULL_GIT_REVISION="$_gitver" -DQTROOT='/opt/qt5-pmp/usr' \
          ..
    make
}

package() {
    cd "${srcdir}/$_fullname/build"

    DESTDIR="$pkgdir" make install

    install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
    install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
