# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=python-fugashi
_gitname=${pkgname#python-}
pkgver=1.3.0
pkgrel=1

pkgdesc="Cython MeCab wrapper for fast, pythonic Japanese tokenization and morphological analysis"
url="https://github.com/polm/fugashi"
license=(MIT)
arch=(any)

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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source=("git+$url.git#tag=v$pkgver")
b2sums=('56da2551c6f1183ca8627cd8126ea5fb48b403cc64b6d95fcb2c833c9159a65bbe851dc5bf74f4d6fad106951b7d1f7ea2703b7bf6a88fd82a65221698e6a93b')

prepare() {
  cd "$_gitname"
  # it's pinned to 0.29.35 because it "causes macos CI to fail"
  # https://github.com/polm/fugashi/commit/eea9ba663d0a6a02fc166c47f361e7206e642f77
  sed -i 's/Cython~=0.29.35/Cython/g' setup.py
}

build(){
  cd "$_gitname"
  python setup.py build
}

check(){
  cd "$_gitname"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package(){
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
