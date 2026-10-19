# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=voidal
pkgver=0.4.0
pkgrel=1
pkgdesc='4x strategy game inspired by Aurora 4x'
arch=('x86_64')
url='https://voidal.net'
license=('LicenseRef-voidal')
depends=('glu' 'libglvnd' 'sdl2-compat')
options=('!debug')
_commit=3a3d79ae244a973c6e1440a16d2402d86eb3a0a7
source=(
	"$pkgname-$pkgver.zip::$url/voidal_builds/v$pkgver/VoidalLinux.zip"
	"LICENSE_THIRD_PARTY.txt::https://raw.githubusercontent.com/jensaly/voidal/$_commit/LICENSE_THIRD_PARTY.txt"
)
sha256sums=(
	'cc91af5c3eb845d4ad62dce84dbcdb54efbbf1c522ba6e9756287039b2491002'
	'78bbc7558a5c88adc8f65454098c706e3c7602ebf45ff8fce27392149838ae43'
)

package() {
	cd "$srcdir/release"

	install -d "$pkgdir/usr/share/$pkgname"
	cp -r --no-preserve=ownership lists qrh "$pkgdir/usr/share/$pkgname/"

	# Normalize permissions of the read-only data.
	find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} +
	find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} +

	install -Dm755 Voidal "$pkgdir/usr/lib/$pkgname/$pkgname"

	# Upstream publishes no license for the game itself, so ship a notice for
	# the LicenseRef ID.
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	cat >"$pkgdir/usr/share/licenses/$pkgname/LicenseRef-$pkgname.txt" <<'EOF'
Voidal is proprietary freeware developed by Jens Lyngaas.

Upstream publishes no license text for the game itself, so it remains all
rights reserved by its author. This package does not redistribute the game:
it downloads the unmodified archive from the official distribution channel at
build time. Components bundled in the binary are licensed separately; see
LICENSE_THIRD_PARTY.txt.

Official site: https://voidal.net/
EOF

	# Third-party licenses for the components statically linked into the
	# binary (SDL2, ImGui, ImPlot, ...).
	install -Dm644 "$srcdir/LICENSE_THIRD_PARTY.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE_THIRD_PARTY.txt"

	install -dm755 "$pkgdir/usr/share/applications"
	cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Voidal
GenericName=4X Strategy Game
Comment=4x strategy game inspired by Aurora 4x
Exec=voidal
Terminal=false
Categories=Game;StrategyGame;
Keywords=voidal;4x;space;strategy;aurora;
EOF

	# Voidal resolves its data (lists/, qrh/) and writes saves/ and log files
	# relative to the working directory. Run it from a writable per-user
	# directory that links to the read-only data installed system-wide.
	install -dm755 "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
install_dir=/usr/share/voidal
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/voidal"

mkdir -p "$data_dir" || exit 1

for file in "$install_dir"/*; do
	name="${file##*/}"
	link="$data_dir/$name"
	# Recreate links whose target disappeared after a package upgrade.
	if [ -L "$link" ] && [ ! -e "$link" ]; then
		rm -f "$link"
	fi
	[ -e "$link" ] || ln -s "$file" "$link"
done

# Save games are written here, so it must be a real, writable directory.
mkdir -p "$data_dir/saves" || exit 1

cd "$data_dir" || exit 1
exec /usr/lib/voidal/voidal "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname"
}
