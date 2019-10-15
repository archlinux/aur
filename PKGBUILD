# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.44.0
_gitrev=1018
_gitver=8f77cbb9
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="151-ce86ded1b12c68"
_web_desktop_ver="3.104.2-1b12c68"
_web_tv_ver="4.11.1-ce86ded"
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
sha512sums=('46c13805c947635477454b2d156e5a24b2886e51c87be8977a4306a6fa457b48367bf6b860c475b834261679a1e23c2be67ef98c57cf78a6ebc750327647da6b'
            'bbd151fb56ea3df13bece34dc703eb4d2d1c7334f4fba425a6159210121caa23809bfbd54fbfa2a2c7a0b35443af4187c9a76e817ea8ace0fe932303d0ce7956'
            '6c78635b3dac85278274de100b6f286a9b27475d298175e0290d65e32d3af027ce71fe41a3a398e1f2a7704e3ef3a0c367f8843311e1addef3abdf9b38875b4c'
            '94030fd06720585883b056ddb2b5cdae3fc25f7015e6318dcb232760056f459093345172c70abbd86c978f321603a50504919e9acfd0bef6cf2e15b5f8c80fd3'
            'a86432c6be63593def152cc122f8891740cb1b99efc02e712bdeb32a6bfeb7735c05436f5772fbbb88297f7b7a94eb2b56e3d745d7644c0f4cca627de5bb07bc'
            'fc202dd598d94158fa026e1f0977a84d00b6877883201f3405363f7564e2de686d8c620d285834f580073964f2946f1a5d27d17eee870555f6cf987a082118f6'
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
