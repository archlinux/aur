# Maintainer: Axel H. <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.4.0` and the `@SHA256_*@` placeholders are
# substituted by .github/workflows/aur.yaml from the published release
# assets, and the result is pushed to the AUR. Edit this template, never the
# PKGBUILD in the AUR repository: that one is regenerated at every release.

pkgname=memcastle-bin
_pkgname=memcastle
pkgver=0.4.0
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
sha256sums_x86_64=('9e818775c9094889045145870cf031a946e3b102d6a119d66ca7f5dc430dd2ef')
source_aarch64=("memcastle-$pkgver-aarch64::$url/releases/download/$pkgver/memcastle_${pkgver}_linux-arm64")
sha256sums_aarch64=('1737d4270501e45d644ef964cc76cb0dc825287d053bdc3039338f74b7324a49')

# Fetched separately: the raw binary asset carries no licence file, and MIT
# is not one of the licences Arch keeps in /usr/share/licenses/common.
# The systemd user unit is fetched from the tag for the same reason.
#
# The sources bundled with MemCastle (docs/adr/040) are portable WebAssembly packages, so one release asset serves both
# architectures. makepkg extracts it to `$srcdir/memcastle-sources-$pkgver/`.
#
# The agent integrations and the shared skills (docs/adr/034) are bundled JavaScript, equally portable, and arrive the
# same way: `$srcdir/memcastle-integrations-$pkgver/{integrations,skills}`.
#
# The web UI (docs/adr/035) is static files, portable the same way: `$srcdir/memcastle-web-$pkgver/web/dist`.
source=("LICENSE-$pkgver::$url/raw/$pkgver/LICENSE"
        "memcastle-$pkgver.service::$url/raw/$pkgver/packaging/systemd/memcastle.service"
        "memcastle-sources-$pkgver.tar.gz::$url/releases/download/$pkgver/memcastle_${pkgver}_sources.tar.gz"
        "memcastle-integrations-$pkgver.tar.gz::$url/releases/download/$pkgver/memcastle_${pkgver}_integrations.tar.gz"
        "memcastle-web-$pkgver.tar.gz::$url/releases/download/$pkgver/memcastle_${pkgver}_web.tar.gz")
sha256sums=('579ef5ffa922ce743ad6dd7ec4538389c7f66a2b945b7d6284e5b3ec04da156e'
            '8084d6127e526aad94907922f893f5215cfc4fd1dd113d11af6a8b3ee1a34ed1'
            'b6781339a868c17279b9a04f15307426542ee6408f3f08afbab9138e4e04cd3f'
            '95276b6e076bde9a7e0a7e3108b852ea70540a338ca2c0e6a7f5d434ac5240c0'
            '9a4d993963991e65f4e48a779284e6181b8e10666244c25e1877afa07e7df092')

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
	# The bundled sources, unpacked one directory each, where the daemon looks for them beside `/usr/bin`: they are
	# installed from the start and `memcastle source enable pi` is all they need. A tree, not a flat copy.
	install -dm755 "$pkgdir/usr/share/memcastle/sources"
	cp -r "$srcdir/memcastle-sources-$pkgver"/. "$pkgdir/usr/share/memcastle/sources/"
	find "$pkgdir/usr/share/memcastle/sources" -type d -exec chmod 755 {} +
	find "$pkgdir/usr/share/memcastle/sources" -type f -exec chmod 644 {} +
	# The integrations and skills beside them, where `memcastle integration install pi` looks. A tree, not a flat copy.
	install -dm755 "$pkgdir/usr/share/memcastle"
	cp -r "$srcdir/memcastle-integrations-$pkgver/integrations" "$srcdir/memcastle-integrations-$pkgver/skills" \
		"$pkgdir/usr/share/memcastle/"
	# The dashboard, at the `web/dist` a checkout has too, so one lookup finds it. Served only when `web.enable` is set.
	cp -r "$srcdir/memcastle-web-$pkgver/web" "$pkgdir/usr/share/memcastle/"
}

# --- project-specific ---------------------------------------------------
#
# `depends=(...)` belongs here once `namcap` on a built package says what the
# binary actually links: a vendored dependency needs nothing declared, a
# dynamically linked one (a system OpenSSL, for example) does.

# What `namcap` reports the gnu binary links: glibc, plus libgcc_s for stack unwinding.
depends=('glibc' 'gcc-libs')
