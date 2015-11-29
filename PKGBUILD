# Maintainer: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=1.0.2.70
_gitver=15a01542
_webclientver=c1f55d5 # Set in CMakeModules/WebClientVariables.cmake
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine >= 5.6' 'libcec')
makedepends=('cmake')
install='plex-media-player.install'
source=("$pkgname-$pkgver-$_gitver.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${pkgver}-${_gitver}.tar.gz"
        "web-client-$_webclientver.cpp.bz2::https://nightlies.plex.tv/directdl/plex-web-client-plexmediaplayer/master/plex-web-client-konvergo-${_webclientver}.cpp.bz2"
        'plex-media-player.desktop')
noextract=("web-client-$_webclientver.cpp.bz2")
sha256sums=('b15993cc80430dde411bfbfc0ef206b2ad2be291ab0988f2237da2b265a3be35'
            '80f1e8801001f4a488fa4b45b95709062f4a4589aad4a24b3787030f82a205b4'
            'b03845b761cc18a88252b72d0c83e439006224660444d9174f53cc577f9498b6')

prepare() {
	cd "$pkgname-$pkgver-$_gitver"

	# All this git version junk fails, just remove it we already have the version
	sed -i 's/include(GetGitRevisionDescription)//
	        s/get_git_head_revision(REFSPEC FULL_GIT_REVISION)//' \
	       CMakeModules/VersionConfiguration.cmake

	# Use our downloaded copy of web-client
	mkdir -p build/src
	ln -sf {$srcdir,build/src}/web-client-${_webclientver}.cpp.bz2
}

build() {
	cd "$pkgname-$pkgver-$_gitver/build"

	cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 \
	      -DFULL_GIT_REVISION="$_gitver" ..
	make
}

package() {
	cd "$pkgname-$pkgver-$_gitver/build"

	DESTDIR="$pkgdir" make install

	install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
	install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
