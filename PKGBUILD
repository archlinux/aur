# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.8.0
_gitrev=813
_gitver=6e77dc0c
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="25-fea08608883bd1"
_web_desktop_ver="3.44.1-8883bd1"
_web_tv_ver="3.45.2-fea0860"
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine>=5.6' 'libcec' 'sdl2' 'qt5-x11extras' 'qt5-quickcontrols' 'p8-platform' 'protobuf')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${_fullver}.tar.gz"
        "buildid-${_web_buildid}.cmake::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/buildid.cmake"
        "https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-desktop-${_web_desktop_ver}.tar.xz"{,.sha1}
        "https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-tv-${_web_tv_ver}.tar.xz"{,.sha1}
        'plex-media-player.desktop')
noextract=("web-client-desktop-${_web_desktop_ver}.tar.xz"
           "web-client-tv-${_web_tv_ver}.tar.xz")
sha512sums=('adbc37d2e93df8ec1f914d6c1002f5184c244de4dc9a0987bae3476be11d2b5f6856b496c71287896afdb1992f52c4e19401433550745dd9bd41c28024e48b81'
            'b7ba57b29ebdc050ec4948c5989af30340ebaecae71e77554a3ba7d274a6a1062c9852933b38c238ddb8dad0bbd14db6a9e4eefd9145a1a5aa017cc889fde734'
            '2bcb4ef12f2b65b912489d659f68556008423ce99670c89fe1a75a9776b3844634b749c2a85cf2805026d371d37f5587ad00655542d43dd864785cc5bfc80385'
            'aeb836a987a04bd05d5847accce145a2c5d092e14e9225b7084e9cdfd40f529efb64de42da564489d1f7deed0e238e65e34dfb87963ee8d27be0c8f9d045442b'
            '6af3e27b45bab2f61ad7dcf9d971f94729aeabb6e4153457336025d05cbd2c4710b128139be5102e22826d828566940cdf67c80866063902286feec8cb2be6cc'
            'fc702258a519d0b59a1dbe97ea99db9b4623a38b10485fd87b5e1c665e47478e2ca9299aadd5854b5105e00f3654b75fa884a5dc219789c44392562170d06d1d'
            'f24d70646babc2d248d6159442e3b9d5518276e7d8e33004f13d260953ebcd741067c507a47de25c24842e4391f4c403cdb46dc989b52fa1dde38a7312382db1')

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
          -DFULL_GIT_REVISION="$_gitver" -DQTROOT='/usr/share/qt' \
          ..
    make
}

package() {
    cd "${srcdir}/$_fullname/build"

    DESTDIR="$pkgdir" make install

    install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
    install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
