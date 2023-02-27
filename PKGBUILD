# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/translate-shell
_source_type=pypi-releases
_upstreamver='0.0.13'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Translate text by google, bing, youdaozhiyun, haici, stardict, etc at same time from CLI, GUI (GNU/Linux, Android, macOS and Windows), REPL, python, shell and vim."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
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
	'espeak-ng: speaker support'
	'festival: speaker support'
)
conflicts=("$_pkgname")
license=(GPLv3)
_py=py3
_bin=trans
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	"https://raw.githubusercontent.com/$_repo/main/assets/desktop/$_pkgname.desktop"
	"https://raw.githubusercontent.com/$_repo/main/LICENSE"
	"$url/releases/download/$pkgver/$_bin.1.gz"
	"$url/releases/download/$pkgver/$_bin"
	"$url/releases/download/$pkgver/_$_bin"
	"$url/releases/download/$pkgver/$_bin.csh"
)
sha256sums=('04b2f9c6c745b20d01fed4a314d0d7f0df431b74781dfc518f85ebea2bd7cf6b'
            '3738722bf4bf09ad4c14c15c07fdbb4ea52da8c38e6ff1c535d05a8e06646f67'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '2bde1d386b54976c21971e191bb784a660175f5c639fa8808d78098949b28ac3'
            'be02c00e4105a86d9fbbc065c5b6aab250b45458d724bbcc51372f419816a30c'
            '9782ed032f0c5e4f3ee6cd10b340b04fb28d3c427918a04dc7e43f92b0f546fb'
            'ffd0548f37a8a9e6c80f054c718fe522f1f7395b541c49f882170ee4e0fdbea2')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl

	install -Dm644 "$pkgdir$(python -c'import sys; print(sys.path[-1])')/${_pkgname//-/_}/assets/images/icon.png" -t "$pkgdir/usr/share/$_pkgname/images"
	install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$_bin.1.gz" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "$_bin" -t "$pkgdir/usr/share/bash-completion/completions"
	install -Dm644 "_$_bin" -t "$pkgdir/usr/share/zsh/site-functions"
	install -Dm644 "$_bin.csh" -t "$pkgdir/etc/profile.d"
}
