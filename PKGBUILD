# Maintainer: envolution
# Contributor: Attila Fidan <archlinux-buildsystem@print0.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-fugashi
_gitname=${pkgname#python-}
pkgver=1.5.2dev0
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
b2sums=('39667e4754fed4fe7d5bb351b778a9c4af37c51105056ed7c42b11e171b4943ac98940cccc9b7db4e4d88cc7024ee4bba878226fa01272e68bb86db98a546f32')

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
