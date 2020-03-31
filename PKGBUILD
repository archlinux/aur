# Maintainer: Aaron Schmocker <>, Lukas Grimm <ombre@ombre.ch>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.54.0
_gitrev=1067
_gitver=1a7bc4f6
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid=179-6104f84e50e175
_web_desktop_ver=4.29.2-e50e175
_web_tv_ver=4.29.2-6104f84
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
sha512sums=('28edda1a0e9204cadaf1e4fa98b1288f650410d1487f0eb316298a5fb8ce7e94376730ee3c6709f5630e01a8289d84d8f78bdbe4a9a83ccb04248f486dc534b3'
            '4864f558147557abc98c6bafe941b23a69d2b0882378c64c14b24c0071bd10e57d8621006e913728aa671b10cf153c212af04ad551258267c7e4aaac0f725e3f'
            '8723f1ae77147dcbec119f3daaa9dccb9ee0a4a703b36121ebe507ee2f653c0a08bbb3c0220e99fe3ff12d67ed2cd27ec5eac0637867a4a0a23fd1cab09cdb7a'
            '5b1583727b63e0e438d6670256ee3cd1e71c87df868c40cabbb5d314efb170e54232b38197f0a359ccf00a219c2eb60482478eb340bc0556f61b23f7edba680d'
            '1f07474ecd5e8e0691e88a0972cf90cf33d5f0521bb36d85b4b19cba5fa8cea1061740cc1af72bba3b22c8cff76079fd97f8e031d81cfcced4ccea0f77a33988'
            '790c617931b881e88d3ed2119fdee74f24cc32bb00498706242c3caea5bd05b7ff9200a26c05f37dee2cbf61123fb58968ac254adb54a9f9da761159a0e92c8e'
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
