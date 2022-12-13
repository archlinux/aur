# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/help2man
_source_type=pypi-releases
_upstreamver='0.0.1'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Convert --help and --version to man page."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
depends=(python-jinja)
conflicts=("$_pkgname")
license=(GPLv3)
_py=py3
_bin=help2man
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	"https://raw.githubusercontent.com/$_repo/main/LICENSE"
	"$url/releases/download/$pkgver/$_bin.1.gz"
	"help2man.bash::$url/releases/download/$pkgver/$_bin"
	"$url/releases/download/$pkgver/_$_bin"
	"$url/releases/download/$pkgver/$_bin.csh"
)
sha256sums=(
	'05ef5f68d1f55be92d44cd8bbce0533e1fb00af76303a9cbf7230b838a9a8f70'
	'3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
	'492d7bd6e2ec150a614640c74f586fa5cab5479cb4bc4c3de8b9c71dfa1decf1'
	'c5f5d75696d4e1a19fbcb9cadbfc9b70aa64e46813d2179dbfcd602e1cc25f55'
	'5bc48f874f3d5b143b11f099937eca84a6018a21cdd35c2287b65c9ea18d481b'
	'2b572334760eceb949a43339bab39bd1c71de2a3957ea4e31a344a55669df418'
)

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$_bin.1.gz" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "$_bin.bash" -t "$pkgdir/usr/share/bash-completion/completions"
	install -Dm644 "_$_bin" -t "$pkgdir/usr/share/zsh/site-functions"
	install -Dm644 "$_bin.csh" -t "$pkgdir/etc/profile.d"
}
