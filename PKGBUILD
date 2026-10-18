# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=aurora-4x
pkgver=2.7.1
pkgrel=1
pkgdesc='A space strategy game with a focus on realism and depth'
arch=(x86_64)
url='https://aurora4x.com/'
license=(LicenseRef-aurora-4x)
depends=(wine wine-mono)

# Google Drive's large-file confirmation page can be bypassed with the
# drive.usercontent.google.com endpoint and confirm=t, so makepkg's normal
# downloader can fetch the archive directly.
_gdrive_id=1aW7Yra4MgWwr4UxFORwRT2scOCZoDFqX
_archive="$pkgname-$pkgver.rar"
_archive_url="https://drive.usercontent.google.com/download?id=$_gdrive_id&export=download&confirm=t"
source=("$_archive::$_archive_url")
sha256sums=('5cf4b7ee6965a6e05b96538c8a9762b8b2de63dd535ca74cfec46977e5d1b174')
noextract=("$_archive")

prepare() {
	mkdir -p "$srcdir/$pkgname-$pkgver"
	bsdtar --no-same-owner -xf "$srcdir/$_archive" -C "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"

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
Aurora 4X is freeware developed by Steve Walmsley.

Upstream publishes no license text, so the game remains all rights reserved
by its author. This package does not redistribute the game: it downloads the
unmodified archive from the official distribution channel at build time.

Official site: https://aurora4x.com/
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
