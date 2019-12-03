# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.46.0
_gitrev=1031
_gitver=6dc7c723
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="156-e1595151b12c68"
_web_desktop_ver="3.104.2-1b12c68"
_web_tv_ver="4.15.0-e159515"
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
sha512sums=('0aef1e6d9df5304a9468ad498dc0b1b924cd13f025418c9b819e014193458772d914c2072568da6b38704a5cf67bb2d789f7a9ea630913a131071dd610f0052d'
            '29dbf36b3fe337b66c4ba94e1f48b5750b1939d9f8881b196bdb7c65d2066ddee2390b872b47a51da4b279cf31324d3bc103f4b870f7e85845fef5e160edb04b'
            '383c1ca84e537677ec8f07ac2e2c908437ae165cf87e1893affd60b2dd6679bf2ffde1d7cdd978357da53b4aa09f23caed07a6cb5aaad71976bd2350f72d4268'
            '2691274c8fa44c11c471df2e749eabf5026080ae0ea6b5abd1e7edae319e5544647f07eff4acff7d50b88a56751c1e105dea92c6f9c07dc8102aefe35a35b3ef'
            '4a4c133a3ab0610c457dcf2eee21e7c8f786cdb7b234b121c1a9435451dcd008d5473bac3ac79dc9dbe599a35a62c50e05ea6bd1112ccdc5ab9b2ff349ecb432'
            '73415f8c65f7afda83bbfa88578f3092fe437019fc713665eab48595787b1d0be885fb8fd20518ddeaf767d924d3fc461eba2aa59cbaf6bedf5ef7cbecf4e568'
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
