# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=murphysecurity/murphysec
_source_type=github-releases
_upstreamver='v3.0.1'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=${_pkgname//_/-}-bin
pkgver=${_upstreamver##v}
pkgrel=2
pkgdesc="Detecting vulnerable dependencies from the command-line"
arch=(x86_64 aarch64)
url=https://github.com/$_repo
license=(Apache)
_os=$(uname -s | tr A-Z a-z)
_arch=amd64
source=("$_pkgname::$url/releases/download/$_upstreamver/$_pkgname-$_os-$_arch")
sha256sums=(SKIP)

package() {
	cd "$srcdir" || return 1
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
	for shell in bash zsh fish; do
		"$pkgdir/usr/bin/$_pkgname" completion $shell >$_pkgname.$shell
	done
	install -Dm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 "$_pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
	install -Dm644 "$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
