# Maintainer: thelooter <evekolb2204@gmail.com>

pkgname=gcx-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='A CLI for managing Grafana Cloud resources, optimized for agentic usage (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/gcx'
license=('Apache-2.0')
provides=("gcx=${pkgver}")
conflicts=('gcx')
# Upstream ships statically-linked, already-stripped Go binaries; don't touch them.
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gcx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/gcx_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('93f708b5582546c8fc9564ab5912e5c49a545be12247833c2b0b80e304c1083f')
sha256sums_aarch64=('cf3ea9bfd04ac1c8cec93affb376e5f1f8412dc893374df063d43ddf5ec4535c')

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
