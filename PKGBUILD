# Maintainer: Aaron Schmocker <>, Lukas Grimm <ombre@ombre.ch>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.55.0
_gitrev=1069
_gitver=2369bed9
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid=180-afec74de50e175
_web_desktop_ver=4.29.2-e50e175
_web_tv_ver=4.29.3-afec74d
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
sha512sums=('b527552c94901e70db1579f425fbeef481f1082526ca4946dfd1f56ddf4b13c52c22331b98732efb14e6c1fa4e3112f56d23a520d7b8671916725e034cb373ac'
            '8e4b4af4b2505116f0b9fc1ac974e90da7d86528e4ee170e3cc0f8bbaca1e6e7a12f97c1f0820ae5b4b886697052c8fa7d6b0719e3982e5941b0e2b10d96f06b'
            '357cb3e2ff0088976bad014479d6cc73bcc2f56b7b7ed576bc917a58a3efc37b72f81824491bfe780cd9282622aa45e217f9fec6becaec9d8b3a9c10e5a5320e'
            'cb162d4ac08bc90ab2c77e83f5022baa6e1e8526c59d4d79dc567cd5dfc621541933a0bb802e133c0ebe6b853f4ece9256317fe4c16323d24c34bc40a6f9584d'
            'b309234c51789c3143ddd08a84e7bcb7d82bd4c7a5b716ca78b48aa7b0538944855f0b8323537244e50d74420f7965497edd3adb3f85c7c0f8967c3d334a8495'
            'e46a2b169f801a6b1c97fce4d58071520d1c193a2cadddf03add2611c07ecc40d373114cab200b389fe875058bdf3600702e9a563c76aa8907863c205997d321'
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
