# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.34.0
_gitrev=983
_gitver=edb7fbf7
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="126-b5c7e95d7ae231"
_web_desktop_ver="3.100.1-d7ae231"
_web_tv_ver="3.101.2-b5c7e95"
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
sha512sums=('a9e731259a347626513b9992397a45d80a8a8e8104d9733b42e45085774373b7ebef2cb2e41149405c9035c60bcddc116fa69833c2199111b38de6b1ac946bf5'
            '61f0673314d24903fb198f56789d888e2e185a838bda1f4bb9b5cc2bb56f72c49fd4ef7bd4803ad9442335840919c95970113e3449f25504ab51008c7f4b1dbc'
            'ae3be244b59ef54d56206a403418428ff651ec692555b05997f6753a2ebd34bd558e49b02fed308a81b34c135d592b9390431f6a9f065794d2fb2cf9d057f024'
            '33fc21e57b2223a34b208d202be3c7204d2af65f04e069d2cf4ac418842e5225a32d1d05a898407d7c28ab44a87c743406e73b176d510984937d3349e47e9af1'
            'afc08d1f5757979c13391dd0b2969802f7a9d2c44deeef41a97b0b1e2f2e966686f02ad35fde06b60c74c3a970d69699d00b71a9764dd0650ba70e010344efd2'
            'd750541925fb7e93d2bf9727b0f4b635bc9e2650a7b4bc071cf52afdc1eb0e983721feb93f0e56da1e34635a441f9cd9c923ae041f214683fcf6ba60b6e4d538'
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
