# Maintainer: littleblack111 <littleblack11111@gmail.com>
pkgname=delta-bin
pkgver=0.19.2
pkgrel=1
pkgdesc='AI coding assistant by Zed Industries (binary release)'
arch=('x86_64' 'aarch64')
url='https://delta.dev'
license=('LicenseRef-Zed-Early-Access')
depends=(
	'bash'
	'ca-certificates'
	'fontconfig'
	'git'
	'glibc>=2.39'
	'hicolor-icon-theme'
	'libglvnd'
	'libxcb'
	'libxkbcommon'
	'libxkbcommon-x11'
	'vulkan-icd-loader'
	'wayland'
	'xdg-utils'
)
makedepends=('curl' 'desktop-file-utils')
optdepends=(
	'openssh: SSH Git remotes'
	'vulkan-driver: Vulkan graphics driver for the desktop application'
)
provides=("zed-delta=$pkgver")
conflicts=('zed-delta' 'delta-bin')
options=('!strip' '!debug')
source=('LICENSE' 'zed-delta')
sha256sums=(
	'2178e301327b73c4e2584778af904515de418328abce2d76ef98892ab9b7b4a2'
	'c7acfcfb28b1bc8c1c6a80137272eb32772c65b57ed073a833f4a41f69215a70'
)
source_x86_64=("delta-$pkgver-x86_64.tar.gz::https://github.com/zed-industries/delta-nix/releases/download/v$pkgver/delta-linux-x86_64.tar.gz")
sha256sums_x86_64=('82d4859f31f8e68d03071fefcb1d0df1c51092f67049cf2535c3e5ad0d0c2182')
source_aarch64=("delta-$pkgver-aarch64.tar.gz::https://github.com/zed-industries/delta-nix/releases/download/v$pkgver/delta-linux-aarch64.tar.gz")
sha256sums_aarch64=('20396a673ff0f99f00a2e996844028f0cf56a923a804912768ec498bfadad912')

pkgver() {
	local api
	api=$(curl -fsSL 'https://api.github.com/repos/zed-industries/delta-nix/releases/latest')

	local ver x86_sum aarch64_sum
	ver=$(printf '%s' "$api" | grep -oP '"tag_name"\s*:\s*"v\K[^"]+')
	x86_sum=$(printf '%s' "$api" | grep -oP '"name"\s*:\s*"delta-linux-x86_64[^"]*".*?"digest"\s*:\s*"sha256:\K[^"]+')
	aarch64_sum=$(printf '%s' "$api" | grep -oP '"name"\s*:\s*"delta-linux-aarch64[^"]*".*?"digest"\s*:\s*"sha256:\K[^"]+')

	sed -i \
		-e "s|^sha256sums_x86_64=('.*')|sha256sums_x86_64=('$x86_sum')|" \
		-e "s|^sha256sums_aarch64=('.*')|sha256sums_aarch64=('$aarch64_sum')|" \
		"$startdir/PKGBUILD"

	printf '%s' "$ver"
}

prepare() {
	sed -i 's/^Exec=delta /Exec=zed-delta /' \
		"$srcdir/Delta/share/applications/dev.zed.Delta.desktop"
}

check() {
	sh -n "$srcdir/zed-delta"
	desktop-file-validate "$srcdir/Delta/share/applications/dev.zed.Delta.desktop"
	grep -Fx 'Exec=zed-delta open %U' \
		"$srcdir/Delta/share/applications/dev.zed.Delta.desktop"
}

package() {
	install -Dm755 "$srcdir/Delta/bin/delta" "$pkgdir/usr/lib/zed-delta/bin/delta"
	install -Dm755 "$srcdir/Delta/bin/delta-app" "$pkgdir/usr/lib/zed-delta/bin/delta-app"

	if [[ $CARCH == x86_64 ]]; then
		install -Dm755 "$srcdir/Delta/lib/libunwind.so.1" \
			"$pkgdir/usr/lib/zed-delta/lib/libunwind.so.1"
	fi

	install -Dm755 "$srcdir/zed-delta" "$pkgdir/usr/bin/zed-delta"
	install -Dm644 "$srcdir/Delta/share/applications/dev.zed.Delta.desktop" \
		"$pkgdir/usr/share/applications/dev.zed.Delta.desktop"
	cp -a --no-preserve=ownership "$srcdir/Delta/share/icons" "$pkgdir/usr/share/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
