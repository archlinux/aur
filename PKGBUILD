# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TingPing <tingping@tingping.se>

pkgname=plex-media-player
pkgver=1.3.5
_gitrev=689
_gitver=a36fa532
_fullname="$pkgname-$pkgver.$_gitrev-$_gitver"
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
depends=('mpv' 'qt5-webengine>=5.6' 'libcec' 'sdl2' 'qt5-x11extras' 'qt5-quickcontrols' 'p8-platform' 'protobuf')
makedepends=('cmake' 'conan')
source=("$_fullname.tar.gz::https://github.com/plexinc/plex-media-player/archive/v${pkgver}.${_gitrev}-${_gitver}.tar.gz"
        'plex-media-player.desktop')
noextract=("plex-web-client-konvergo-$_webclientver.cpp.tbz2")
sha512sums=('a97835d9aff4148ebca3b99aad4beee10e4e00c1439b2dece5cb90cf9577acbcffd9d31495f9d5bc974829a00ff1ca7a324d200c44f6828a492540e97f32ca37'
            'f24d70646babc2d248d6159442e3b9d5518276e7d8e33004f13d260953ebcd741067c507a47de25c24842e4391f4c403cdb46dc989b52fa1dde38a7312382db1')

prepare() {
	cd "$_fullname"

	# All this git version junk fails, just remove it we already have the version
	sed -i 's|include(GetGitRevisionDescription)||
	        s|get_git_head_revision(REFSPEC FULL_GIT_REVISION)||' \
	       CMakeModules/VersionConfiguration.cmake

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
	      -DFULL_GIT_REVISION="$_gitver" -DQTROOT='/usr/share/qt' ..
	make
}

package() {
	cd "$_fullname/build"

	DESTDIR="$pkgdir" make install

	install -Dm644 "$srcdir/plex-media-player.desktop" "$pkgdir/usr/share/applications/plex-media-player.desktop"
	install -Dm644 ../resources/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/plex-media-player.png"
}
