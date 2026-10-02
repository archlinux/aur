# Maintainer: littleblack111 <littleblack11111@gmail.com>
pkgname=delta-bin
pkgver=0.18.0
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
makedepends=('desktop-file-utils')
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
sha256sums_x86_64=('0b34dd2fa36b3b25a6bb66caa3df5db00f6fea274717c4950327709a278d7d54')
source_aarch64=("delta-$pkgver-aarch64.tar.gz::https://github.com/zed-industries/delta-nix/releases/download/v$pkgver/delta-linux-aarch64.tar.gz")
sha256sums_aarch64=('1d82ffba540fb362573ccfd5d4036581f9f396b11d7754169ea00077280cf1ff')

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
