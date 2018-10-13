# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.20.0
_gitrev=909
_gitver=46413dd1
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="78-ac41f92757f795"
_web_desktop_ver="3.71.1-757f795"
_web_tv_ver="3.72.0-ac41f92"
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
sha512sums=('fc55f12de9a55520500a3da9da7a606280245dadd9d15e905e739abe0ff2f92bd50857e092fca79f819462bfab83127fe6a88f47d4945385d9462ba7fed60f45'
            '74faac188d16b81468271f7e1012043c2718f393b2f567a8acd5e2d1f54e5e9935c5b227593228582d4f7e5395d6323e76211335635cc650f71c301e849ee053'
            'b8f853fae015051c9a91fc66cdcf012af4a9fa3802a91d07e642d38b68ec40e55157eef8737fa7dcc3dcd2be7507abc8a3da69795f4f62277140ff2788ac4263'
            'cd25b661d3708aa96055a5358d5b4e5b6d28ff8f08d2abef2e23c6bbad4469c7dc968073f9e6cddf51f425961b6dda537c994da5f2441a121dc7f546faf3adc9'
            '3c8b62202c414f5a2413efc2c35c463ea1bf6b3f1bf0f3567f82c592b71abb17b7e9e121f666a0ff24bd66b5cdb17f5a10c5bf3a91eeaf526cd856822b2e1c84'
            '5e73ef858565147481ce685e4392baf67fdf75505612cb33b73aba7deab507c317223a045c7dcec62175b2447e7d0d60ef9b28c8643f33d66ee292339551ce49'
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
