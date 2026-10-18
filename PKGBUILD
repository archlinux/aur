# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=aurora-4x
pkgver=2.7.1
pkgrel=2
pkgdesc='4X space strategy game with realistic physics and detailed ship design'
arch=(x86_64)
url='https://aurora4x.com/'
license=(LicenseRef-aurora-4x)
depends=(hicolor-icon-theme wine wine-mono)
makedepends=(icoutils)
_gdrive_id=1aW7Yra4MgWwr4UxFORwRT2scOCZoDFqX
_archive="$pkgname-$pkgver.rar"
_archive_url="https://drive.usercontent.google.com/download?id=$_gdrive_id&export=download&confirm=t"
source=("$_archive::$_archive_url")
sha256sums=('5cf4b7ee6965a6e05b96538c8a9762b8b2de63dd535ca74cfec46977e5d1b174')
noextract=("$_archive")

prepare() {
	# Keep a fixed build directory: pkgver() runs after this and may change
	# $pkgver, which would otherwise rename the directory out from under build().
	mkdir -p "$srcdir/$pkgname"
	bsdtar --no-same-owner -xf "$srcdir/$_archive" -C "$srcdir/$pkgname"
}

pkgver() {
	# The PE version resource is stale (1.0.0.0), but the assembly carries the
	# real version as a UTF-16 string literal.
	strings -a -el "$srcdir/$pkgname/Aurora.exe" |
		grep -m1 -E '^[0-9]+\.[0-9]+\.[0-9]+$'
}

build() {
	cd "$pkgname"

	# Upstream ships no icon file; extract the icon set from the executable.
	wrestool -x --output="$srcdir/icon.ico" -t14 Aurora.exe
	mkdir -p "$srcdir/icons"
	icotool -x --output="$srcdir/icons/" "$srcdir/icon.ico"
}

package() {
	cd "$pkgname"

	install -dm755 "$pkgdir/usr/share/$pkgname"
	cp -r --no-preserve=ownership . "$pkgdir/usr/share/$pkgname/"

	# Normalize permissions.
	find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
	find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +

	# Upstream only ships this readme; install it as documentation.
	install -Dm644 ReadMeFirst.txt "$pkgdir/usr/share/doc/$pkgname/ReadMeFirst.txt"

	# Upstream publishes no license, so ship a notice for the LicenseRef id.
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	cat >"$pkgdir/usr/share/licenses/$pkgname/LicenseRef-$pkgname.txt" <<'EOF'
Aurora 4x is freeware developed by Steve Walmsley.

Upstream publishes no license text, so the game remains all rights reserved
by its author. This package does not redistribute the game: it downloads the
unmodified archive from the official distribution channel at build time.

Official site: https://aurora4x.com/
EOF

	# Install the icon set extracted in build().
	local icon dims size
	for icon in "$srcdir"/icons/icon_*.png; do
		dims=${icon##*_}
		size=${dims%.png}
		size=${size%x*}
		install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
	done

	install -dm755 "$pkgdir/usr/share/applications"
	cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Aurora 4x
Comment=4X space strategy game with realistic physics and detailed ship design
Exec=aurora-4x
Icon=aurora-4x
Terminal=false
Categories=Game;StrategyGame;
Keywords=aurora;4x;space;strategy;
EOF

	# Aurora reads its data and writes AuroraDB.db (the save game) relative to
	# the working directory. Run it from a writable per-user directory that
	# links to the installed files, keeping the database as a real file.
	install -dm755 "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
install_dir=/usr/share/aurora-4x
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/aurora-4x"

mkdir -p "$data_dir" || exit 1

# AuroraDB.db is the save game. Only copy the packaged database on first run
# so upgrades do not erase existing saves; delete it to start from the new one.
if [ ! -e "$data_dir/AuroraDB.db" ]; then
	cp "$install_dir/AuroraDB.db" "$data_dir/AuroraDB.db" || exit 1
fi
for file in "$install_dir"/*; do
	name="${file##*/}"
	[ "$name" = AuroraDB.db ] && continue
	link="$data_dir/$name"
	# Recreate links whose target disappeared after a package upgrade.
	if [ -L "$link" ] && [ ! -e "$link" ]; then
		rm -f "$link"
	fi
	[ -e "$link" ] || ln -s "$file" "$link"
done

# Suppress Wine debug spam.
export WINEDEBUG=-all
cd "$data_dir" || exit 1
exec wine "$install_dir/Aurora.exe" "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname"
}
