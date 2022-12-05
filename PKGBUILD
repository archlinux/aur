# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/translate-shell
_source_type=pypi-releases
_upstreamver='0.0.4'
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
)
conflicts=(translate-shell)
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	"https://raw.githubusercontent.com/$_repo/main/assets/desktop/translate-shell.desktop"
)
sha256sums=('0190cbadceaa6786c504efe0f1d0af329d5df71113e4a43a8ee9b7e74d2dc2f1'
            '45fdff8b6ddc514190abdb61354f0583b1a490466bfb65cceec4d6ea12a776f6')

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
