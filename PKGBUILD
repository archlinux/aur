# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.51.0
_gitrev=1048
_gitver=dda6b0b1
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid="168-8a312e779b9a92"
_web_desktop_ver="4.24.1-79b9a92"
_web_tv_ver="4.25.1-8a312e7"
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
        'qt.patch')
noextract=("web-client-desktop-${_web_buildid}-${_web_desktop_ver}.tar.xz"
           "web-client-tv-${_web_buildid}-${_web_tv_ver}.tar.xz")
sha512sums=('14f7060baea483addbe973ee658c76e02412dc14b21ce53613c0f768a22ea3f54fea3d4e54ed1067be2befba89c561fbf2aa430696f0f1d6b6481034226a1171'
            '5811bf41975c8e26aa51d97c8fae0e9c37a8b2e3717d8edeacb6ce7632a1a316a7ee35427fd0bafd3cfef2f3ccf49852064d1dedd1b7fc484e27e4e79271e58e'
            '35a054d9d2de674dde02e00944e4d9d04faa2184698304d892accb420aec566d18a312f508e4a2cb00316604f841609af829e7aed6d33c5dab8aa68576545bcd'
            '6ba1a848d1c8ec7362346786f53faa0e7f113f6ade2f3bab87b1248dd09391b11edb564cb1b49ea1e31ea1e48758fae4fb3639890d864e32e4eaf78d04b49c2c'
            '43d8ccbb375face374cec6e929a0c7b96bbcd767877690d97d0313a17d8be93c5e0f08d80963dace8338ecb43c082492b98ac0125a8d623de9537036498c7694'
            '61a0d99347f3b863a560c2cb94d5cad46b95bfb5b021038779db06b8c6a2495022a3c9093d33387aa138919908f2b90dc71f338677a4412471449275e4ef3e82'
            'SKIP')

prepare() {
    cd "${srcdir}/$_fullname"

    patch --forward --strip=1 --input="${srcdir}/qt.patch"

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
