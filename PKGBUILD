# Maintainer: Axel H. <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.13.0`, `17bce8e81770ebed55a4e20fb369adf1e75520d92b355288fa819060fd4fb58a` and `4a734a0bd41bb98cccaa35f441a2a8f54f1d3c8f56b75c6fadc68466c9bee9e6`
# are substituted by .github/workflows/aur.yaml from the published release
# assets, and the result is pushed to the AUR. Edit this template, never the
# PKGBUILD in the AUR repository: that one is regenerated at every release.

pkgname=git-tpl-bin
_pkgname=git-tpl
pkgver=0.13.0
pkgrel=1
pkgdesc="Git-native project templates (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/git-tpl"
license=('MIT')

# What the published binary actually links. libgit2 is vendored into it, so it
# is absent here — but zlib and libgcc_s are not, and namcap reports an error
# for every needed library left undeclared.
depends=('gcc-libs' 'glibc' 'zlib')

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

# !strip because the release profile already sets `strip = true`, and !debug
# for the same reason: there is no debug data left to split into a -debug
# package, so building one would produce an empty package and a namcap warning.
options=('!strip' '!debug')

# The `gnu` archives, not `musl`: an AUR package targets Arch's own glibc, and
# the musl build exists for the systems that are not this one. This project
# tags without a `v` prefix, so the tag is `$pkgver` as-is.
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/git-tpl_${pkgver}_linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/git-tpl_${pkgver}_linux-arm64.tar.gz")
sha256sums_x86_64=('17bce8e81770ebed55a4e20fb369adf1e75520d92b355288fa819060fd4fb58a')
sha256sums_aarch64=('4a734a0bd41bb98cccaa35f441a2a8f54f1d3c8f56b75c6fadc68466c9bee9e6')

# Fetched separately because the release archive carries no licence file, and
# MIT is not one of the licences Arch keeps in /usr/share/licenses/common — so
# the package has to install the file itself.
source=("LICENSE-$pkgver::$url/raw/$pkgver/LICENSE")
sha256sums=('579ef5ffa922ce743ad6dd7ec4538389c7f66a2b945b7d6284e5b3ec04da156e')

package() {
	# The archive holds `git-tpl` at its root, named exactly that. The name is
	# load-bearing: Git resolves `git tpl` only through an executable called
	# exactly `git-tpl` on PATH.
	install -Dm755 "$srcdir/git-tpl" "$pkgdir/usr/bin/git-tpl"
	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Beside the binary, the archive carries the man pages and the completion
	# scripts, generated at release time. The man page is what makes
	# `git tpl --help` work: Git execs `man git-tpl` for it, and without a page
	# that fails with exit 16.
	install -Dm644 -t "$pkgdir/usr/share/man/man1" "$srcdir"/man/man1/*.1

	# Each under the name its shell looks for — zsh wants a leading underscore,
	# bash wants none — because a completion script filed under the wrong name
	# is one nothing ever sources.
	install -Dm644 "$srcdir/completions/git-tpl.bash" \
		"$pkgdir/usr/share/bash-completion/completions/git-tpl"
	install -Dm644 "$srcdir/completions/git-tpl.zsh" \
		"$pkgdir/usr/share/zsh/site-functions/_git-tpl"
	install -Dm644 "$srcdir/completions/git-tpl.fish" \
		"$pkgdir/usr/share/fish/vendor_completions.d/git-tpl.fish"
}
