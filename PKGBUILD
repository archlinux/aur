# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=1.2.2
_gitrev=555
_gitver=d1355001
_fullname="$pkgname-$pkgver.$_gitrev-$_gitver"
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine>=5.6' 'libcec3' 'sdl2' 'qt5-x11extras' 'qt5-quickcontrols' 'p8-platform' 'protobuf')
makedepends=('cmake' 'conan')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${pkgver}.${_gitrev}-${_gitver}.tar.gz"
        'plex-media-player.desktop')
noextract=("plex-web-client-konvergo-$_webclientver.cpp.tbz2")
sha512sums=('6b3cd614a68c7e81dbc7fcefdb2aeb65e578e968d87f1fc3ca8c567b7c14751173439d0a711fa24e52819dbe068bfd1bc6fa1d6423a8b86b1f54dadfb83cc80f'
            'f24d70646babc2d248d6159442e3b9d5518276e7d8e33004f13d260953ebcd741067c507a47de25c24842e4391f4c403cdb46dc989b52fa1dde38a7312382db1')

prepare() {
	cd "$_fullname"

	# All this git version junk fails, just remove it we already have the version
	sed -i 's|include(GetGitRevisionDescription)||
	        s|get_git_head_revision(REFSPEC FULL_GIT_REVISION)||' \
	       CMakeModules/VersionConfiguration.cmake

    sed -i 's|#include <libcec/|#include <libcec3/|' \
           src/input/InputCEC.h

    conan_remote="https://conan.plex.tv"
    msg2 "Checking for plex conan remote"
    if conan remote list | grep -q plex; then
        msg2 "plex remote exists for conan"
    else
        msg2 "Adding ${conan_remote} as a conan remote"
        conan remote add plex "$conan_remote"
    fi

	mkdir -p build
    cd build
    conan install ..
}

build() {
	cd "$_fullname/build"

	cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 \
	      -DFULL_GIT_REVISION="$_gitver" -DQTROOT='/usr/share/qt' -DCEC_INCLUDE_DIR=/usr/include/libcec3 \
          -DCEC_LIBRARY=/usr/lib/libcec.so.3 ..
	make
}

package() {
	cd "$_fullname/build"

	DESTDIR="$pkgdir" make install

	install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
	install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
