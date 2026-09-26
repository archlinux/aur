# Maintainer: Aaron Friesen <aaron@frie.dev>
#
# Based on the official `nethack 5.0.0-1` PKGBUILD by:
#     Ivy Foster <iff@archlinux.org>
#     schuay <jakob.gruber@gmail.com>
#     kevin <kevin@archlinux.org>
#     Christian Schmidt <mucknert@gmx.net>
#     Markus Meissner <markus@meissna.de>
#     Nick Erdmann <erdmann@date.upb.de>
#
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=xnethack
pkgver=10.0
pkgrel=1
pkgdesc='A fork of the dungeon exploration game NetHack'
arch=('x86_64')
url='https://github.com/copperwater/xNetHack'
license=(NGPL)
depends=(filesystem ncurses gzip lua54)
_tag=xnh$pkgver
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
	use-system-lua54.patch
	tmpfiles.conf
)
sha256sums=(
	'bceedf4fc964adb2ba98f2d0c3af70c818db526b9d17c7085a806ed0ff70229b'
	'ddeb0ef6480f652ce618c33e06bc452f3dfe1f550d40777a76ab70473c7aab10'
	'6dc7cca8b3b1c3fc94967ca5557a91a30404a360bd2c2fba6f6c6f7fecc91401'
)
_srcdir=xNetHack-$_tag

_lua_version_expected() {
	local lua_release
	lua_release=$(awk -F '"' '$1 ~ /^#define LUA_VERSION_RELEASE/ { print $2; exit }' /usr/include/lua5.4/lua.h)
	printf '%d' "$((50400 + lua_release))"
}

prepare() {
	cd "$_srcdir"

	patch -p1 -i "$srcdir/use-system-lua54.patch"

	# We're building XNH from a tarball, so remove Git metadata probes.
	sed -i \
		-e '/^GIT_HASH :=/d' \
		-e '/^GIT_BRANCH :=/d' \
		-e '/^GIT_PREFIX :=/d' \
		sys/unix/hints/linux.500
	touch dat/gitinfo.txt

	sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
		-e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' \
		-i include/unixconf.h

	# we are setting up for setgid games, so modify all necessary permissions
	# to allow full access for groups

	# With thanks to bugtracker user loqs for the CFLAGS and LDFLAGS adjustments
	# shellcheck disable=SC2016
	sed -e '/^HACKDIR/ s|/games/lib/\$(GAME)dir|/var/games/xnethack/|' \
		-e '/^SHELLDIR/ s|/games|/usr/bin|' \
		-e '/^VARDIRPERM/ s|0755|0775|' \
		-e '/^VARFILEPERM/ s|0600|0664|' \
		-e '/^GAMEPERM/ s|0755|02755|' \
		-e '/-DTIMED_DELAY/d' \
		-e 's|\(DSYSCF_FILE=\)\\"[^"]*\\"|\1\\"/var/games/xnethack/sysconf\\"|' \
		-e 's|CFLAGS=-g -O -I../include -DNOTPARMDECL|CFLAGS+= $(CPPFLAGS) -I../include -DNOTPARMDECL|' \
		-e 's/LFLAGS=-rdynamic/LFLAGS=$(LDFLAGS) -rdynamic/' \
		-e 's|\(DHACKDIR=\)\\"[^"]*\\"|\1\\"/var/games/xnethack/\\"|' \
		-i sys/unix/hints/linux.500

	# Set Lua release (e.g. 50409) to match system
	sed "/^CFLAGS=.*DNOTPARMDECL/ s|\$| -DNHL_VERSION_EXPECTED=$(_lua_version_expected)|" \
		-i sys/unix/hints/include/compiler.500

	# Fix the way they disable __warn_unused_result__
	sed '/^#define __warn_unused_result__/ s,/\*empty\*/,__unused__,' \
		-i include/tradstdc.h

	sed -e 's|^#GAMEUID.*|GAMEUID = root|' \
		-e 's|^#GAMEGRP.*|GAMEGRP = games|' \
		-e '/^FILEPERM\s*=/ s|0644|0664|' \
		-e '/^DIRPERM\s*=/ s|0755|0775|' \
		-i sys/unix/Makefile.top

	sed -e "/^MANDIR\s*=/s|/usr/man/man6|$pkgdir/usr/share/man/man6|" \
		-i sys/unix/Makefile.doc

	# The config is installed under /etc, so compile in its final path.
	# (This is currently broken in the `nethack` package.)
	sed -i 's|/var/games/xnethack/sysconf|/etc/xnethack/sysconf|' \
		sys/unix/hints/linux.500

	# run setup scripts
	sh sys/unix/setup.sh sys/unix/hints/linux.500
}

build() {
	cd "$_srcdir"

	make WANT_WIN_TTY=1 WANT_WIN_CURSES=1 GIT=0 GITINFO=0
}

package() {
	depends+=(
		glibc
		sh
		util-linux-libs
	)

	# systemd integration
	install -vDm 644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/xnethack.conf"

	cd "$_srcdir"

	# ensure required directories are created
	install -dm755 "$pkgdir"/usr/share/{man/man6,doc/xnethack}
	install -dm775 "$pkgdir"/var/games/xnethack
	install -dm775 "$pkgdir"/etc/xnethack

	local makeflags=(
		PREFIX="$pkgdir"
		MANDIR="$pkgdir/usr/share/man/man6"
		VARDIR="$pkgdir/var/games/xnethack"
		HACKDIR="$pkgdir/usr/lib/xnethack"
		WANT_WIN_TTY=1
		WANT_WIN_CURSES=1
		GIT=0
		GITINFO=0
		-j1 # Multi-threaded builds fail.
	)

	make "${makeflags[@]}" install manpages

	# Remove man pages shipped by NetHack to deconflict.
	for page in dlb makedefs recover; do
		rm "$pkgdir/usr/share/man/man6/$page.6"
	done

	mv "$pkgdir/usr/lib/xnethack/"{nhdat,symbols} "$pkgdir/var/games/xnethack"
	mv "$pkgdir/usr/lib/xnethack/sysconf" "$pkgdir/etc/xnethack"

	# HACK/HACKDIR manipulation
	# shellcheck disable=SC2016
	sed -e "s|HACKDIR=$pkgdir/usr/lib/xnethack|HACKDIR=/var/games/xnethack/|" \
		-e 's|HACK=$HACKDIR|HACK=/usr/lib/xnethack|' \
		-i "$pkgdir"/usr/bin/xnethack

	# documentation
	install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" doc/Guidebook.txt

	# license
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" dat/license

	cd "$pkgdir/var/games/xnethack/"
	chmod o+w logfile perm record
}
