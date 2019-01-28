# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.26.0
_gitrev=947
_gitver=1e21fa2b
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="98-0ff841fe41d5c5"
_web_desktop_ver="3.77.4-e41d5c5"
_web_tv_ver="3.84.1-0ff841f"
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
sha512sums=('c1f1fb2ba76693e91bd604be2de9e23c5f0ee62e229d43232e51f3e7d227af187dc8431133115e542a6cd9fa1de35545303af74546456b350152628ea5b8b4e4'
            '888c693b4e53ad259f1f45941cb39595a92c66d1468a682fb9242d1b440cd5c0865ecee819719ec521ae7a32d27ea6552716b6b7b76a3e98b78947a6fed8d9be'
            '49d173d66271a134b529d8970728db53e73d7e2388a5bf3b22682158924cbdb0636851875d643e647abe79441cd284c6434bfcd4e5d0776965b97e7dedd12873'
            'cf535076179160582832bea26a99addf08c9471c195f0255dd911c58c75fca8478b4d1ab3e60c614c65422d86faabbefa2979622cdbadd85aeaf5fe7f8bf9a57'
            'e57e677de2ef9f48d3199d7e037eaf200f32a41b78f537785e5a1327d4aa8ca9416253553b1ddb78cc3572cabaf54820e795bea64ad748c479add7727a5fc4c6'
            'dd37a3192fcf41c6d5c090087d2abf142c863e8c1eba2770b56cdba5c2ede103cdc45ef0b9dcfcaff48aa89cb115b430859637669494fc544436fd504fb88c7e'
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
