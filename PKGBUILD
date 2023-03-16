# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/help2man
_source_type=pypi-releases
_upstreamver='0.0.4'
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
sha256sums=('09a3591327889729a0423947d88f74b1ab798df804b72fbdc45a81c471df635d'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'fa9148fed0ebe3c1866b3b62f92f99a825dd2822623a9ca44c87fb469f6c640e'
            '2645634ac4843e411e9b3dc5ff34c3922c5bb8729bac79ac1ab9860b68a8bbd4'
            'bb90bd4fe6dac513f732cbc09fe778c3e8d5fd9f5982ecb366fdd869e2c351e1'
            '35d15b8c28334f49f4222f70f6ff5e6c0ef9aa3ed233a84c472fab74aa1d1ba8')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$_bin.1.gz" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "$_bin.bash" -t "$pkgdir/usr/share/bash-completion/completions"
	install -Dm644 "_$_bin" -t "$pkgdir/usr/share/zsh/site-functions"
	install -Dm644 "$_bin.csh" -t "$pkgdir/etc/profile.d"
}
