# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.52.1
_gitrev=1054
_gitver=86a2dc81
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="172-17d1db2564f6ac"
_web_desktop_ver="4.27.0-564f6ac"
_web_tv_ver="4.27.1-17d1db2"
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine' 'libcec' 'sdl2' 'qt5-x11extras' 'qt5-quickcontrols' 'p8-platform' 'protobuf')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${_fullver}.tar.gz"
        "buildid-${_web_buildid}.cmake::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/buildid.cmake"
        "web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-desktop-${_web_desktop_ver}.tar.xz"
        "web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz.sha1::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-desktop-${_web_desktop_ver}.tar.xz.sha1"
        "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-tv-${_web_tv_ver}.tar.xz"
        "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz.sha1::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-tv-${_web_tv_ver}.tar.xz.sha1"
        'qt.patch')
noextract=("web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz"
           "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz")
sha512sums=('f8b99973d59a0f5db8640faf5b882c3c6d3f18a90de2ab88f85d6cb85078f9161195afafdf79f62af6da6019793fb982d7a2b7f07a4893b4572654430a2535ee'
            'da01efe5eec9a57b7a8e6d35cf3e045187f21042ccdae1259b191e3cab6db498ef447d2833dda164b4a8d65896797bb4e481ee5d2de51da78c406c90d35f8448'
            'f9eee9f78bdf251b8ca46bcd5cfc0a97180386d8b56f807ce54563fa1fe123c82cffc8340f5d54d553bb249010a6c1a2c64439ffe8c33a6f2a04adfdb6eb2b5c'
            'ca2a5bd27618f0b6d353af9f874fa3b768032b1b70e8fe9dd599e7c32b7c85e9b4f98b4fd3939b607478f929305a93da1819113cbf00f1a1c351092b38beb884'
            '074663aa6efa1065a020e816760218338775def155578e680f69870f361210ab9c7af334fc8bca68f09b9945e225f7ccfbc64e003175310c1dcc42468b9b9731'
            '1b5a6475d47430c3f5e83f0d909f608d9b7956c8672f5dcab731bc6968b23bf54c479923e0bdc988316050b7468f1a07d11a7ebf9911de8f3f90a67ac0574705'
            'SKIP')

prepare() {
    cd "${srcdir}/$_fullname"

    patch --forward --strip=1 --input="${srcdir}/qt.patch"

    # All this git version junk fails, just remove it we already have the version
    sed -i 's|include(GetGitRevisionDescription)||
            s|get_git_head_revision(REFSPEC FULL_GIT_REVISION)||' \
           CMakeModules/VersionConfiguration.cmake

    mkdir -p build/dependencies
    for f in "buildid-${_web_buildid}.cmake"; do
         ln -sf "${srcdir}/${f}" "build/dependencies/${f}"
    done
    for f in "web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz"{,.sha1} "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz"{,.sha1}; do
        target="${f/-${_web_buildid}-/-}"
        ln -sf "${srcdir}/${f}" "build/dependencies/${target}"
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
}
