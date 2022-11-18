# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=piccolomo/plotext
_source_type=github-releases
_upstreamver='5.2.8'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="plotting on terminal"
arch=(any)
url=https://github.com/$_repo
depends=(python-shtab)
makedepends=(python-installer)
license=(MIT)
source=("$url/archive/$_upstreamver.tar.gz")
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('7364cf72e6c9bffaf96158340fd2e0058faf404edbbc1e7a2aed421c8638d475')

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl || return 1
  local bin=${_repo##*/}
  PYTHONPATH="$(ls -d "$pkgdir"/usr/lib/python*/site-packages)"
  export PYTHONPATH
  echo $PYTHONPATH
  "$pkgdir/usr/bin/$bin" --print-completion bash > "$bin.bash"
  "$pkgdir/usr/bin/$bin" --print-completion zsh > "_$bin"
  "$pkgdir/usr/bin/$bin" --print-completion tcsh > "$bin.csh"
  install -D $bin.bash "$pkgdir/usr/share/bash-completion/completions/$bin"
  install -D _$bin -t "$pkgdir/usr/share/zsh/site-functions"
  install -D $bin.csh -t "$pkgdir/etc/profile.d"
}
