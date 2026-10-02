# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=terminal-doom
_tag=zig-v0.16
pkgver=0.1.0
pkgrel=1
pkgdesc="Play DOOM in modern terminals"
arch=('x86_64' 'aarch64')
url="https://github.com/cryptocode/terminal-doom"
license=('GPL-2.0-only' 'MIT')
depends=('glibc')
makedepends=('zig>=0.16.0')
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz" "libvaxis-4e5a065.tar.gz::https://github.com/rockorager/libvaxis/archive/4e5a065940825f147fa5ce0df54d1ef0d50ecee7.tar.gz" "zigimg-d695acd.tar.gz::https://github.com/zigimg/zigimg/archive/d695acd97c02e57bb151e8f659d1280f5cd6ca70.tar.gz" "uucode-2826a37.tar.gz::https://github.com/jacobsandlund/uucode/archive/2826a37a4562284fdacd8fa029d49509cc9bffcd.tar.gz")
noextract=("libvaxis-4e5a065.tar.gz" "zigimg-d695acd.tar.gz" "uucode-2826a37.tar.gz")
sha256sums=('43362e219ce914cefe63a43212f64fe7a14a03fd5784dc76540f0c280cab5ff7'
            '234320f142a39890cddceecebaec0f0aaa474e9f9c6ff2c9f581540c3a91e5e8'
            '487794b6f28a8380d17a4960d3c53ef2f466d3075b92e8ebf3f84ec6b568545d'
            '7e76fc7fab1e7ac728c52b35bbb3e5b8c639841abfc7fe1a4bcb13050594bc9e')

prepare() {
	cd "$pkgname-$_tag"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	local _f
	for _f in libvaxis-4e5a065 zigimg-d695acd uucode-2826a37; do
		zig fetch "$srcdir/$_f.tar.gz"
	done
	sed -i 's|"sound/ds%s.wav"|"/usr/share/terminal-doom/sound/ds%s.wav"|; s|"sound/%s.mp3"|"/usr/share/terminal-doom/sound/%s.mp3"|' src/miniaudio/doom_miniaudio_sound_bridge.c
}

build() {
	cd "$pkgname-$_tag"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig build -Doptimize=ReleaseSafe -Dcpu=baseline
}

package() {
	cd "$pkgname-$_tag"
	install -Dm755 "zig-out/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname"
	install -Dm644 doom1.wad "$pkgdir/usr/share/$pkgname/doom1.wad"
	install -Dm644 sound/* -t "$pkgdir/usr/share/$pkgname/sound"
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'LAUNCHER'
#!/bin/sh
# Point the engine at the shareware WAD unless the user chose another IWAD directory
export DOOMWADDIR="${DOOMWADDIR:-/usr/share/terminal-doom}"
exec /usr/lib/terminal-doom/terminal-doom "$@"
LAUNCHER

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 licenses/LICENSE-gpl "$pkgdir/usr/share/licenses/$pkgname/LICENSE-gpl"
	install -Dm644 licenses/LICENSE-mit "$pkgdir/usr/share/licenses/$pkgname/LICENSE-mit"
}
