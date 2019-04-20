# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.32.0
_gitrev=973
_gitver=62b2e27f
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="115-8a62818ecd072f"
_web_desktop_ver="3.83.2-ecd072f"
_web_tv_ver="3.96.0-8a62818"
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
sha512sums=('60f162b98d245d9af88d4a60bc3cbfbfbe01b6fce57bc8ba0d2751936770be642ff6714c10724443a0c0db393b101a24d072b87378c90a5fba77e47d8e238c58'
            '830eaed2d61d1d5b4bf1c1ca1f80d34f97e9e65f23eb875a7ef021ff9b7fed1398f594dbddb744eec098055d4c7cc95b20784e1e99cd74ebee2b444d2ef4526e'
            'eadfb4de376a754eb67d098569e90f4f3a00543a32d0957f8f0c7f912cfb4518ca217e0ec803f0e210795c8d4c5d1a3801b848d10cd47b4bd54438047b2d053b'
            '955a33a976a67738779b7020caa8f024f8e49a0605400adfe6336065499c9976fbf2b5c4238bef9915a639a199ab500bea4c3118b0388fb7e05ab3e2586b1841'
            '151ed348894fb749ef06d9b5312a45f1b8dcddada0eaf08bc3bf0d0f328ad88e030a47b121bba40fd95bff0001343d01b0284ae4d15214b33e15371624ddc1ca'
            'e0f7ff1c88bc53421d349664ff441ee03ee0a722df5fea6bfc4ef48096bbab38642b6cce9025233988642194a90a199e578add075ffb7b36b725f7944a6d41f6'
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
