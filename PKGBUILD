# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.19.1
_gitrev=904
_gitver=f679df4f
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="73-9cb69aa69c1af1"
_web_desktop_ver="3.69.0-69c1af1"
_web_tv_ver="3.70.3-9cb69aa"
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
sha512sums=('d1d9079a3decd86c0485bb4e6cc7f7034cb33e825e693c0d8ed199bcee3d10f5f1f33f539cb167f8fa9b3692f8087f11a55b14546ebb5e06b6112038690de53a'
            'bd5f1f09043c3dde7639da48967087792be78ab5768ce62ea1052026a92aa760c790f5cedc54a3e715d07f3e7fdf580ecf27351cbdadcfcb97879f8cba257b78'
            'e0255ad3799255c99fe143ce4c447dbb2ebd0fade1d26dece19a8975cc99db2de9bb3f3d40d3abdba3fc75909984c9404cdbb9507edabf2e01a55f4be6318084'
            'de17990529f91e5cfd89bf9444a27c04608775b2bdb66996078963b445bc8457d46ec824d31c6b781d13160babfa5b3e98ec4a188a33747f7f3f6ec67ff30ea2'
            '3d41e48fb7cbc5ac3e76396ff7afbfcbc308afe338a0720d87835f705be7cc0d354c29e5a50d5ba4aba7b84c22ec3f41ada849df281dafde81e06ee405b8e4fc'
            'd77222d7e84a58b5c4c8efd05b211a4d56d53caa86462dacd6ba2024cea9b17e233f8da0eb8949c32a87db6af6b9644d48a6ec3a4b8e169cb2d3059b874e4579'
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
