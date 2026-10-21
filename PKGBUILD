# Maintainer: Axel H. <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.5.2` and the `@SHA256_*@` placeholders are
# substituted by .github/workflows/aur.yaml from the published release
# assets, and the result is pushed to the AUR. Edit this template, never the
# PKGBUILD in the AUR repository: that one is regenerated at every release.

pkgname=memcastle-bin
_pkgname=memcastle
pkgver=0.5.2
pkgrel=1
pkgdesc="Local-first, always-on memory server for AI coding agents over MCP/HTTP (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/memcastle/memcastle"
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
sha256sums_x86_64=('91cec09246e5c11e75d81bbe84663d46b4156b1fa16f96049df6980e7ce21a27')
source_aarch64=("memcastle-$pkgver-aarch64::$url/releases/download/$pkgver/memcastle_${pkgver}_linux-arm64")
sha256sums_aarch64=('c01f5dc8c6aef627e37a5600338ad9aa8a7c0d959f793262aa1a829dcf8214ac')

# Fetched separately: the raw binary asset carries no licence file, and MIT
# is not one of the licences Arch keeps in /usr/share/licenses/common.
# The systemd user unit is fetched from the tag for the same reason.
#
# Shared skills travel as one portable release asset for both architectures, unpacked by makepkg under
# `$srcdir/memcastle-skills-$pkgver/skills/`. Provider plugins ship sources and agent integrations separately.
#
# The web UI (docs/adr/035) is static files, portable the same way: `$srcdir/memcastle-web-$pkgver/web/dist`.
source=("LICENSE-$pkgver::$url/raw/$pkgver/LICENSE"
        "memcastle-$pkgver.service::$url/raw/$pkgver/packaging/systemd/memcastle.service"
        "memcastle-skills-$pkgver.tar.gz::$url/releases/download/$pkgver/memcastle_${pkgver}_skills.tar.gz"
        "memcastle-web-$pkgver.tar.gz::$url/releases/download/$pkgver/memcastle_${pkgver}_web.tar.gz")
sha256sums=('579ef5ffa922ce743ad6dd7ec4538389c7f66a2b945b7d6284e5b3ec04da156e'
            'f97fe1b55d4357513a21820bb2b6b50c0ac6c70304bcece919e8ba8bec97fa2b'
            '64dd20d9530e04166768317f9f24c1752d6c0f6714bda73bb7f891e917b880bc'
            '82d13599193ed2d1a404f1ac946d5d09c9956965e1c39d8c4206f820ca66af64')

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
	# Keep both empty install roots for asset lookup; provider plugins supply their contents separately.
	install -dm755 "$pkgdir/usr/share/memcastle/sources" "$pkgdir/usr/share/memcastle/integrations"
	# Only Core's shared skills arrive with the binary.
	cp -r "$srcdir/memcastle-skills-$pkgver/skills" "$pkgdir/usr/share/memcastle/"
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
