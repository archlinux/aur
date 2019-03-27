# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.30.1
_gitrev=966
_gitver=e4e7b964
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="112-47012e0ecd072f"
_web_desktop_ver="3.83.2-ecd072f"
_web_tv_ver="3.92.3-47012e0"
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
sha512sums=('49991b2b8992ee0dedce98bbb91038ec319aafd8c0f923dff6ac333206e37a95d2c9e4bee1d61e075e2f0b6eb5368063d4f0cf16b13260be4e01a8e35fc37e3c'
            '7b1cba95eba7b9e4a39b561c5051e1d97b269b93e95c52e122b6f4f9a183cc7290054fecfc001bc66d07191fdf9e3790f646207db7c86b836dcab2a9dd1ec939'
            'a0cae5784ca1640c0c714b2460e3dc15f96f5febc165bd1b3c3e59ca6d1b8396a2cdf59a9ed3ea3f3a551801476cde0555119eee3f79d2970d55f4b4f598d410'
            '4f6e1b0de56a0c8d832ab5932775424e797144c06b805fb7101e63f986063ed58fc4e54b9e86109ddd005c1d139c1957b8af96abd1a8c9ba1657eba7e2d0848e'
            '9a087f7bc6ca61f8d4f4e704fadb1816484852b07bf9b31f05580135737f44be5b1ca132981372ea07f23ae9bdf6f806b94a245127c601e93e826efe7d25f2cc'
            'fcbe7dfc2f1d4109c79d828119e22c51d709e08c1cf24cb547c1ae3cf58904eb77c379b37978170977e65b1e6d188d7f39bda7399b92b58f26464d5fc64921f5'
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
