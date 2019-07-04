# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.36.0
_gitrev=988
_gitver=0150ae52
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="129-669a5eed7ae231"
_web_desktop_ver="3.100.1-d7ae231"
_web_tv_ver="3.105.0-669a5ee"
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
sha512sums=('b63d553fe04ae32511c35411b814de6b9751714ddfb3252ec681d225c7f0c1f68fd832e8912694a0f1fa05086605a4c214a28c505f5166d066820bcd3d297fd7'
            '5fd07343608208650540a41f8a2e3f209df74cc846d9556ab2ac73e401085cd2350188f22365f7bf3bf5a425cd584ff248cbdceabd17c678688ea49a5b855749'
            '37b842a8d892f6c104469dd24ca067fd5b8146dfcd7f0e5aaf23b052e5aadfcf6418dc62216f3515510cdc0c39015e035402cdc11bcb342dd88ff5a3d30cb866'
            '238c3d7ded40be34b82e2110450eee2ead286a7a93ef8a6e8657e70d77aba6c5242a1f887f68008bc05cb0edd8b22f1a05f2d64b4bd52b42d956b84413ec9610'
            '0622a97381f3465e495506619fb43709552d277931c207337e9f955207279f3ec67a829905269d750a2916bf127f7126c2851249c1ad391b92411dd3d353166d'
            '7a6958cae5660f65a4143d0b21c07ecaa057ad6d1b90e8ee5fc6d41f7c40f9465012530fd2dafd44192cc2fc82b6323831dc22f5f2975a917b85985d47ac4b79'
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
