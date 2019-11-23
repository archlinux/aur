# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.45.0
_gitrev=1028
_gitver=45edbf41
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="153-f23008b1b12c68"
_web_desktop_ver="3.104.2-1b12c68"
_web_tv_ver="4.13.1-f23008b"
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
sha512sums=('7caf87cf5d35012c5f8cc36cd76359791e9b35a9b17cd29e857bb059936e8341505f029d536447c942cffdf195037b90c170202373a606ebd8ce55e8369273c1'
            'a0358ea9aa719d7a8ccc2acf229da1543548547d4629ff9e1a832175c6bce5cd1d7daa259df0f78b61105d66bf328fa708c3f861d9d161a9d0d03f0c0a7d12da'
            'afc8aba11de16e3a7f8f2be79281106842e0d5a9a614033f5423513ad5fbdb7ae11d5a2476998f2de033df7db7643b5ec3773cb1303b20abca9c326447da8d0b'
            '8548180492b42dc77d3162a9058a4c24f8d73b378774359f7ca9f884ae9318154a03d03a45fb733c1e62f81bed3835d881f9a9462c2573596dcda0bcfea5ef9f'
            'f535ec8535d535eb00589d27d2ae1762b1c03accd10acdc0425af248cab3bc11cafc66472eb6fdc019f69aeba127abaa57cd3003eea75a6e252fe182a1bbaee6'
            '9b8ee2336affb371ac19cec3919d2624dd6bd85d76a9bef01bfea6b28490036747fb0d03fff2412768c8682f80611dc5d6d37b738d89350eb6cd64533291602d'
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
