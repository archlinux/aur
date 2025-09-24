# Maintainer: envolution
# Contributor: Attila Fidan <archlinux-buildsystem@print0.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-fugashi
_gitname=${pkgname#python-}
pkgver=1.5.1
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
b2sums=('d4a68ee74358e006b1553f14d8d8cfe12d387a510bcc9283e38b7ae08f8d61b700b9d5071b274c68fa0acd1b804cadc2c51647b0b2d316a2fd3e18aeb1c94ebc')

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
