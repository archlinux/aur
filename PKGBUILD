# Maintainer: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=1.1.1
_gitrev=293
_gitver=cc2cc067
_fullname="$pkgname-$pkgver.$_gitrev-$_gitver"
_webclientver=4cbcd79 # Set in CMakeModules/WebClientVariables.cmake
_webclientbuild=132
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine>=5.6' 'libcec' 'sdl2')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${pkgver}.${_gitrev}-${_gitver}.tar.gz"
        "https://dl.tingping.se/mirror/plex-web-client-konvergo-${_webclientver}.cpp.tbz2"
        'plex-media-player.desktop')
noextract=("plex-web-client-konvergo-$_webclientver.cpp.tbz2")
sha256sums=('ac746bd2a5196c8ea1bf62a99c43f44f90b092410302524bb68fcd79336c3734'
            'd1a2b0d34e137f3eb7a0c09d7da76f30158b5ac9504289c1b74bd56ae1a58995'
            'b03845b761cc18a88252b72d0c83e439006224660444d9174f53cc577f9498b6')

# NOTE:
# They host their web-client file on a nightly server that deletes things
# each release, so I simply mirror the file on my personal server.
# The build system verifies the checksum of the file and it must be
# a GPL compatible license so everything should be kosher.
#
# The orignal URL should it be needed:
# "https://nightlies.plex.tv/directdl/plex-dependencies/plex-web-client-plexmediaplayer/${_webclientbuild}/plex-web-client-konvergo-${_webclientver}.cpp.tbz2"
#

prepare() {
	cd "$_fullname"

	# All this git version junk fails, just remove it we already have the version
	sed -i 's|include(GetGitRevisionDescription)||
	        s|get_git_head_revision(REFSPEC FULL_GIT_REVISION)||' \
	       CMakeModules/VersionConfiguration.cmake

	# Use our downloaded copy of web-client
	mkdir -p build/src
	ln -sf {$srcdir,build/src}/plex-web-client-konvergo-${_webclientver}.cpp.tbz2
}

build() {
	cd "$_fullname/build"

	cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 \
	      -DFULL_GIT_REVISION="$_gitver" -DQTROOT='/usr' ..
	make
}

package() {
	cd "$_fullname/build"

	DESTDIR="$pkgdir" make install

	install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
	install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
