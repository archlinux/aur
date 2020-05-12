# Maintainer: Aaron Schmocker <>, Lukas Grimm <ombre@ombre.ch>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.57.0
_gitrev=1074
_gitver=f7d709d1
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid=182-13c4ebbe50e175
_web_desktop_ver=4.29.2-e50e175
_web_tv_ver=4.29.5-13c4ebb
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine' 'libcec' 'sdl2' 'qt5-x11extras' 'qt5-quickcontrols' 'p8-platform' 'protobuf')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${_fullver}.tar.gz"
        "buildid-${_web_buildid}.cmake::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/buildid.cmake"
        "web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-desktop-${_web_desktop_ver}.tar.xz"
        "web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz.sha1::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-desktop-${_web_desktop_ver}.tar.xz.sha1"
        "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-tv-${_web_tv_ver}.tar.xz"
        "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz.sha1::https://artifacts.plex.tv/web-client-pmp/${_web_buildid}/web-client-tv-${_web_tv_ver}.tar.xz.sha1"
        'qt.patch'
        'plex.patch')
noextract=("web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz"
           "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz")
sha512sums=('8c834cd57b9161b65f85cde4ea2b7915f942594c16f846ddd1e27607cb72ad1a185b47701d9cc593143205e35c328589c731380063239ca4752aee20a1c4acc3'
            'bc1d413dd62f9dda62d43c540adbcb6699a8353780be63013661ea4352d86a8846686e10e0963e4c270c922b0d4598baa84418fe53bd49c4fef34fc3defdf985'
            'd736d58494f471d7a6df47e53ac4d4baeb597e856406acfcaeac5fcbb6bb466f1f36aca6900947da62b2a7f291489d645d636ac4ebddb228bb1a06cf2a979585'
            '64637a75f455f2226ccc1a7ec57d606c1ce4276aeba4a315d6b2ce8f74d85b9b730f8999f0e4ac15fe55871acce5841e0678648d3352b056e81bfba58a32cc51'
            '1c22bed8dd2a775ac928a6173e18eb92cbad90f44f1557536bf6a69075a90ac2c2f513f351a2958d5da030322947ae6e07ad8de73eec478ce578b1c3f208b276'
            '32942820fa411b328e0f41c3122b5e17a1b4636752bd7e0bd55a16df27102c85a22b871999994b51cf8014479b1915f6a467796b598845a215650ab74aba004d'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}/$_fullname"

    patch --forward --strip=1 --input="${srcdir}/qt.patch"
    patch --forward --strip=1 --input="${srcdir}/plex.patch"

    # All this git version junk fails, just remove it we already have the version
    sed -i 's|include(GetGitRevisionDescription)||
            s|get_git_head_revision(REFSPEC FULL_GIT_REVISION)||' \
           CMakeModules/VersionConfiguration.cmake

    mkdir -p build/dependencies
    for f in "buildid-${_web_buildid}.cmake"; do
         ln -sf "${srcdir}/${f}" "build/dependencies/${f}"
    done
    for f in "web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz"{,.sha1} "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz"{,.sha1}; do
        target="${f/-${_web_buildid}-/-}"
        ln -sf "${srcdir}/${f}" "build/dependencies/${target}"
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
}
