# Maintainer: Axel H. <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.2.0` and the `@SHA256_*@` placeholders are
# substituted by .github/workflows/aur.yaml from the published release
# assets, and the result is pushed to the AUR. Edit this template, never the
# PKGBUILD in the AUR repository: that one is regenerated at every release.

pkgname=bee-agent
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal, headless Rust agent runtime implementing ACPv2. (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/bee"
license=('MIT')

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
source_x86_64=("bee-$pkgver-x86_64::$url/releases/download/$pkgver/bee_${pkgver}_linux-amd64")
sha256sums_x86_64=('2d6ce9d2fba8a1ffa69864ef1436b128859cee6ba462277b078ef2f4f004ccec')
source_aarch64=("bee-$pkgver-aarch64::$url/releases/download/$pkgver/bee_${pkgver}_linux-arm64")
sha256sums_aarch64=('aa744da06949374272fde5c2fd255bb0237fb3cb28ee0b13a8234f47f8f9786b')

# Fetched separately: the raw binary asset carries no licence file, and MIT
# is not one of the licences Arch keeps in /usr/share/licenses/common.
source=("LICENSE-$pkgver::$url/raw/$pkgver/LICENSE")
sha256sums=('579ef5ffa922ce743ad6dd7ec4538389c7f66a2b945b7d6284e5b3ec04da156e')

package() {
	install -Dm755 "$srcdir/bee-$pkgver-$CARCH" "$pkgdir/usr/bin/bee"
	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# --- project-specific ---------------------------------------------------
#
# `depends=(...)` belongs here once `namcap` on a built package says what the
# binary actually links: a vendored dependency needs nothing declared, a
# dynamically linked one (a system OpenSSL, for example) does.

# These unrelated packages install the same /usr/bin/bee executable.
conflicts=('bee' 'bee-bin')
# namcap detects glibc/libgcc linkage; native tool execution also invokes Bash.
depends=('glibc' 'libgcc' 'bash')
