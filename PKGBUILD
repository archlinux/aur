# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.31.0
_gitrev=967
_gitver=a95b6d76
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="113-862bda5ecd072f"
_web_desktop_ver="3.83.2-ecd072f"
_web_tv_ver="3.94.0-862bda5"
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
sha512sums=('117461edb28fce33256373eeeb5535fc9dd6295ba93fa0f2117a37bec198ee0b93d6b51d17d4f6c3c715231214cae930a7a5ff85e3d4fdc079eb2a6f857b00cf'
            '41285525923e31d358190c6f72f4f1378e88c819b521138240104aa06234184314b35aaaed6752c9a0162939fd9a3f72fdff65ae5acb2cf03aef8e446a5f655a'
            'be1383ed173ce584145a5d45ddaa702dfab28e92cd9d6e945cfc46567f924d4d4e13df5fbeef88f3978a934943035034d2bb307f21462cda9859daf87c70acc1'
            'df3fb9bbe140c5666df8c23c609baf50f25864fe49ba14710ccf1b25f819c48f21e86da42ae5bf3e8f87f90734d9569ffc8bb9589ee32828f01f593d23dd2f42'
            '1dfadf5d42c679c5951833e9f6504e1708454c28d8ba74076adce59a8bfdea64d60cdba4f9cf2fffd36468562faab217192ac77dd270ff2adf3eefef6681c9f8'
            'fb036068c031766189c9d20d0650157d86be709b67ca11a70e1dd007bf07cc3a0524f7ad419fe2da53de2ce95e7b5e6d5f4512edd9c679c367c5ae9864ce30d9'
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
