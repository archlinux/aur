# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=lmms-prerelease-bin
pkgver=1.3.0.alpha.2
_name=lmms
_tag=1.3.0-alpha.2
pkgrel=1
pkgdesc='The Linux MultiMedia Studio (pre-release)'
arch=(x86_64)
url='https://lmms.io'
license=(GPL-2.0-or-later)
provides=(lmms)
conflicts=(lmms)
depends=(
	libgcc
	libstdc++
	glibc
	hicolor-icon-theme
	libx11
	libxcb
	alsa-lib
	fftw
	fltk
	fluidsynth
	lame
	libjack.so=0-64
	libogg
	libpulse
	libsamplerate
	libsndfile
	libvorbis
	lilv
	portaudio
	qt5-base
	qt5-svg
	qt5-x11extras
	sdl2
	sndio
	util-linux-libs
	zlib
)
makedepends=(patchelf)
optdepends=(
	'carla: Carla plugin support'
	'wine: Windows VST plugin support'
	'lib32-gcc-libs: VST plugin support'
	'lib32-glibc: VST plugin support'
	'pulseaudio: pulseaudio support'
	'qt5-wayland: Wayland support'
)
options=(!lto !debug)
source=(
	"https://github.com/LMMS/lmms/releases/download/v${_tag}/lmms-${_tag}-linux-${CARCH}.AppImage"
	"https://raw.githubusercontent.com/LMMS/lmms/v${_tag}/LICENSE.txt"
)
b2sums=('03271113a252b0e7b8c948117375fcbc22c823089e2eeb17b1dfdbca66d569b3d7c2ecf124a50ee8422f350e0b36aaadd8724f0ecfc70f77170d4c069f962e7f'
	'e75b5b9174d5e2500fafeafe131877fb6251037f1f5ce2a2a26a83b3540ff8b67605c08cbd332f61b759f09cab2e02c27a5c3e0659bdabf57fd9c5cc107eb9e5')

build() {
	local appimage="lmms-${_tag}-linux-${CARCH}.AppImage"

	rm -rf squashfs-root
	chmod +x "$appimage"
	"./$appimage" --appimage-extract >/dev/null

	# Keep only the bundled libraries without a compatible Arch package:
	# - libcarlabase/libvstbase/librtaudio/librtmidi are LMMS internals,
	# - libgig.so.10 / libstk-4.6.1 / libsoundio.so.2 have no matching system
	#   soname (the system ships libgig.so.14, stk 5 and no libsoundio).
	# - Everything else (Qt, SDL2, audio codecs, GTK, ICU, etc.) comes from the
	#   system and has the same soname as the bundled copy.
	local f
	for f in squashfs-root/usr/lib/*; do
		case "${f##*/}" in
		lmms | \
			libcarlabase.so | \
			libgig.so.10 | \
			librtaudio.so.6 | \
			librtmidi.so.6 | \
			libsoundio.so.2 | \
			libstk-4.6.1.so | \
			libvstbase.so)
			;;
		*)
			rm -rf "$f"
			;;
		esac
	done
	rm -rf squashfs-root/usr/plugins squashfs-root/usr/bin/qt.conf
	rmdir squashfs-root/usr/share/pixmaps

	# Carla's native plugin library is installed to /usr/lib/carla. libcarlabase.so
	# exists twice: lmms loads the copy in lib/lmms as a plugin, so patch both.
	patchelf --add-rpath /usr/lib/carla \
		squashfs-root/usr/lib/libcarlabase.so \
		squashfs-root/usr/lib/lmms/libcarlabase.so
}

package() {
	local prefix="/usr/lib/$pkgname"

	install -d "$pkgdir$prefix" "$pkgdir/usr/bin" "$pkgdir/usr/share"
	cp -a --no-preserve=ownership squashfs-root/usr/. "$pkgdir$prefix/"
	mv "$pkgdir$prefix"/share/{applications,icons,man,mime} "$pkgdir/usr/share/"
	ln -s "$prefix/bin/lmms" "$pkgdir/usr/bin/lmms"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
