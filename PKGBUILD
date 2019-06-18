# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.35.1
_gitrev=986
_gitver=29666b14
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="128-6e4220dd7ae231"
_web_desktop_ver="3.100.1-d7ae231"
_web_tv_ver="3.103.1-6e4220d"
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
sha512sums=('ca0f3c31af3e3f7fd17506bf5a95caac61494ec99c8cd1f14dafa9e2472b05b298e24e27c1bf915853b2bea9d47ab93b6e2d420fe9ba842660df3f71f0e92d1b'
            'd19bc32857450d946ba8b97c60ee192e4d52a228d4d62c79f9f4cf33d6f2604e24e8f02b155a9ba3c9e90689f6b0fd0ebf80456561d6bbec711af739c56b19b0'
            '0a5d95aa9de6214d7ab82b75c481b0536440e1df9240aa3c7d9aa0b3f0d573d087d370fcf7cb93dd94999a97858c4492a32030f471ad1381fae64a297de5956a'
            'd0fbcd5547f4f85255cd47326e54ae144b87523741044b45b76cf9aa7052e82221b0e3a93ac32e1050925d1ff528e71aae6d263e38a411586188e20f18ec69fd'
            'f4ca811393536d40ff39a2667a437c93e594de001f3c06f74d199aaa2c161c391408786f3af26d0aa710f6501cb4e70d2a90ff99964027ca379e1463aa1c362b'
            'f4ef9444f8674b7f28d90572f57ea85890377d100da41337dccf86192d48e5435b88256b188a8dbf90aea22ec25aed59ed8bb19c32541f2fc6280a6dca85e166'
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
