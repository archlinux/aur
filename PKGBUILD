# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.14.1
_gitrev=880
_gitver=301a4b6c
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="56-23317d81e49651"
_web_desktop_ver="3.57.1-1e49651"
_web_tv_ver="3.60.1-23317d8"
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
sha512sums=('aef1cbd053f94b18636b7c269b77b75371f8523a683c9bda1da9b3fb582e993b41e4b09ebee4bfef0ea296d3dc9918e4219a0ad51996330c5b7cb91547026d45'
            '4bb132d09bb86366f0fe03ad948ecf87f0ab4740de5e398ebfaebce0f2f18819219e1100e03d293142a5980f60b1f38b24c5c3fc11708a95f6e4d68521c5b578'
            'fdf0e798374ff70f4af0ee92bcf7d248b4647682c2b746df2ed8cb1ebf2ae766bb530db4656ef9d37ca1dac771152c81bd43984d18f5c89f224dbdb5c38f456e'
            'ec229e7f0886eda1801890f7dae63def3c57dc13fe1ce0013b93e3905efd31a3e3faa3b0014dc5c76c42e32763658d51e8f6bfd4cc8714201902628ec28e5629'
            'a970a63420abeb15d4a0c0c0ac392df5c9fee47360ae3d1ce80e14465ca439c1ea635e2da40fd2f9c0fdb0ea36ce3f169fda41f90dfb0994a1a1fb901abd768f'
            '5815bfd2f818539b4c51fe5e9013b1ffd0906c72f130625f31c0a2cdb9fb56ad5621c904c961a24d1bc05b1741bcaf83d6cfddb1d130feb0d9fb3c30f39a5255'
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
