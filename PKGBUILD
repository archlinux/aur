# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/translate-shell
_source_type=pypi-releases
_upstreamver='0.0.5'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Translate text by google, bing, haici, etc at same time from CLI, GUI, REPL, python, shell and vim."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer python-shtab help2man)
optdepends=(
	'python-colorama: color'
	'python-rich: better logger'
	'python-yaml: output yaml format'
	'python-keyring: store APP secrets securely'
	'python-langdetect: detect language automatically for offline dictionary'
	'python-pystardict: offline dictionary'
	'python-py-notifier: GUI notification'
	'xsel: clipboard support'
	'xclip: clipboard support'
	'festival: speaker support'
	'espeak-ng: speaker support'
)
conflicts=(translate-shell)
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	"https://raw.githubusercontent.com/$_repo/main/assets/desktop/translate-shell.desktop"
)
sha256sums=('c3294415a59082246bce29e63721a70eb240a8891f3ba69b007ea6e6f7cf33dc'
            '3738722bf4bf09ad4c14c15c07fdbb4ea52da8c38e6ff1c535d05a8e06646f67')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl

	local bin
	bin=trans
	help2man "$pkgdir/usr/bin/$bin" | gzip >"$bin.1.gz"
	install -Dm644 "$bin.1.gz" -t "$pkgdir/usr/share/man/man1"
	PYTHONPATH="$(ls -d "$pkgdir"/usr/lib/python*/site-packages)"
	export PYTHONPATH
	"$pkgdir/usr/bin/$bin" --print-completion bash >"$bin.bash"
	"$pkgdir/usr/bin/$bin" --print-completion zsh >"_$bin"
	"$pkgdir/usr/bin/$bin" --print-completion tcsh >"$bin.csh"
	install -Dm644 "$bin.bash" "$pkgdir/usr/share/bash-completion/completions/$bin"
	install -Dm644 "_$bin" -t "$pkgdir/usr/share/zsh/site-functions"
	install -Dm644 "$bin.csh" -t "$pkgdir/etc/profile.d"

	install -Dm644 "$PYTHONPATH/translate_shell/assets/images/icon.png" -t "$pkgdir/usr/share/translate-shell/images"
	install -Dm644 translate-shell.desktop -t "$pkgdir/usr/share/applications"
}
