# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.33.1
_gitrev=979
_gitver=c4087ea7
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="121-f53ed3cecd072f"
_web_desktop_ver="3.83.2-ecd072f"
_web_tv_ver="3.98.0-f53ed3c"
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
sha512sums=('78c9c62d89ad45343474cbd1055b7623df87f9272f0eb7a88df285000523c2117564bc82e64a055c52ac0818280ff1b5264dfb216fbb8b5809a822034c353185'
            '7c032be3ba0d10f7e82fc59e6bfd1e645046a9efdc6682544756aff5c80d22d682337781f739f6c855edf1c537824265197becd25a5ba28a8fb2f18e40e3ac20'
            '8f94b48803c3bfc828ca9f5fab9dec24c614852e8f0923585ad3f62cc15d9ce3e05c74a07d780e382b41450eb216e0ef137004245ee7436f61a0322077b55626'
            'e4304d3de9d2274361b751aecd56938e7afbd5a5e9bb99b66c2161af1023d061d23e126b0c6f7b454e0a6017d0cf3b4ba71dc231a13d7f82d59f83180ac0bf68'
            '7be9598c9c0ef2ec2910acb73efc579aa7df607b9c422b26e56179ec030df7e94a75feaaf831f7e7f5b0920a4b4cde18ff061604591226fbf3f54f639396ecb7'
            '13a3a259fa792a5603d4274a8ae5918e6823ccdfdbd25d9b84c21f3d7d34d815da1ccf1907d75f24e4c18ebbfdb2b4acb776c3e53e898ae26b4b88d8c43d9191'
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
