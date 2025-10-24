# Maintainer: envolution
# Contributor: Attila Fidan <archlinux-buildsystem@print0.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-fugashi
_gitname=${pkgname#python-}
pkgver=1.5.2
pkgrel=1

pkgdesc="MeCab wrapper for pythonic Japanese tokenization and morphological analysis"
url="https://github.com/polm/fugashi"
license=(MIT)
arch=(x86_64)

depends=(
  cython
  mecab
  python
)
makedepends=(
  git
  python-setuptools
  python-setuptools-scm
  python-build
  python-installer
  python-wheel
)
optdepends=(
  "python-unidic: Use the latest version of UniDic, large install size"
  "python-unidic-lite: Use the lite version of UniDic"
)
checkdepends=(
  mecab-ipadic
  python-ipadic
  python-pytest
  python-unidic-lite
)

install="$pkgname.install"

source=("git+$url.git#tag=v$pkgver")
b2sums=('6f90f2414c079a089f9ccd919509bf9583cda2de93ba103e365175b234560ce022a1f3dca92a9b5bc075cb0434336a7f221849222f898cfa073750b3106bc23a')

build() {
  cd "$_gitname"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_gitname"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd "$_gitname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:
