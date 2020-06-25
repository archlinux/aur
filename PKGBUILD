# Maintainer: Aaron Schmocker <>, Lukas Grimm <ombre@ombre.ch>
# Contributor: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=2.56.0
_gitrev=1071
_gitver=85947843
_fullver="$pkgver.$_gitrev-$_gitver"
_fullname="$pkgname-$_fullver"
_web_buildid=181-9e1b1f2e50e175
_web_desktop_ver=4.29.2-e50e175
_web_tv_ver=4.29.4-9e1b1f2
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
sha512sums=('48f73e0aeaacfaed4839b27451b5f1cac070fa6e36fa52d7c95036e8230b3e66674d3bd215ed2e209a469ffccf7590b5ca8222a4451b4d9a679c8a6da82d343a'
            'cde8999b751e397542c25420919a8c5d59ac0048fde28e82ee31f0970ded2396fd697743307087854f95f2d22198a9be0954fa79bb5cd21cc60fdb4fa15c67c1'
            '6bfbfae7654416ef0a01b7171d7328cc864fbdfac40d7b10da5101aaf94453c93258c1637d31a2557e19498c72760dd4915a98df58b12abe32ab5eb8c93c9c66'
            'abb11d9c8d4d02140a0a9f55801d73faed4683a43decff694c2ac4ddcec7f53713483ecc551ace86e6f3acdabc8109899436a09be1b702f2af2b4f39360e8fc1'
            '010a52be51e6d50be7f6716c6b6b747b11ab9cde91d12c6770b07818014cc4cd90731579b7e3ff155869149ab65a808ba7d78fbc6b01635bb19a51e707ef5af9'
            '26187ad3120952cad9116b2775b030d9fcb98ddf2014201d2dadbb4e2bd9026203e90a509effb1fc0fa045d4e200166b2e5bb3cf054ab0d76e3ae0939298460d'
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
