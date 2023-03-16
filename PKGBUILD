# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/translate-shell
_source_type=pypi-releases
_upstreamver='0.0.17'
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
sha256sums=('0e3f7ffa0939f876c8d11a82075197cb416b7f9a4965bf8d9fe803a5c4444593'
            '11f0c6092d30867b09ea9f2f1562169ce8cc0c4476181dd62dbad63b16752972'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '6b7a53d253a0aec48cbf2a134ec382383d545dfe35c19a2d03e9d11cc659c9ee'
            '3a111e40861566af47f0c440c8d5989f9fd5971bf4d57789d8c2e0cce81cf2dc'
            '6a437deae1674c41648bfc8f7ab0272a564213d43fa2e29a664b9e3256ab8214'
            'bc69ce45658427a760a19a03690bf860f55a70a443020153e6b2bf565bedf48a')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl

	install -Dm644 "$pkgdir$(python -c'import sys; print(sys.path[-1])')/${_pkgname//-/_}/assets/images/$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/36x36/apps/"
	install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$_bin.1.gz" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "$_bin" -t "$pkgdir/usr/share/bash-completion/completions"
	install -Dm644 "_$_bin" -t "$pkgdir/usr/share/zsh/site-functions"
	install -Dm644 "$_bin.csh" -t "$pkgdir/etc/profile.d"
}
