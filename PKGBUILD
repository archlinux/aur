# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.10.0
_gitrev=849
_gitver=e02dbeca
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="32-7a9749ec3e00d3"
_web_desktop_ver="3.47.1-c3e00d3"
_web_tv_ver="3.51.1-7a9749e"
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
sha512sums=('5d78641797778083bf520447fa93e22870976869e32ed5149ebab3a4f13a98d0c14dd15e871286b83a7ef1e4b83d6925698400aed2a82b86564f506d87a1cac5'
            '6965a006978d0c8b4201ae306c40a3e4e54ea32d5a1fca546cfff8407e0c5e250eaf5465a880e32bc4870196b6984922569f717e8551f2c4e09920dce989f6f5'
            'e58e42ce1c2989605b652f9eccc5dedfc11b1b63c37d46c2224d463a7267ba9b01f577823804c13cf4b388dd88a770548f9dc7bc09f28442a0ab3a72be708ea5'
            '64eb8ca87efdb5dab6a5e2c56de5579787e31dce45a78ca68fbc19e2e14539ed1266cc3570cfa46eef8e3c1945e06762574d530b568eec74e6d1ee3a5fc7c437'
            '14759a117471167cd71194098bf0af67d92f95d1541f2b6b938691b0002c7ad76f97848af1cb9cf72e38ac7aaa530805f9c3ddf7630a2bb2f55a26339548c64f'
            '27e784217f08921d3b580dd3e81db21e6d12ca6b5509b47577f9979604e3539c782cd36c2642e981c5bd383140c98ef2bd5ef7f7f789d3793f0687791af0e796'
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
