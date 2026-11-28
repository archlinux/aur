# Maintainer: kinker31 <dp223171@gmail.com>
pkgname=nyan-doom
pkgver=1.6.2
pkgrel=2
pkgdesc="A fork of DSDA, with an emphasis on innovative and QoL features."
arch=('x86_64')
url="https://github.com/andrikpowell/nyan-doom"
license=('GPL-2.0-only')
depends=('glu' 'libspng' 'sdl2-compat' 'sdl2_mixer' 'libzip' 'libsndfile' 'hicolor-icon-theme')
optdepends=('fluidsynth' 'libmad' 'libxmp' 'dumb' 'portmidi' 'discord-rpc')
makedepends=('cmake' 'imagemagick')
source=("https://github.com/andrikpowell/nyan-doom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5ae37cfa9386154895aac53e08e7586c3f0317cd2c7729c5e499c560914bd8f2')

build() {
	local _cmake_opts=(
		Wno-dev
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_BUILD_TYPE=Release
	)
	cd "${srcdir}/nyan-doom-${pkgver}/prboom2"  
	if [[ -f /usr/include/discord_rpc.h ]]; then
		_cmake_opts+=(-DWITH_DISCORD_RPC=ON)
	else
		_cmake_opts+=(-DWITH_DISCORD_RPC=OFF)
	fi
	cmake . "${_cmake_opts[@]}"
	make
}

package() {
  cd "${srcdir}/nyan-doom-${pkgver}/prboom2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ICONS/nyan-doom.png "${pkgdir}"/usr/share/pixmaps/nyan-doom.png
  install -Dm644 ICONS/nyan-doom.desktop "${pkgdir}"/usr/share/applications/nyan-doom.desktop
}
