# Maintainer: Alexis Rossfelder <rossfelderalexis@gmail.com>
pkgname=apps2samsung-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="One-click app installer for Samsung TVs, projectors and smart monitors (Tizen) — Jellyfin, Moonlight and more"
arch=('x86_64' 'aarch64')
url="https://apps2samsung.madebypatrick.nl"
license=('MIT')
depends=('icu' 'openssl' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxrandr' 'libice' 'libsm' 'fontconfig' 'mesa')
optdepends=('vulkan-icd-loader: Vulkan rendering support')
provides=('apps2samsung')
conflicts=('apps2samsung')
options=('!strip')

source_x86_64=("Apps2Samsung-v${pkgver}-linux-x64.tar.gz::https://github.com/Apps2Samsung/Apps2Samsung/releases/download/v${pkgver}/Apps2Samsung-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("Apps2Samsung-v${pkgver}-linux-arm64.tar.gz::https://github.com/Apps2Samsung/Apps2Samsung/releases/download/v${pkgver}/Apps2Samsung-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('237dcd512d038b60ca0f8d338dda4486ff42ac4a9a3e396c31ceafeb1a91755c')
sha256sums_aarch64=('a41e582c6dbb2c32ef68e3d57ed90e8ef8947a01213c5f5fa4a045267fac25e0')

package() {
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r "$srcdir/Apps2Samsung" "$srcdir/Assets" \
		"$srcdir/libHarfBuzzSharp.so" "$srcdir/libSkiaSharp.so" \
		"$pkgdir/usr/lib/$pkgname/"
	chmod 755 "$pkgdir/usr/lib/$pkgname/Apps2Samsung"
	echo "$pkgver" > "$pkgdir/usr/lib/$pkgname/.version"

	# Upstream writes logs and caches next to its own binary, so /usr/lib
	# (read-only) can't be executed from directly. The wrapper mirrors a
	# writable copy into the user's data dir and runs from there, refreshing
	# it whenever the installed package version changes.
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/apps2samsung" <<-EOF
	#!/bin/sh
	set -e
	install_dir="/usr/lib/$pkgname"
	data_dir="\${XDG_DATA_HOME:-\$HOME/.local/share}/$pkgname"
	installed_version=\$(cat "\$data_dir/.version" 2>/dev/null || true)
	current_version=\$(cat "\$install_dir/.version")

	if [ "\$installed_version" != "\$current_version" ]; then
		mkdir -p "\$data_dir"
		cp -r "\$install_dir/." "\$data_dir/"
		chmod -R u+w "\$data_dir"
	fi

	cd "\$data_dir"
	exec ./Apps2Samsung "\$@"
	EOF

	install -Dm644 "$srcdir/Assets/jelly2sams.png" \
		"$pkgdir/usr/share/pixmaps/apps2samsung.png"

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/apps2samsung.desktop" <<-EOF
	[Desktop Entry]
	Version=1.0
	Type=Application
	Name=Apps2Samsung
	Comment=Install any app on Samsung TVs, projectors and smart monitors
	Icon=apps2samsung
	Terminal=false
	Categories=Utility;Network;
	StartupNotify=true
	MimeType=application/x-apps2samsung;
	Exec=apps2samsung
	EOF
}
