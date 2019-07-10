# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.37.1
_gitrev=994
_gitver=ac3132ba
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="133-9adf36c99cd699"
_web_desktop_ver="3.104.1-99cd699"
_web_tv_ver="3.107.0-9adf36c"
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
sha512sums=('dd358bf858f2cefd0e0e37a4314ede868a8afa71315f24a009e8d8b3d5f550f8588ebee6bef84109419807cbb6e1254dc010aedf004d6948fa92daa7f2c9c660'
            '69025a554d7053bc81733e031be793d642b349284e3d7c1ebbfb1ddb6e627a964ece4838a01bc770adabfcb723ed972cc4267326f5996995ff5b2ac3450484db'
            '079b4440ac7ef5f478442b963e8d25f77fedcb76eae7ee0ca91a26c76fbdb61e2c7685745f3da4bc6c66987a8717e197fbabe703c36acff7d78297ede70ecf3b'
            'ea2f6e4d276cec65d3ea51ec8319c0125726c0fbf03406c186137cff28eea5ffca802a9567cbba449c3b081dfa02989ed8dfbc079e9c5a4ba013363549404182'
            '5c16f59ee573d950b7bc6c5b62034928cf84fe5162395ed753899a0a57da69377c483f1cf2a66d3a68379b304ea341cd1349d9bbc30c6a994d51d715b75fade7'
            '9ef2f3b95a2e4de1a1f07af2cec0ea1043798adce370695c486d9f947294eb3c9d6bfbe5c408e038d8d2124c92937e48a3e7d4d1dd38a25c759d027fab32ad64'
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
