# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.13.0
_gitrev=877
_gitver=6e1ea2cb
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="54-89e5aee1e49651"
_web_desktop_ver="3.57.1-1e49651"
_web_tv_ver="3.58.1-89e5aee"
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
sha512sums=('34ab651aa3858878f9dcebc00a2478cbd1d84cb1f67d3ad49ab0183099e40b85bbef7cb24f086488c3773437b317d4885857bd2f9e010e78d1c920662ebc3dea'
            '99b3c77dc408aa334457117a82d2497d11a357e0a0e042be3de9fbf89d827e25cf62b0de9c5ca205623e48e1b07b6bce54d63cd8a59ac4f6e1164faaa14b85aa'
            'b0aea3b8f6f8c2ccf442be8195bf1a1404491caa6d6f499a06254122e6a6a518227349f92231799e66ee922fe8c6bd8e91fe07e9c3ea82ddc05cae30079e7802'
            '766d1b975ff776084620d52ac8dab53946ce59eb94a181fb211e3353ddf8cf34c05fbbde8567a76cc091d5b367916241894f000c73dedbdf670642d515252cd8'
            '9b1c5a221e1da704a903c59f3933cae5ed6a7f686cbac94e8c92c20b19f0cdd2d35990380f1d1fb168d2d3aeb3288920a629fc889dde5323a0b0000b477772f5'
            'e9bbe2ff641a42f89a2a9e745218c3e3d608aef242ef4649591a14d961134de0a3d12d1322ae5382fec61a0d0a6707cb5cc3a6ebd5624b46438f5ca8c5912661'
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
