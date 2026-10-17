# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=ultima-ratio-regum
pkgver=0.10.4d
pkgrel=1
pkgdesc='A roguelike with procedurally generated civilizations, cultures, and religions'
arch=(x86_64)
url='https://www.markrjohnsongames.com/games/ultima-ratio-regum/'
license=(LicenseRef-ultima-ratio-regum)
depends=(wine)
source=("$pkgname-$pkgver.zip::https://www.markrjohnsongames.com/wp-content/uploads/2026/01/URR0104d.zip")
sha256sums=('c24e86b2d8b6b27a33f53a085d0378112aab6954871608b76ac04cbf95125934')

package() {
	# Installed unmodified, as the upstream license requires.
	install -dm755 "$pkgdir/usr/share/$pkgname"
	find . -mindepth 1 -maxdepth 1 ! -name "$pkgname-$pkgver.zip" -exec cp -r --no-preserve=ownership -t "$pkgdir/usr/share/$pkgname/" {} +
	# Normalize permissions.
	find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
	find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +
	# Readme.txt must accompany redistributions.
	install -Dm644 Readme.txt "$pkgdir/usr/share/licenses/$pkgname/Readme.txt"

	# The game reads its tilesets and writes its saves (World*D/World.dat,
	# Prefs.dat) relative to the working directory, which must be writable, so
	# run it from a per-user directory that links to the installed files.
	install -dm755 "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
install_dir=/usr/share/ultima-ratio-regum
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/ultima-ratio-regum"

mkdir -p "$data_dir"
for file in "$install_dir"/*; do
	link="$data_dir/${file##*/}"
	[ -e "$link" ] || ln -s "$file" "$link"
done

# Suppress .NET/browser prompts and Wine debug spam.
export WINEDLLOVERRIDES=mscoree,mshtml=
export WINEDEBUG=-all
cd "$data_dir" || exit 1
exec wine "$install_dir/URR0104d.exe" "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname"
}
