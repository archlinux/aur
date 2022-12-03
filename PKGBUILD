# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/translate-shell
_source_type=github-tags
_upstreamver='0.0.2'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Translate text by many different translators."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer python-shtab help2man)
optdepends=(
	'python-colorama: color'
	'python-rich: better logger'
	'python-pyyaml: output yaml format'
	'python-keyring: store APP secrets securely'
	'python-langdetect: detect language automatically for offline dictionary'
	'python-pystardict: offline dictionary'
)
conflicts=(translate-shell)
license=(GPLv3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('65b6082b512a96d6bbd4ffdf706ebd513f39bfd0a250139179f80c3e6481c65a')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl

	local bin
	bin=trans
	help2man "$bin" | gzip >"$bin.1.gz"
	install -D "$bin.1.gz" -t "$pkgdir/usr/share/man/man1"
	PYTHONPATH="$(ls -d "$pkgdir"/usr/lib/python*/site-packages)"
	export PYTHONPATH
	"$pkgdir/usr/bin/$bin" --print-completion bash >"$bin.bash"
	"$pkgdir/usr/bin/$bin" --print-completion zsh >"_$bin"
	"$pkgdir/usr/bin/$bin" --print-completion tcsh >"$bin.csh"
	install -D "$bin.bash" "$pkgdir/usr/share/bash-completion/completions/$bin"
	install -D "_$bin" -t "$pkgdir/usr/share/zsh/site-functions"
	install -D "$bin.csh" -t "$pkgdir/etc/profile.d"
}
