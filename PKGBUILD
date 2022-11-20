# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=noahp/emoji-fzf
_pkgname=${_repo##*/}
_pypi_package=$_pkgname
_source_type=pypi-releases
_upstreamver='0.7.0'

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Emoji searcher for use with fzf"
arch=(any)
url=https://github.com/$_repo
depends=(fzf python-click)
makedepends=(python-installer)
license=(MIT)
_py=py2.py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('18b23dcceab88c07bb7fbcac667089b86dd0bc44bb1d1bb86affb27618f641a2')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl || return 1

  local bin
  bin=${_repo##*/}
  PYTHONPATH="$(ls -d "$pkgdir"/usr/lib/python*/site-packages)"
  export PYTHONPATH
  local complete
  complete="_$(echo ${bin//-/_} | tr a-z A-Z)_COMPLETE"
  eval "$complete=zsh_source" "$bin" > "$bin.bash"
  eval "$complete=bash_source" "$bin" > "_$bin"
  eval "$complete=fish_source" "$bin" > "$bin.fish"
  install -D $bin.bash "$pkgdir/usr/share/bash-completion/completions/$bin"
  install -D _$bin -t "$pkgdir/usr/share/zsh/site-functions"
  install -D $bin.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
