# Maintainer: Axel H. <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.6.0` and the `@SHA256_*@` placeholders are
# substituted by .github/workflows/aur.yaml from the published release
# assets, and the result is pushed to the AUR. Edit this template, never the
# PKGBUILD in the AUR repository: that one is regenerated at every release.

pkgname=git-wipe-bin
_pkgname=git-wipe
pkgver=0.6.0
pkgrel=1
pkgdesc="Wipe out merged local branches and worktrees (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/git-wipe"
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
# The release archive, not the raw executable: it carries the man pages,
# completions and service unit the bare binary cannot. makepkg extracts it into
# `$srcdir/<crate>-$pkgver-<asset>/`, laid out as a prefix.
source_x86_64=("git-wipe-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/git-wipe_${pkgver}_linux-amd64.tar.gz")
sha256sums_x86_64=('51be3e1f3a4210b14095b314d28ea860fd8c0a9abc7d8807fd9d97f246b9702c')
source_aarch64=("git-wipe-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/git-wipe_${pkgver}_linux-arm64.tar.gz")
sha256sums_aarch64=('210bfd020ca7eb15d81af716417cf528933ed8ed11b2bb1d422d2c31a90aa92a')

package() {
	case "$CARCH" in
		x86_64) _asset=linux-amd64 ;;
		aarch64) _asset=linux-arm64 ;;
	esac
	cd "$srcdir/git-wipe-$pkgver-$_asset"

	install -Dm755 bin/git-wipe "$pkgdir/usr/bin/git-wipe"
	# The rest of the archive is already laid out as `/usr`: man pages,
	# completions and the service unit land where they belong, and only what
	# the project actually ships is there to copy.
	[ -d share ] && cp -a share "$pkgdir/usr/"
	[ -d lib ] && cp -a lib "$pkgdir/usr/"
	# MIT is not one of the licences Arch keeps in /usr/share/licenses/common.
	install -Dm644 share/doc/git-wipe/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# --- project-specific ---------------------------------------------------
#
# `depends=(...)` belongs here once `namcap` on a built package says what the
# binary actually links: a vendored dependency needs nothing declared, a
# dynamically linked one (a system OpenSSL, for example) does.

# `git` is a runtime dependency: every operation shells out to it.
depends=('gcc-libs' 'glibc' 'git')
# `replaces`/`conflicts` on the pre-rename name so `pacman -Syu` migrates
# anyone still on git-synchronizer-bin instead of leaving both installed.
conflicts+=('git-synchronizer-bin')
replaces=('git-synchronizer-bin')
