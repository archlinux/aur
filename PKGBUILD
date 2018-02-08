# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.4.1
_gitrev=787
_gitver=54a020cd
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="40-2e815e113d1fc7"
_web_desktop_ver="3.35.2-13d1fc7"
_web_tv_ver="3.36.2-2e815e1"
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
sha512sums=('1e153efb2f8190420e478a8f29efd72c8d39e99cc1da98b7a49ab178d82e3300e667ee1c12bca4917a4dd54f8835d43354fb3a03534dd57f0af51e44b3a75664'
            'be0278ea7a44724a6beb50a52bf7fe48c7df5d7cda66a2620de0cc3cef1f481e89dfffaa5c39193e1dde7b4d287b76af0c5f78e75cf94e73db0a169c358a5446'
            'd8bd045613ed19b1d7468a2a55f97b3193b86a6b23ec3233f9571552d42de26a1f6243828909c8863e268d88ac305b833b00e0a4c3d25036d12b503855f17954'
            '31d41524e4edcddb1775bbc3c049f2dc03c1c2c000167196ab1d1b586f41ec8521357d316758ed6c662921f372208a338e3a126b3605cfcb9b34494a13b5acf0'
            '027c80ae9d41ed0869d40d3212f2b7aa52910d93e6a3ae7b8359b8d3330c8e31cccc03b0cd276904ee61effadccf3d043ddbc5514767b6172f03d86bd4e618e1'
            '8fc01a3d02249e5170e4e77f7836d0d798fc3e3dce93026e303a8fdf89899961849800c5a8fa32ff3588629146627e930377ad1e1e448b274feee4413ea147a2'
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
