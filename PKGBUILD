# Maintainer: Andrew-Velox <mohabbat.bd2020@gmail.com>
#
# Installs the prebuilt static binary from a GitHub Release, so this needs no
# Rust toolchain and takes a second. Publish it to the AUR as `animfetch-bin`.
# Bump `pkgver`, refresh the checksums with `updpkgsums`, and push.

pkgname=animfetch-bin
_pkgname=animfetch
pkgver=0.1.1
pkgrel=1
pkgdesc='Animated system fetch that stays pinned above your shell while you work'
arch=('x86_64' 'aarch64')
url='https://github.com/Andrew-Velox/animfetch'
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

# Static musl builds, so no depends=() at all.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
# Refresh with `updpkgsums` on every version bump.
sha256sums_x86_64=('70374646a79fe9964afa590e079e5a3dd69b0f1a11ceaa32d02af9199e308705')
sha256sums_aarch64=('d12e7338c34f049ff411877f87bfc964a6b101add47723bf51014fe85184f62e')

package() {
	# $CARCH is the leading component of the target triple for both
	# architectures this ships, so it doubles as the directory name.
	cd "$_pkgname-v$pkgver-$CARCH-unknown-linux-musl"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 config.example.toml \
		"$pkgdir/usr/share/$_pkgname/config.example.toml"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"

	# MIT carries a copyright line, so Arch wants the text installed.
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
