# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=1.1.3
_gitrev=380
_gitver=a2959899
_fullname="$pkgname-$pkgver.$_gitrev-$_gitver"
_webclientver=6ec8fed # Set in CMakeModules/WebClientVariables.cmake
_webclientbuild=149
_webclientversionnr=2.6.9
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine>=5.6' 'libcec' 'sdl2' 'qt5-x11extras')
makedepends=('cmake')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${pkgver}.${_gitrev}-${_gitver}.tar.gz"
        "https://nightlies.plex.tv/directdl/plex-dependencies/plex-web-client-plexmediaplayer/${_webclientbuild}/plex-web-client-pmp-${_webclientversionnr}-${_webclientver}.tbz2"
        'plex-media-player.desktop')
noextract=("plex-web-client-konvergo-$_webclientver.cpp.tbz2")
sha256sums=('48acb0f0ae909d381706b2b1ff472b50715a5150d5a4a81c8d3fc176234b7c53'
            '9213d353eb15a665b37fcd2e32578a8b28deeb452b6068cd4a4e720776de0352'
            'b03845b761cc18a88252b72d0c83e439006224660444d9174f53cc577f9498b6')

# NOTE:
# They host their web-client file on a nightly server that deletes things
# each release, so the build might break when a newer version is released.
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
