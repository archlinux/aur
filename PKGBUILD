#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=plotext
pkgname=python-$_pkgname
pkgver=5.2.8
pkgrel=1
pkgdesc="plotting on terminal"
arch=(any)
url=https://github.com/piccolomo/plotext
makedepends=(python-installer python-shtab)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('7364cf72e6c9bffaf96158340fd2e0058faf404edbbc1e7a2aed421c8638d475')

package() {
  python -m installer --destdir="$pkgdir" ./*.whl || return 1
  local bin=${_repo##*/}
  PYTHONPATH="$(ls -d "$pkgdir"/usr/lib/python*/site-packages)"
  export PYTHONPATH
  "$pkgdir/usr/bin/$bin" --print-completion bash > "$bin.bash"
  "$pkgdir/usr/bin/$bin" --print-completion zsh > "_$bin"
  "$pkgdir/usr/bin/$bin" --print-completion tcsh > "$bin.csh"
  install -D $bin.bash "$pkgdir/usr/share/bash-completion/completions/$bin"
  install -D _$bin -t "$pkgdir/usr/share/zsh/site-functions"
  install -D $bin.csh -t "$pkgdir/etc/profile.d"
}
