# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=pykakasi
pkgname=python-$_name
pkgver=2.2.1
pkgrel=1
pkgdesc="Lightweight converter from Japanese Kana-kanji sentences into Kana-Roman"
arch=(any)
url="https://codeberg.org/miurahr/pykakasi"
license=(GPL3)
depends=(
    python-deprecated
    python-jaconv
    python-setuptools
)
makedepends=(
    python-build
    python-installer
    python-klepto
    python-setuptools-scm
    python-sphinx
    python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3a3510929a5596cae51fffa9cf78c0f742d96cebd93f726c96acee51407d18cc')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
  make -C docs text
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # rename script in /usr/bin to pykakasi in order to avoid conflicts with the kakasi package
  mv "$pkgdir"/usr/bin/{,py}kakasi

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/_build/text/*
}
