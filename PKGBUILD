# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.12.1
_gitrev=871
_gitver=6c71195e
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="51-4843e526542372"
_web_desktop_ver="3.55.3-6542372"
_web_tv_ver="3.56.0-4843e52"
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
sha512sums=('c006675e1f456fe72862f84fc7ba4fb822e34eb80549df16f4b09eb60b3eaa7f65305a13d5ed4b069d95363a5413e8d42afb5c7329fc2edda1801df066cce8f8'
            '4ceb66ddbc0c39d7b759d40d0520733f59d2774b0c060071467e01d7e54b6b6d218110ad1a75900f23402a5a9b494411887294f72d9b37978a286eb445dc570a'
            'b158dd12af9e087f3c297df5bc8cf751a2b873e5dea29964c3008338197fa7627c6aeaf05a49262361410e75e4e83257e53b1b753041c25849656fddd58986ca'
            '896ee70d1e5db583c9e195ece1e1931b7e455e5a278f2ae441322ca76adddef8f81e5e9c2f4b457d6d50112789e8ca1fd371c37ef5349b2db9e5f48684b9d687'
            '8c7f8dda70d025a907c2136a0a8a6f0a2dcaa6ea42cb993317395180420b8846843253da547ff140f53b19a3e6003ca40693a7ef5042a6192ecb85be40d9d85b'
            'cc3ec04a9edc794eccdc7af0158dcc477623133d628b2d37b5d395fa638d4bf2efd850faa9a8c415243698578dae385c8c5c23003347a273c4897c7ac9182f04'
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
