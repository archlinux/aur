# Maintainer: Aaron Friesen <aaron@frie.dev>
pkgbase=cataclysm-tlg-git
pkgname=(cataclysm-tlg-git cataclysm-tlg-tiles-git)
pkgname=cataclysm-tlg-git
pkgver=1.0.r20260905.2227
pkgrel=2
pkgdesc="Cataclysm: The Last Generation, a post-apocalyptic roguelike (fork of DDA) (curses)"
url="https://cataclysmtlg.com/"
arch=('x86_64')
license=("CC-BY-SA-3.0")
depends=('ncurses' 'libbacktrace' 'libgcc' 'libstdc++' 'zlib' 'glibc')
makedepends=('freetype2' 'gettext' 'hicolor-icon-theme' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'curl' 'jq')
provides=('cataclysm-tlg')
conflicts=('cataclysm-tlg-bin')
_gitbranch=master
_ghrepo="Cataclysm-TLG/Cataclysm-TLG"
# The git repo is ~10 GB so download a snapshot
source=("$pkgname.zip::https://github.com/$_ghrepo/archive/$_gitbranch.zip")
sha512sums=('SKIP')

pkgver() {
	local _date _sha
	_json="$(curl -sfL "https://api.github.com/repos/$_ghrepo/commits/$_gitbranch")"
	_date="$(jq -r '.commit.committer.date' <<<"$_json")"
	printf "1.0.r%s" "$(date -u -d "${_date/T/ }" +%Y%m%d.%H%M)"
}

build() {
	cd "Cataclysm-TLG-$_gitbranch"
	_basename="cataclysm-tlg"

	export LDFLAGS=${LDFLAGS/-Wl,-z,pack-relative-relocs/}
	export CXXFLAGS+=" -Wno-error=maybe-uninitialized"
	export CXXFLAGS+=" -Wno-error=sfinae-incomplete"
	export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
	export CXXFLAGS="${CXXFLAGS/-fcf-protection/}"
	export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection/}"

	make ZZIP_BIN="$_basename-zzip" PREFIX=/usr PCH=0 RELEASE=1 USE_XDG_DIR=1 LTO=1 RUNTESTS=0 TESTS=0 LINTJSON=0 ASTYLE=0 LOCALIZE=1 LANGUAGES=all BACKTRACE=1 LIBBACKTRACE=1
	make ZZIP_BIN="$_basename-zzip" PREFIX=/usr PCH=0 RELEASE=1 USE_XDG_DIR=1 LTO=1 RUNTESTS=0 TESTS=0 LINTJSON=0 ASTYLE=0 LOCALIZE=1 LANGUAGES=all BACKTRACE=1 LIBBACKTRACE=1 TILES=1 SOUND=1
	./lang/compile_mo.sh
}

package_cataclysm-tlg-git() {
	cd "Cataclysm-TLG-$_gitbranch"
	_basename="cataclysm-tlg"

	make ZZIP_BIN="$_basename-zzip" DESTDIR="$pkgdir" PREFIX=/usr PCH=0 RELEASE=1 USE_XDG_DIR=1 LTO=1 RUNTESTS=0 TESTS=0 LINTJSON=0 ASTYLE=0 LOCALIZE=1 LANGUAGES=all install

	# Docs
	install -d "$pkgdir/usr/share/doc/$_basename"
	cp -r doc/* "$pkgdir/usr/share/doc/$_basename"

	# Manpage
	rm "$pkgdir/usr/share/doc/$_basename/"*.6
	install -Dm644 -t "$pkgdir/usr/share/man/man6" "doc/$_basename.6"

	# License
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_basename/LICENSE"

	# Languages
	cd lang/mo
	for i in *; do
		install -d "${pkgdir}/usr/share/locale/${i}/LC_MESSAGES"
		cp "${i}/LC_MESSAGES/$_basename.mo" "${pkgdir}/usr/share/locale/${i}/LC_MESSAGES"
	done
}

package_cataclysm-tlg-tiles-git() {
	pkgdesc="Cataclysm: The Last Generation, a post-apocalyptic roguelike (fork of DDA) (tiles)"
	depends=('cataclysm-tlg-git' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'hicolor-icon-theme' 'libbacktrace')
	_basename="cataclysm-tlg"
	cd "Cataclysm-TLG-$_gitbranch"

	make ZZIP_BIN="$_basename-zzip" DESTDIR="$pkgdir" PREFIX=/usr PCH=0 RELEASE=1 USE_XDG_DIR=1 LTO=1 RUNTESTS=0 TESTS=0 LINTJSON=0 ASTYLE=0 LOCALIZE=1 LANGUAGES=all TILES=1 SOUND=1 install

	# Icons
	pushd build-data/osx/AppIcon.iconset
	for i in *.png; do
		local _isize="$(echo "$i" | sed -Ee 's/icon_([[:digit:]]+)x\1\.png/\1x\1/')"
		install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/$_isize/apps/$_basename.png"
	done
	popd

	# Manpage
	install -Dm644 -t "$pkgdir/usr/share/man/man6" "doc/$_basename-tiles.6"

	# License
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_basename/LICENSE"

	# hack: remove overlapping files
	cd "${pkgdir%/*}/$_basename-git"
	find . -type f -exec rm -f "$pkgdir"/{} \;
	cd "$pkgdir"
	find . -type d -empty -delete
}
