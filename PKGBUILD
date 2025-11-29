
# Maintainer: Leah Anderson <leah@chromebooks.lol>
pkgname=uzdoom
pkgver=4.14.3
pkgrel=2
pkgdesc="UZDoom is a feature centric port for all Doom engine games, based on GZDoom, adding an advanced renderer and powerful scripting capabilities"
arch=(x86_64)
url="https://zdoom.org"
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2' 'gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'openal' 'sdl2' 'zmusic')
makedepends=('python' 'cmake' 'desktop-file-utils' 'ninja' 'git')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'freedm: FreeDM game data'
            'freedoom: Freedoom game data'
            'gxmessage: crash dialog (GNOME)'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'kdialog: crash dialog (KDE)'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
	    'xorg-xmessage: crash dialog (other)')
optdepends_x86_64=('vulkan-driver: Vulkan renderer'
                   'vulkan-icd-loader: Vulkan renderer')
provides=('uzdoom')
options=(!lto)
conflicts=('uzdoom-git' 'uzdoom-bin' 'uzdoom-appimage')
source=("https://github.com/UZDoom/UZDoom/archive/refs/tags/4.14.3.tar.gz")
sha256sums=('6ee381395e249fd02a8484e0e98330afd1cdf222b26cafece7b3d3f5188d7014')
setup() {
	cd "UZDoom-$pkgver"
	./auto-setup-linux.sh
}

build() {
	cd "UZDoom-$pkgver"
	mkdir -p build
	cd build
	cmake -DINSTALL_PK3_PATH=share/uzdoom -DINSTALL_SOUNDFONT_PATH=share/uzdoom -DINSTALL_RPATH=/usr/lib -DSYSTEMINSTALL=ON -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/uzdoom\\\"" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -G Ninja ..
	cmake --build . --config Release
}

package() {
	cd "UZDoom-$pkgver"
	cd build
	DESTDIR="$pkgdir" ninja install
	install ../src/posix/zdoom.xpm -D -m 644 "$pkgdir"/usr/share/icons/hicolor/256x256/apps/uzdoom.xpm
	install ../src/posix/freedesktop/org.zdoom.UZDoom.desktop -D -m 644 "$pkgdir"/usr/share/applications/org.zdoom.UZDoom.desktop
}
