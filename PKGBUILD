# Maintainer: Fgaoxing <Fgaoxing0206@163.com>
# AUR: prebuilt nolibc static binary from GitHub Releases (no build tool needed).
pkgname=aether-rescue-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Initramfs rescue shell toolbox: PID 1 init flow + BusyBox-style rescue applets (prebuilt static nolibc binary)"
arch=('x86_64')
url="https://github.com/Fgaoxing/Aether"
license=('MIT')
depends=()
provides=('aether')
conflicts=('aether-rescue-git')
install=aether-rescue-bin.install
source=("$url/releases/download/v${pkgver}/aether-${CARCH}-nolibc"
        "$url/archive/refs/tags/v${pkgver}.tar.gz"
        "LICENSE::$url/raw/v${pkgver}/LICENSE")
sha256sums=('dab3c59a6e06a0abadb9786350fce410a80085a43b79bea87be3e249df393127'
            'ea737a4cf5e5b2637030eb247be9975e9ee210b6e07b00ee489aa2c9e4a522f3'
            '59eb0390c73d9c7fa0a6d17085fa7a14758d027735299090a5f9705462f048ec')

prepare() {
	_src="$(echo "$srcdir"/Aether-*/ | head -1)"
}

package() {
	prepare
	install -Dm755 "$srcdir/aether-${CARCH}-nolibc" "$pkgdir/usr/bin/aether"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# mkinitcpio install hooks: 打包到 /usr/lib/initcpio/install（用户覆盖放 /etc/initcpio/install）
	local hook_dir hook
	hook_dir="$_src/initramfs/hooks/install"
	for hook in "$hook_dir"/*; do
		install -Dm755 "$hook" "$pkgdir/usr/lib/initcpio/install/$(basename "$hook")"
	done
}
