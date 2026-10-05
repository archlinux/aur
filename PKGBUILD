# Maintainer: Axel H. <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.3.0` and the `@SHA256_*@` placeholders are
# substituted by .github/workflows/aur.yaml from the published release
# assets, and the result is pushed to the AUR. Edit this template, never the
# PKGBUILD in the AUR repository: that one is regenerated at every release.

pkgname=memcastle-bin
_pkgname=memcastle
pkgver=0.3.0
pkgrel=1
pkgdesc="Local-first, always-on memory server for AI coding agents over MCP/HTTP (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/memcastle"
license=('MIT')

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

# !strip because the release profile already sets `strip = true`, and !debug
# for the same reason: there is no debug data left to split into a -debug
# package, so building one would produce an empty package and a namcap
# warning.
options=('!strip' '!debug')

# The `gnu` asset, not `musl`: an AUR package targets Arch's own glibc.
# This project tags without a `v` prefix, so the tag is `$pkgver` as-is.
#
# The release asset is the raw executable itself, not an archive — makepkg
# leaves an unrecognised extension alone rather than trying to extract it, so
# these name it plainly and `package()` installs it directly.
source_x86_64=("memcastle-$pkgver-x86_64::$url/releases/download/$pkgver/memcastle_${pkgver}_linux-amd64")
sha256sums_x86_64=('fd0a7db7cf3b7f017bc1b8d8a02b4c2bef68b71ca481bf28deac5974028cee3e')
source_aarch64=("memcastle-$pkgver-aarch64::$url/releases/download/$pkgver/memcastle_${pkgver}_linux-arm64")
sha256sums_aarch64=('a4f32476ed6f7923f7570f918b99648324fbb48c8a22fa4ccc42d55d89e3f6b3')

# Fetched separately: the raw binary asset carries no licence file, and MIT
# is not one of the licences Arch keeps in /usr/share/licenses/common.
# The systemd user unit is fetched from the tag for the same reason.
#
# The sources bundled with MemCastle (docs/adr/033) are portable WebAssembly packages, so one release asset serves both
# architectures. makepkg extracts it to `$srcdir/memcastle-sources-$pkgver/`.
#
# The agent integrations and the shared skills (docs/adr/034) are bundled JavaScript, equally portable, and arrive the
# same way: `$srcdir/memcastle-integrations-$pkgver/{integrations,skills}`.
source=("LICENSE-$pkgver::$url/raw/$pkgver/LICENSE"
        "memcastle-$pkgver.service::$url/raw/$pkgver/packaging/systemd/memcastle.service"
        "memcastle-sources-$pkgver.tar.gz::$url/releases/download/$pkgver/memcastle_${pkgver}_sources.tar.gz"
        "memcastle-integrations-$pkgver.tar.gz::$url/releases/download/$pkgver/memcastle_${pkgver}_integrations.tar.gz")
sha256sums=('579ef5ffa922ce743ad6dd7ec4538389c7f66a2b945b7d6284e5b3ec04da156e'
            '8084d6127e526aad94907922f893f5215cfc4fd1dd113d11af6a8b3ee1a34ed1'
            'fda0ce4821d58534c1ed836498d931d47921693004418fb11dd4fbf19014b4ed'
            'b1e0fc3a978b8307de5b046efd921d934eefec98e524d024f8dd3cfeafc2185a')

package() {
	install -Dm755 "$srcdir/memcastle-$pkgver-$CARCH" "$pkgdir/usr/bin/memcastle"
	# Generated from the installed binary, so the scripts match its commands
	# and flags. `completions` needs no daemon and no configuration.
	"$pkgdir/usr/bin/memcastle" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/memcastle"
	"$pkgdir/usr/bin/memcastle" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_memcastle"
	"$pkgdir/usr/bin/memcastle" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/memcastle.fish"
	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Package-owned user unit: `systemctl --user start memcastle`. Config and secrets stay user-owned.
	install -Dm644 "$srcdir/memcastle-$pkgver.service" "$pkgdir/usr/lib/systemd/user/memcastle.service"
	# The bundled sources, where the daemon looks for them beside `/usr/bin`: `memcastle source install pi` then needs
	# no registry and no network.
	install -dm755 "$pkgdir/usr/share/memcastle/sources"
	install -m644 "$srcdir/memcastle-sources-$pkgver"/* "$pkgdir/usr/share/memcastle/sources/"
	# The integrations and skills beside them, where `memcastle integration install pi` looks. A tree, not a flat copy.
	install -dm755 "$pkgdir/usr/share/memcastle"
	cp -r "$srcdir/memcastle-integrations-$pkgver/integrations" "$srcdir/memcastle-integrations-$pkgver/skills" \
		"$pkgdir/usr/share/memcastle/"
}

# --- project-specific ---------------------------------------------------
#
# `depends=(...)` belongs here once `namcap` on a built package says what the
# binary actually links: a vendored dependency needs nothing declared, a
# dynamically linked one (a system OpenSSL, for example) does.

# What `namcap` reports the gnu binary links: glibc, plus libgcc_s for stack unwinding.
depends=('glibc' 'gcc-libs')
