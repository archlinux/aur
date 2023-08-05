#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=emoji-fzf
pkgname=python-$_pkgname
pkgver=0.8.0
pkgrel=2
pkgdesc="Emoji searcher for use with fzf"
arch=(any)
url=https://github.com/noahp/emoji-fzf
depends=(fzf python-click)
makedepends=(python-installer)
license=(MIT)
_py=py2.py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('ff55574f117a3ce996f01dfdfb0ef50524d3b4e3316187b03af65dacdfd17498')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl || return 1

  local bin
  bin=emoji-fzf
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
