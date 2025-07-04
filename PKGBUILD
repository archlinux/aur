# Maintainer: Lawrence González <pentestian [at] airmail [dot] cc>
# Contributor: Jan Cholasta <grubber at grubber cz>

_name=gzdoom
pkgname=lzdoom
_pkgver=l4.11.4
pkgver=4.11.4
pkgrel=1
pkgdesc='Advanced Doom source port with OpenGL support (legacy version)'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD-3-Clause AND GPL-3.0-or-later AND LGPL-3.0-or-later AND bzip2-1.0.6 AND LicenseRef-DUMB AND LicenseRef-Lucent')
conflicts=('lzdoom-bin')
options=("!lto")
depends=('hicolor-icon-theme' 'sdl2' 'zmusic' 'libvpx' 'bzip2' 'glibc' 'gcc-libs')
makedepends=('cmake' 'fluidsynth>=2' 'gtk3')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
			'chexquest3-wad: Chex Quest 3 game data'
			'doom1-wad: Doom shareware game data'
			'fluidsynth>=2: FluidSynth MIDI device'
			'timidity++: Timidity++ MIDI device'
			'freedm: FreeDM game data'
			'freedoom1: Freedoom: Phase 1 game data'
			'freedoom2: Freedoom: Phase 2 game data'
			'gtk3: IWAD selection dialog'
			'gxmessage: crash dialog (GNOME)'
			'hacx-wad: HacX game data'
			'harmony-wad: Harmony game data'
			'heretic1-wad: Heretic shareware game data'
			'hexen1-wad: Hexen demo game data'
			'kdialog: crash dialog (KDE)'
			'libsndfile: WAV/FLAC/OGG audio support'
			'mpg123: MP3 audio support'
			'openal: in-game sound'
			'soundfont-fluid: FluidR3 soundfont for FluidSynth'
			'strife0-wad: Strife shareware game data'
			'square1-wad: The Adventures of Square, Episode 1 game data'
			'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
			'xorg-xmessage: crash dialog (other)')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/drfrag666/${_name}/archive/refs/tags/${_pkgver}.tar.gz"
		"${pkgname}.desktop"
		'gcc-15-fix-1.patch'
		'gcc-15-fix-2.patch')
sha256sums=('dd4fc8ea2a566cb6b614b1aede39a0cc57a4f9d81b3c0f5e74323e92aea8c05e'
            '7b3ffa8b74e5d6283206dd074b09e944aa07670ec7d7b1fe587350ffb91819b3'
            '678f1246a9ec7f3872e47838c6989d968964c405ab56c7d283909b51d52a82b7'
            '6127d40af0388338d132576c4b4664a9fbe1319fc7ecf7bf1a19af542fa8a09c')

prepare() {
	cd "$srcdir/${pkgname}-$_pkgver"

	# Patches GCC 11 errors
	sed -i '/^#include "types\.h"$/a \#include <limits>' src/common/scripting/core/types.cpp

	# Patches soundfonts paths
	sed -i -f - src/gameconfigfile.cpp <<- "EOF"
		\%^\t\tSetValueForKey("Path", "/usr/share/games/doom/fm_banks", true);$% a \
		\t\tSetValueForKey("Path", SHARE_DIR "/soundfonts", true);\
		\t\tSetValueForKey("Path", SHARE_DIR "/fm_banks", true);\
		\t\tSetValueForKey("Path", "/usr/share/soundfonts", true);
		EOF

	# Patches GCC 15 errors
	patch -p1 -i "$srcdir/gcc-15-fix-1.patch"
	patch -p1 -i "$srcdir/gcc-15-fix-2.patch"
}

build() {
	cd "$srcdir/${pkgname}-$_pkgver"

	local _cflags="-ffile-prefix-map=\"$PWD\"=. \
					-DSHARE_DIR=\\\"/usr/share/$pkgname\\\" \
					-DFLUIDSYNTHLIB2=\\\"libfluidsynth.so.2\\\""
	cmake -DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_C_FLAGS="${CFLAGS} ${_cflags}" \
			-DCMAKE_CXX_FLAGS="${CXXFLAGS} ${_cflags}" \
			-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -Wl,-z,noexecstack" \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DINSTALL_PATH=bin \
			-DINSTALL_PK3_PATH="share/$pkgname" \
			.
	make
}

package() {
	cd "$srcdir/${pkgname}-$_pkgver"

	make -C build install DESTDIR="$pkgdir"
	install -D -m644 "soundfonts/${pkgname}.sf2" \
			"$pkgdir/usr/share/$pkgname/soundfonts/${pkgname}.sf2"
	install -D -m644 fm_banks/GENMIDI.GS.wopl \
			"$pkgdir/usr/share/$pkgname/fm_banks/GENMIDI.GS.wopl"
	install -D -m644 fm_banks/gs-by-papiezak-and-sneakernets.wopn \
			"$pkgdir/usr/share/$pkgname/fm_banks/gs-by-papiezak-and-sneakernets.wopn"

	install -D -m644 "$srcdir/${pkgname}.desktop" \
			"$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -D -m644 src/posix/zdoom.xpm \
			"$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.xpm"
	install -D -m644 "ico_${pkgname}.png" \
			"$pkgdir/usr/share/icons/hicolor/496x496/apps/${pkgname}.png"

	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" docs/licenses/*
}
