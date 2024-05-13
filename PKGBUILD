# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=python-unidic
_pypkgname=unidic-py
pkgver=1.1.0.unidic3.1.0
_projver=${pkgver%.unidic3.1.0}

pkgrel=5
pkgdesc="UniDic for Contemporary Written Japanese packaged for use with pip (with UniDic 3.1.0)"
url="https://github.com/polm/unidic-py"
license=(
  BSD-3-Clause
  MIT
)
arch=(any)

depends=(
  python
  python-plac
  python-tqdm
  python-wasabi
)
makedepends=(python-setuptools)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_projver.tar.gz"
  "https://cotonoha-dic.s3-ap-northeast-1.amazonaws.com/unidic-3.1.0.zip"
)
b2sums=('d4dedd082559410ed668282c3bc5ea2a8d7d7b51ea78b1cb6125358ca9ead943d76cd65580cd1ff2f9a7e1f8cce6ee550a9d53bafb9936d2d56742fb9b67ed2b'
        'becbaf46ac8c210b47461843e8daa2b07681664881d7cb849e4825f37569101e605015eb975390aec123f525550d4eeed4843f811c71a0977da1aa5431b616a9')


build(){
  cd "$_pypkgname-$_projver"
  python setup.py build
}

package(){
  cd "$_pypkgname-$_projver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE.unidic -t "$pkgdir/usr/share/licenses/$pkgname/"

  # reimplement https://github.com/polm/unidic-py/blob/master/unidic/download.py for offline use
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd "$srcdir"/unidic
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/lib/python$python_version/site-packages/unidic/dicdir/{}" \;
  echo "# This is a dummy file." > "$pkgdir/usr/lib/python$python_version/site-packages/unidic/dicdir/mecabrc"
}
