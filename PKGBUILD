# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.3.0
_gitrev=774
_gitver=ef2108c2
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
sha512sums=('345c15a65a4f1b2590c7f99794b5986c3764c03b519cf11343a7d111e50959638396d51ed7ce666b91912f57d842ce221b24055d26fc6b332ca87eda5467d30c'
            '0c75dd187454ffa940863164cea5a10fc92b28ecc81a2acb8fa7e5204f16509425f728b8a069036042f4601b1635a1ab944b24a14ca4771e850c12209766ef1a'
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
