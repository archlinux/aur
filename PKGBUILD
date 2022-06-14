# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-kiwisolver
_name=${pkgname#python2-}
pkgver=1.1.0
pkgrel=5
pkgdesc="A fast implementation of the Cassowary constraint solver"
url="https://github.com/nucleic/kiwi"
license=('BSD')
arch=('x86_64')
depends=('python2-setuptools')
makedepends=('python2-wheel' 'xxd')
_pypi='https://files.pythonhosted.org/packages'
_path='3d/78/cb9248b2289ec31e301137cedbe4ca503a74ca87f88cdbfd2f8be52323bf'
_wheel="$_name-$pkgver-cp27-cp27mu-manylinux1_x86_64.whl"
source=("$_pypi/$_path/$_wheel"
        "$_name-$pkgver-LICENSE.txt::$url/raw/$pkgver/LICENSE")
noextract=("$_wheel")
sha256sums=('05b5b061e09f60f56244adc885c4a7867da25ca387376b02c1efc29cc16bcd0f'
            '95c32f73d43fa54d8146badbcbd73b83acb7fa2cc81a7cef7784b3cd33b146a0')

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
}

package() {
  cd "$srcdir/$_name-$pkgver"
  _destdir="$pkgdir/usr/lib/python2.7/site-packages/"
  mkdir -p "$_destdir"
  cp -a * "$_destdir"
  install -Dm644 "../$_name-$pkgver-LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
