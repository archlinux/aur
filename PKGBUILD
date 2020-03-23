# Maintainer: Aaron Schmocker <>, Lukas Grimm <ombre@ombre.ch>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.53.0
_gitrev=1063
_gitver=4c40422c
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid=176-21c9724ca0ff70
_web_desktop_ver=4.26.1-ca0ff70
_web_tv_ver=4.29.1-21c9724
pkgrel=2
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
sha512sums=('660bbf42d2a646a3580b76ab029971dfe840985a5ec2962fdba1d5b989ff39aca85c449508d131c930ba9860c0b6de8c73a26ff5e0ed43409897bb663df61e0c'
            'a190dee67a8ecc86b91d0a0411061624e9b3e68f1132cbc5c6abdf8a00268b2785ef3621db908cb019bdd9f1113703ade0b2e4b137028947e93f8897f50a1fa2'
            '346b8d276bbd27a550884e231ad7debd2da6a3f8a328d7e0df6dc96d4a658e89c2b6fea86dea721b9432aa9b36d09304de3f03a7cd00e296b730401cf913b8c5'
            '8598d8823ec8c54fdcf3986b19974d7a8dcbbc4570662e56e53a2bb15370d4883cdbe7e366b511465cd293bd192655322739c0add61104ed6ae5e8941536c1fa'
            'ad5d153edaa1b2d1e9df7bec54c325b569925766caf4e8a4c0be546fef61bfe20f96f92d8238287e28e920e3848f98ace1011f5994d3fa7d12a7f78aa6c317d8'
            '5f4f1bed9bcde56901dd5fcb0cebe4b6706e0169535102d3577a9f9ef263fe97af4192c178482b46b535ac7113eee61b5e777ebbbe34c5f7a0e22dec6d5dbe18'
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
