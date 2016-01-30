# Maintainer: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=1.0.3
_gitrev=132
_gitver=16fa0ecc
_fullname="$pkgname-$pkgver.$_gitrev-$_gitver"
_webclientver=62b0efd # Set in CMakeModules/WebClientVariables.cmake
pkgrel=2
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine>=5.6' 'libcec')
makedepends=('cmake')
install='plex-media-player.install'
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${pkgver}.${_gitrev}-${_gitver}.tar.gz"
        "https://nightlies.plex.tv/directdl/plex-dependencies/plex-web-client-plexmediaplayer/latest/plex-web-client-konvergo-${_webclientver}.cpp.tbz2"
        'plex-media-player.desktop')
noextract=("plex-web-client-konvergo-$_webclientver.cpp.tbz2")
sha256sums=('ec4d7d7b1d00dfb17897af54607987dd37334b4abcb34fb7a6f9d2f8ab9bdf44'
            '247613b14692d312fd3edb36dfb34dc1dd2639f084e11084fa7c52b9a6c96a39'
            'b03845b761cc18a88252b72d0c83e439006224660444d9174f53cc577f9498b6')

prepare() {
	cd "$_fullname"

	# All this git version junk fails, just remove it we already have the version
	sed -i 's/include(GetGitRevisionDescription)//
	        s/get_git_head_revision(REFSPEC FULL_GIT_REVISION)//' \
	       CMakeModules/VersionConfiguration.cmake

	# This isn't necessary and fails
	sed -i 's|file(WRITE ${QTROOT}/bin/qt.conf ${QTCONFCONTENT})||' \
	       CMakeModules/QtConfiguration.cmake

	# They removed the web-client version shipped at the time, but the new version works at least for this release
	sed -i "s|38c0884894f8c5676fea56937b3dfb99cbd3e06f|a7134046e39d6b85de07a77cc1f21d1736c566a9|; s|f9aee64|$_webclientver|" \
	       CMakeModules/WebClientVariables.cmake

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
