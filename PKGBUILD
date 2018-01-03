# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.2.1
_gitrev=758
_gitver=5dad2d62
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
pkgrel=2
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine>=5.6' 'libcec' 'sdl2' 'qt5-x11extras' 'qt5-quickcontrols' 'p8-platform' 'protobuf')
#makedepends=('cmake' 'conan')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${_fullver}.tar.gz"
        "${_fullname}_osx.tar.gz::https://downloads.plex.tv/plexmediaplayer/${_fullver}/PlexMediaPlayer-${_fullver}-macosx-x86_64.zip"
        'plex-media-player.desktop')
noextract=("plex-web-client-konvergo-$_webclientver.cpp.tbz2")
sha512sums=('78214a4322979ec25486234ab1ecb74fbd3ea817a1a086c1cf6ce48ba3eb25b496d9e1cc7cb16cc937a81b7ca8c42ded320ab1c7953caee916c77780f562e5e8'
            '9ab9b8d9d2b067584bee7a1e0c7e6d4190975659d6708bf1a59746e6ab6fcebc9574ba23edfe7c3caa6f2ebf38c7d08c0236008507cb7e5de8625dd26438501c'
            'f24d70646babc2d248d6159442e3b9d5518276e7d8e33004f13d260953ebcd741067c507a47de25c24842e4391f4c403cdb46dc989b52fa1dde38a7312382db1')

prepare() {
    cd "${srcdir}/$_fullname"

    # All this git version junk fails, just remove it we already have the version
    sed -i 's|include(GetGitRevisionDescription)||
            s|get_git_head_revision(REFSPEC FULL_GIT_REVISION)||' \
           CMakeModules/VersionConfiguration.cmake

    #conan_remote="https://conan.plex.tv"
    #msg2 "Checking for plex conan remote"
    #if conan remote list | grep -q plex; then
    #    msg2 "plex remote exists for conan"
    #else
    #    msg2 "Adding ${conan_remote} as a conan remote"
    #    conan remote add plex "$conan_remote"
    #fi

    mkdir -p build
    #cd build
    #conan install ..
}

build() {
    cd "${srcdir}/$_fullname/build"

    # https://github.com/plexinc/plex-media-player/issues/641#issuecomment-354332463
    RES="${srcdir}/Plex Media Player.app/Contents/Resources/web-client"

    cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 \
          -DFULL_GIT_REVISION="$_gitver" -DQTROOT='/usr/share/qt' \
          -DCONAN_WEB-CLIENT-TV2_ROOT="$RES" -DCONAN_WEB-CLIENT-DESKTOP_ROOT="$RES" \
          ..
    make
}

package() {
    cd "${srcdir}/$_fullname/build"

    DESTDIR="$pkgdir" make install

    install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
    install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
