# Maintainer: RivenSkaye <riven@skaye.blog>
# Contributor: eientei95 <einstein95 at windowslive dot com>

_pkgname=gbe-plus
pkgname=${_pkgname}-rec-git
pkgver=r4915.95891bf1
pkgrel=1
pkgdesc="DMG/GBC/GBA/Pokemon Mini emulator and experimental NDS emulator with support for playback using Agatsuma and Play-Yan. Successor to GB Enhanced."
arch=('x86_64')
url="https://github.com/shonumi/gbe-plus"
license=('GPL2')
depends=('qt5-base' 'sdl2_net' 'sdl2_image')
makedepends=('cmake' 'git')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}-rec" "${_pkgname}" "${_pkgname}-git")
source=("git+https://github.com/shonumi/gbe-plus.git"
		"gbe_plus.desktop")
sha256sums=('SKIP'
			'22438f75def3d5ccc06b662f9120508eb0a77ca199bbca9aefba59f6294cc5b3')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/${_pkgname}/build"
	cd "$srcdir/${_pkgname}/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DIMAGE_FORMATS=ON
	make -j`nproc`
}

package() {
	# .desktop files are defined by the XDG Desktop Entry specification, default to $XDG_USER_HOME
	# Fall back to $HOME so the path is likely to exist
	user_home="${XDG_USER_HOME:-$HOME}"
	# Due to how PKGBUILD, the chroot env this runs in doesn't actually contain this dir.
	# The warning is harmless but annoying
	mkdir -p "$user_home/.gbe_plus"
	cd "$srcdir/${_pkgname}/build"
	make DESTDIR="$pkgdir" install
	install -Dm644 ../src/data/icons/gbe_plus.png "${pkgdir}/usr/share/pixmaps/gbe_plus.png"
	sed "s:Path=USER_HOME:Path=$user_home:" ../../../gbe_plus.desktop > prepped_gbe_plus.desktop
	install -Dm755 prepped_gbe_plus.desktop "${pkgdir}/usr/share/applications/gbe_plus.desktop"
}
