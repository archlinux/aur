# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Duscheleit <jinks@archlinux.us>
pkgname=python2-colorama
_name="${pkgname#python2-}"
pkgver=0.4.6
pkgrel=1
pkgdesc='Simple cross-platform colored terminal text in Python'
arch=('any')
url='https://github.com/tartley/colorama'
license=('BSD')
depends=('python2')
makedepends=('python2-wheel' 'xxd')
checkdepends=('python2-mock')
_pypi='https://files.pythonhosted.org/packages'
_path='d1/d6/3965ed04c63042e047cb6a3e6ed1a63a35087b6a609aa3a15ed8ac56c221'
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
# source=("$_pypi/$_path/$_wheel")
source=("$_pypi/$_path/$_wheel"
        "$_name-$pkgver-LICENSE.txt::$url/raw/$pkgver/LICENSE.txt")
# source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4f1d9991f5acc0ca119f9d443620b77f9d6b33703e51011c16baf57afb285fc6'
            'cac35c02686e5d04a5a7140bfb3b36e73aed496656e891102e428886d7930318')
noextract=("$_wheel")

prepare() {
  cd "$srcdir"
  rm -rf "$_name-$pkgver"
  wheel2 unpack "$_wheel"
}

_get_b64sha256() {
  sha256sum -b "$1" | xxd -r -p | base64 | tr +/ -_ | tr -d '=\n'
}

build() {
  cd "$srcdir/$_name-$pkgver"

  # Create the INSTALLER and REQUESTED (not in wheel)
  # and ensure that a RECORD exists (its contents don't matter yet)
  _didir="$_name-$pkgver.dist-info"
  echo makepkg > "$_didir/INSTALLER"
  touch "$_didir/REQUESTED" "$_didir/RECORD"

  # Create the RECORD file contents
  find * -not -type d | while read _fname ; do
    if [[ "$_fname" == "$_didir/RECORD" ]] ; then
      _fhash=''
      _fsize=''
    else
      _fhash="sha256=$(_get_b64sha256 "$_fname")"
      _fsize="$(stat -c%s "$_fname")"
    fi
    echo "$_fname,$_fhash,$_fsize"
  done | sort > "$_didir/RECORD"

  # Compile the files (PEP 376 tells these shouldn't be in RECORD)
  python2 -m compileall .
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python2 -m unittest discover -p *_test.py
}

package() {
  cd "$srcdir/$_name-$pkgver"
  _destdir="$pkgdir/usr/lib/python2.7/site-packages/"
  mkdir -p "$_destdir"
  cp -a * "$_destdir"
  install -Dm644 "../$_name-$pkgver-LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
