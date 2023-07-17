#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=murphysec
pkgname=${_pkgname//_/-}-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Detecting vulnerable dependencies from the command-line"
arch=(x86_64 aarch64)
url=https://github.com/murphysecurity/murphysec
license=(Apache)
_os=$(uname -s | tr A-Z a-z)
_arch=amd64
source=("$_pkgname::$url/releases/download/v$pkgver/$_pkgname-$_os-$_arch")
sha256sums=('e276b2afdeefb620e31a9950db435b39f78d7401f684d6ae49ea6cb32aa4358e')

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
