# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.6.0
_gitrev=803
_gitver=edcf527b
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="16-c8e3ad6207c979"
_web_desktop_ver="3.37.2-207c979"
_web_tv_ver="3.40.3-c8e3ad6"
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
sha512sums=('2feedc2b4c95040bb8adb63a9d09d88bd0b08f9b928cae132ade56f53a64903ba443cb52b52d7e1746fa2a824149cd208ecd0a3ba8a740229e0e63a8396af55c'
            'ddae5b9dfa047a969b8d8c7836dbd6b1d83dc9d1496738b3f06b0ecfd783dddec5ff478fd540198dacca37473b04227bd29ccf0823dd32401fc947f9c4318ed2'
            '3edadcb6e93d7364958e0f497a7fcd8c1fa75055e7b9e79e1e9c428b419140995aafa0b3656208406dc23c8ee99768fb8f4c4fe20d3ac35e268abbd39b6c634b'
            'f4da1242d032768606a6d18fe0f94acd90a04f8799d51cc8bf38169e74594dd2f25be1e605889b09e29cf1e077d391f0f30b9472f82c6b20cdf8b07bab4f153f'
            '9aa4c8f58bf44add9d09ffdc5bb41d2af9742f635ed26587c23188fe128b4c6a870e5e65a9dfda507fee29d3fbdd4be3b15484a3e6b0a8cc0df7d79631ac9dc9'
            '6124449ea68a749f48cbcbacbfb815e4763f61ed8cf28b137b86b368300b0f850cd58c3d3321463c56db94d8691087a4380baad9aaccc22fc597be6c2b027367'
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
