# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.7.0
_gitrev=806
_gitver=608417d4
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="20-c43941710b9d19"
_web_desktop_ver="3.39.5-10b9d19"
_web_tv_ver="3.42.2-c439417"
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
sha512sums=('c07e2cb80581095a742c0f75190b190209a9a87897739b57471eb80a7352b0365d4fb067a1a3219f3a6f533bd1d826ee77d557f8c13331354579dd7ea16c002f'
            'ea48f41655d3d8ee00d96f1f9b96f286533dcd8b8a9be7152e0e9723a86b848cf0fe7e851113f01b8644508bc70acbe3a19796e823a384505801067361436cce'
            '68b394160724b807200f0f7607856472244469ce5d4a9b528611e3442dd8e981205b39e369c31b2e5cd0c88fdac431dfcd7eb9a5edcc35c81738af2054c599fc'
            '30d00e310a45c452da9c398e755d24a3c5438cf261376ebd08583b997b360a34f2942b73a24a211d5eb86d1b2bc0bf6b8ce52114079d7a78295c04864badb680'
            'cc30028d09c48b1399a24ade7fdccc2461367a7550e80ac5bce742dfe5805bc14756eb2008f984e02333991131d7049efd83c74d136c60e15a941172b0bb50e5'
            'da0978de33bfb01e54317ac62ae75eda478ea7b186750782df1a49a874481ebf5121d0db9457eeec75eefd27d76c121560078c48cf3820701a61982a08c6fb71'
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
