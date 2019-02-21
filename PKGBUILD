# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.28.0
_gitrev=952
_gitver=5408ca22
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="101-fc5ff2d0043312"
_web_desktop_ver="3.83.1-0043312"
_web_tv_ver="3.88.0-fc5ff2d"
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
sha512sums=('ec6ed6994194d8f8915b3fcf3849b0ea2cd1c26a0d2d1ff5115445a3517a8ca54003c85b4fc76d1b3476106e374a69c5af90aa01fb7839c90810ed1ed74b56f6'
            'd1899678d8e9d42efc96fcc5cf30979e71bd802f231bd7927cc27da540c620e81c0037a1fbfc5abd1d135785259f80958dac3a1a509631f1c93eb0294b84262f'
            '8428ccae78d7edb960a518b38547f620009dfa2e85153a9ba26ba57a6fa13bc56afd88b5126b01de40b38cdad111b108c181c90c67bff782694a4ef099d56f40'
            '14e3219f161a3d2e8202f0a55153f93f9e4a6c84468bb26c1c5c5232a146986a21fdde452cf57a6eb3c0857bdfad026a733729034ca0b73bf2366bdec174ddaf'
            'bd92fc5a3be690d43e1ac35df495da1438d368f8d33a82e059ba8dfb968f74ff5d451adda08558cb3631dc3312e516e26b418d06e328842596f7ca05355bbd0f'
            '53658e14970d0c5b35ec74df2e0ed39d3d2b0e7b6fb922937ec1208333693ced3357247989b4132bf490dbad84924b56f0aaf0d599f784a815b34ab63fe4d353'
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
