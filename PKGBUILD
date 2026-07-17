# Maintainer: thelooter <evekolb2204@gmail.com>

pkgname=gcx-bin
pkgver=0.4.4
pkgrel=1
pkgdesc='A CLI for managing Grafana Cloud resources, optimized for agentic usage (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/gcx'
license=('Apache-2.0')
provides=('gcx')
conflicts=('gcx')
# Upstream ships statically-linked, already-stripped Go binaries; don't touch them.
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gcx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/gcx_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3c502999b8132fa4c426af5a9a15b3fc5c879b9a10d0decbb35ac74b713279f1')
sha256sums_aarch64=('455a9df73bce901a629cf8843e52e081169b13b79f0063918093d8363197d1c5')

package() {
	# The release tarball extracts its files (gcx, LICENSE, README.md,
	# CHANGELOG.md) straight into $srcdir with no leading directory.
	install -Dm755 gcx "$pkgdir/usr/bin/gcx"

	# Generate and install shell completions from the shipped binary. The binary
	# is the package's target architecture, so it runs during a native build
	# (the normal AUR case). When cross-building, executing a foreign binary
	# fails — guard on that so the package still builds, just without completions.
	if ./gcx version >/dev/null 2>&1; then
		for _shell in bash zsh fish; do
			./gcx completion "$_shell" > "gcx.$_shell"
		done
		install -Dm644 gcx.bash "$pkgdir/usr/share/bash-completion/completions/gcx"
		install -Dm644 gcx.zsh  "$pkgdir/usr/share/zsh/site-functions/_gcx"
		install -Dm644 gcx.fish "$pkgdir/usr/share/fish/vendor_completions.d/gcx.fish"
	else
		warning 'Skipping shell completions: cannot execute the target-arch binary on this host.'
	fi

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
