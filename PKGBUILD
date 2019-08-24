# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.40.0
_gitrev=1007
_gitver=5482132c
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="141-4af71961b12c68"
_web_desktop_ver="3.104.2-1b12c68"
_web_tv_ver="4.3.0-4af7196"
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
sha512sums=('3fecf3e52bdbda87300ed5117d07deba75d2852455980fbee58e84d2ce82bb487549736b4ce1f0b6c14c764fc16910a5041a954c94f7588d4a16b79cd2fb3ab6'
            '8553a874a2e5eb5214c97bb8fac79843f6f04f4be60cd24629398e3a7faf585fc9a5b4ec43adb1d975208e7551e28a00207b46be7dec6964edef4ab24a7267ea'
            '0f3491b0833802a19aba98b9827b0d9fcc670e60a4de3ccc8b65f09224eecdf85fbc6b33d5f48391d2d70df19c1cee1542a9f77ab63c8bf1d4b4c4a9f1586a8e'
            '83c3bb62513ef03b7861cb19ab4a7c3a7c4eab30f3ec8d6d4721ed6251e77f34569776c2af2efeda85efb8b3e466ffa5d15ee8d531ca6809d8c1dc7b27e5de17'
            '7498f80bb9fa672947bca944a7ce3e183c4e5b33639c0369f9f4c216088fab48c9c0aa58c602aaa13e4668af75f9f95b5ab471d976d8d308e41f9b152b204a74'
            'c883e1ae27af4e5cb315701764945b259a1cee570948b64787d34abe7be0d1689aa7601b493ec85582c3e8aad8edef38bba1370f19164631d6f8acc65f90e555'
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
