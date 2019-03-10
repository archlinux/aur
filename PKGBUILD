# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.29.1
_gitrev=961
_gitver=bb236059
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="107-99dd8130043312"
_web_desktop_ver="3.83.1-0043312"
_web_tv_ver="3.90.1-99dd813"
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
sha512sums=('e7ebd44784bada2e86a34e4fbec7ac2207a20ca0421ee4d5fa71c0059f2745e27fd1a3c2746fe63e9fa2ac108272aac6059363fc480b3a39783bbeb52883e65f'
            '76981e614c17ce5ed0a79ca7ab437ef2b89652fd950b5e8f951b0c095c3ca83c4166416e313aad366ca287ee5947606a17ac49ef415b430a072f76df3f01a1d7'
            '43be6d187a84c2a135cf870b43afae984c356eccccfb60d8eba1f3f1b83c8cdf95f1e11e64b212557cb7f6f11a288b3bdd6b6101d3364cefa1011f2d0599729a'
            '84eb01b22c235b28c7c8ec3b5ff2084de0b08e5110f4003d0155bd3eb672b0e403483120ded7f365f2282a6066dcb0d380e3fd500a193e56333d0fcdce1a8809'
            'b2477fb1bcd201e35bb8ec13e7b4af037ef4a2cb21299ec0641c5643b7bf1f1dfc2b5d3ab795fbe7a1f84661d3c760ed229406eda6cd407ec2238d3d5cb6a574'
            '776a15bb036ad75d2afc7dbc10d59a7ece301748dd21789b2e20f4215390f3e6640dffb8d449ca2d26267af3b929b1ee9edcb634fe4010e16173e6ad4a6c6b7a'
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
