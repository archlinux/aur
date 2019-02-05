# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.27.0
_gitrev=949
_gitver=542ba3ed
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="99-ed0f3670043312"
_web_desktop_ver="3.83.1-0043312"
_web_tv_ver="3.86.1-ed0f367"
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
sha512sums=('ee873e66a2560ad1c277ddbbd3c9cc49ea1e1657a1e640b14313509ce6f3e861959b960ea0ee08148ef83404147d0dcb9731368289e0ac9c0140e01b6f490b4b'
            '17c4445654c0956081dfa0c7bf6d48602c388f57ea6b745367ecd41a5451bb35951fa1b0eff8d5d7576d80dcec1a3c12a11c24d9995eb94926ea0d24e4510825'
            'cd1f02f8fca1a808e23f82f11989c7e599701e085b62c961bb50b6f831c050677d602a97535cf5076b97b453bb00744a348d1a4dbd867141a7d6cf4b5eda78cb'
            '664a8e22735835f503347f70401d705a91b59d134b2e1c2d85791724fcd01b2e10e108a5c9b8a2d5102bcbdc391f945313d7359e32f15b30bdfdac2c45f3b1e2'
            'b029f2ab77b9870a2bdef36cab1c311f3fa72b58e039f7c8c614d7e201cf56fe2992dd428d121970a9248cbe264146f1f38c7e22a416a06336ed8c1fb4ac7c97'
            '5c5f1c39b5f3962366775314ddc6c4e592310818464fa347daa0c74baddec1fe741b78abb0da436e50a2443bc6d0f54d7cb829ad4900e4db376fd3997dc79ac6'
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
