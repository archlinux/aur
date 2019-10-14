# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.43.0
_gitrev=1015
_gitver=c1291c39
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="149-466665d1b12c68"
_web_desktop_ver="3.104.2-1b12c68"
_web_tv_ver="4.9.0-466665d"
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
sha512sums=('e85bbcbde5985f6bf499bceb4af173ec72906da2b44caef576db90b1acb21eed716b1f9b6b1449ee0ade28a07f3b9592b7134a3a86d910586bc4566c9f88cf2b'
            'efbae766c97dd4a8e0ccf7d7b33dd5eff3f7c3722e0eeb3384a3355e2ae3293f7adeb8e76b6985aa61454f9c04173dcd1194266ed354e78fadf541dd62c7fcc3'
            '6fd18e93ef493b559050c68e3cf214dedb439f976c58cf88262d9370710f543b0351efc680809c2bfdecea4e260f7f362c54d6fa4c6fc3b4863faf7e0ee1ae04'
            '28cf779de46dd649b44223c2266cf65a819009ca34ecd1f9079e729970e27a58ed55ae1fa3df9f8afcd964a72b6d49980ec9c65dfec8f2b17aa82d1cbf15d838'
            '7fdb153d32d56a7e82e9591cf0929c37b978c2fa96e420e7f12e7ca6add72665c2fadb13ad6e8440a294c8905a77dc85c0f4c951212740af52da2496b707e88f'
            'faa06a7fb5bcdfcc701a399cfb3f4797eb919ee83d59215aa5151b08ea06cd3e7c6c19e6a8cb6799ae415db435a39e24d88097c045e899b9106f194c9590a6ea'
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
