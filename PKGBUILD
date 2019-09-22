# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.42.0
_gitrev=1013
_gitver=712b8c6f
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="148-aa5f46f1b12c68"
_web_desktop_ver="3.104.2-1b12c68"
_web_tv_ver="4.7.1-aa5f46f"
pkgrel=2
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
sha512sums=('ef408cb5c2697c8120cb9d9a669128d5634c898c26e9a582e823263e11a294beef9282441b400f3895af696b89cc1b7c421abbcb6861a9db27419147baca552b'
            'fa85ba5472b42a6775baf659c9aee760b4d0d0dc63a165f6e080b4bf426d54ac65fcf061e4522119917b72ff36ea59e6b1900fab293d9975bd001ba2468119f7'
            '279333581ef8701312b77d9b03dec1dd9f2b4acebf43f91155b8fa0aa4285f9d8195b4120efc889a1c4f827742a7272b45da1ee12d500684f7979fa28ca54458'
            'd440b5683af07e187185a0404031fb1a5fc0164f45f2ade173ec6f9a69f13d92a266a62c8ff245377b351a6e36cfe68f67dcc5832528b556b8b0acbdde5d00ab'
            'a20317c8a4c92f3e81bdead62efc8a33461adb299959ea34b60e4dd2edf51dca829266ea39bb7f7105bc2a38369438dc05f88f27e2103cb8d9df9aaf21c0517b'
            'a00034886afc7b1d2ed083143d975723a1c9d5314ec30bfd336e627e1462934e8614ccc7926ccff2fa807264dabbc4af4ef16b1c156cdda0db03df5d6d284e50'
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
