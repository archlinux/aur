# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.5.0
_gitrev=792
_gitver=1bc7f225
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="4-d2b085013d1fc7"
_web_desktop_ver="3.35.2-13d1fc7"
_web_tv_ver="3.38.2-d2b0850"
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
sha512sums=('b7501343b59bfecf3ffac8015867b966094e7e2f48744716adb1df43c42097cae8a704b6344c3333235d5ca6fe4730fa99138827c8981b0814ed0ce5b5a9121f'
            'dc123c72cb9c695c9a01f590b7863e3b34a7de9adb7fd7db580f9e3c7e8026a3c242cc6e611bcac855310c333050673772499dc43d0ee28dfef3f169c2a084f6'
            'c2392b918a4030a080c1c29581390bc5554b81ca28959884318f4f1b750cb1974060ab67b0301791ff469f23c2d1906e5b0fe5551d5d9c4e009c55f72583b5ac'
            '62c0b8748dbae89a9d5b5783206b6d08ca0bf3047bbb50f7fd9cd2ae2294246e724ed718ff5a967abfb84895efd116d6136539c32e05fa3e4222c04c56f50439'
            'fa48e82f26f705fe79c43986ab52b5608098d8fdfb9ab013fa47a64904a85da63127d845ee06173e9d969d4980e700b9172aa1d0b8ad6a03e762bf68ef970b10'
            'e92d90041c61908eda6ef47a1dd0ed80e646cf22999e446c6d1481bcff9e59d789c3e37a740a2cfee2c9ff60a74c13b75c5047b327b69c2215a5cd5375ef379f'
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
