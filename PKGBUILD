# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgbase=cataclysm-tlg-bin
pkgname=(cataclysm-tlg-bin cataclysm-tlg-tiles-bin)
pkgname=cataclysm-tlg-bin
_tagver=1.0-2026-09-05-2230
pkgver=1.0.r20260905.2230
pkgrel=1
pkgdesc="Cataclysm: The Last Generation, a post-apocalyptic roguelike (fork of DDA) (curses)"
url="https://cataclysmtlg.com/"
arch=('x86_64')
license=("CC-BY-SA-3.0")
depends=('sh' 'ncurses' 'libbacktrace' 'libgcc' 'libstdc++' 'zlib' 'glibc')
makedepends=('freetype2' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'patchelf')
provides=('cataclysm-tlg')
conflicts=('cataclysm-tlg-git')
options=('!debug')
_basename="cataclysm-tlg"
_tlgdir="cataclysm-tlg-1.0"
_downloadurl="https://github.com/Cataclysm-TLG/Cataclysm-TLG/releases/download/cataclysm-tlg-$_tagver"
source=(
	"$pkgbase-curses.tar.gz::$_downloadurl/ctlg-linux-curses-x64-${_tagver#*-}.tar.gz"
	"$pkgbase-tiles.tar.gz::$_downloadurl/ctlg-linux-tiles-sounds-x64-${_tagver#*-}.tar.gz"
)
sha256sums=(
	'e14822702a15af374efffd219fbef8619c7e76be0c687d8a513205a2772f1cb1'
	'd575c1955fc9c7acc07884b02c34d37d1baeb49bd1481d39eb7957f3be5d847c'
)
# Both tarballs extract into the same dir ($_tlgdir); extract manually
noextract=("$pkgbase-curses.tar.gz" "$pkgbase-tiles.tar.gz")

prepare() {
	mkdir -p _curses _tiles
	bsdtar -xzf "$srcdir/$pkgbase-curses.tar.gz" -C _curses
	bsdtar -xzf "$srcdir/$pkgbase-tiles.tar.gz" -C _tiles
}

package_cataclysm-tlg-bin() {
	cd "_curses/$_tlgdir"

	install -d "$pkgdir/usr/share/$_basename"
	cp -r . "$pkgdir/usr/share/$_basename"

	# Manpage
	install -Dm644 -t "$pkgdir/usr/share/man/man6" "doc/$_basename.6"
	install -d "$pkgdir/usr/share/doc"
	mv "$pkgdir/usr/share/$_basename/doc" "$pkgdir/usr/share/doc/$_basename"
	rm "$pkgdir/usr/share/doc/$_basename/"*.6

	# License
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_basename/LICENSE"

	# Languages
	local _i
	for _i in lang/mo/*; do
		install -d "$pkgdir/usr/share/locale/$(basename "$_i")/LC_MESSAGES"
		cp "$_i/LC_MESSAGES/$_basename.mo" "$pkgdir/usr/share/locale/$(basename "$_i")/LC_MESSAGES"
	done

	# Executables
	install -d "$pkgdir/usr/bin"
	mv "$pkgdir/usr/share/$_basename/zzip" "$pkgdir/usr/bin/$_basename-zzip"
	# Use a custom launcher because the bundled launcher doesn't set --userdir,
	# and setting LD_LIBRARY_PATH is unnecessary since we use the system's SDL2
	rm "$pkgdir/usr/share/$_basename/cataclysm-launcher"
	cat >"$pkgdir/usr/bin/$_basename" <<EOF
#!/bin/sh
exec "/usr/share/$_basename/$_basename" \\
	--basepath "/usr/share/$_basename" \\
	--userdir "\${XDG_DATA_HOME:-\$HOME/.local/share}/$_basename" \\
	"\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$_basename"
}

package_cataclysm-tlg-tiles-bin() {
	pkgdesc="Cataclysm: The Last Generation, a post-apocalyptic roguelike (fork of DDA) (tiles)"
	depends=('cataclysm-tlg-bin' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'libbacktrace' 'libgcc' 'libstdc++' 'zlib' 'glibc')
	cd "_tiles/$_tlgdir"

	install -d "$pkgdir/usr/share/$_basename"
	cp -r . "$pkgdir/usr/share/$_basename"

	# Drop bundled SDL2 in favor of the system library and remove /usr/local/lib RUNPATH
	rm "$pkgdir/usr/share/$_basename/libSDL2-2.0.so.0"
	patchelf --remove-rpath "$pkgdir/usr/share/$_basename/$_basename-tiles"

	# Manpage
	install -Dm644 -t "$pkgdir/usr/share/man/man6" "doc/$_basename-tiles.6"
	install -d "$pkgdir/usr/share/doc"
	mv "$pkgdir/usr/share/$_basename/doc" "$pkgdir/usr/share/doc/$_basename"
	rm "$pkgdir/usr/share/doc/$_basename/"*.6

	# License
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_basename/LICENSE"

	# Executables
	install -d "$pkgdir/usr/bin"
	rm "$pkgdir/usr/share/$_basename/zzip"
	rm "$pkgdir/usr/share/$_basename/cataclysm-launcher"
	cat >"$pkgdir/usr/bin/$_basename-tiles" <<EOF
#!/bin/sh
exec "/usr/share/$_basename/$_basename-tiles" \\
	--basepath "/usr/share/$_basename" \\
	--userdir "\${XDG_DATA_HOME:-\$HOME/.local/share}/$_basename" \\
	"\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$_basename-tiles"

	# hack: remove overlapping files
	cd "${pkgdir%/*}/cataclysm-tlg-bin"
	find . -type f -exec rm -f "$pkgdir"/{} \;
	cd "$pkgdir"
	find . -type d -empty -delete
}
