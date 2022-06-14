# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
pkgname=python2-matplotlib
_name=${pkgname#python2-}
pkgver=2.2.5
pkgrel=6
pkgdesc="A python plotting library, making publication quality plots"
arch=('x86_64')
url='https://github.com/matplotlib/matplotlib'
license=('custom')
depends=('freetype2' 'libpng' 'python2-backports.functools_lru_cache'
         'python2-cycler' 'python2-dateutil' 'python2-kiwisolver'
         'python2-numpy' 'python2-pyparsing')
optdepends=('tk: Tk{Agg,Cairo} backends'
            'python2-pyqt4: Qt4{Agg,Cairo} backends'
#            'python2-pyqt5: Qt5{Agg,Cairo} backends'
            'python2-gobject: for GTK3{Agg,Cairo} backend'
            'python2-wxpython: WX{,Agg,Cairo} backend'
            'python2-cairo: {GTK3,Qt5,Tk,WX}Cairo backends'
            'python2-cairocffi: alternative for Cairo backends'
            'python2-tornado: WebAgg backend'
            'ffmpeg: for saving movies'
            'imagemagick: for saving animated gifs'
            'python2-imaging: for reading/saving jpeg/bmp/tiff files'
            'ghostscript: usetex dependencies'
            'texlive-bin: usetex dependencies')
makedepends=('python2-wheel' 'xxd')
_pypi='https://files.pythonhosted.org/packages'
_path='9d/40/5ba7d4a3f80d39d409f21899972596bf62c8606f1406a825029649eaa439'
_wheel="$_name-$pkgver-cp27-cp27mu-manylinux1_x86_64.whl"
source=("$_pypi/$_path/$_wheel"
        "$_name-$pkgver-LICENSE.rst::$url/raw/v$pkgver/doc/users/license.rst")
noextract=("$_wheel")
sha256sums=('57077b4023f1af0151b6b580bccfcff2e3ec1e0f689ef58e4d1e751cdfbf13f0'
            '24fa9f493d772f3cfdd787ccd619d827bba79083a1ec04129b098f1485f9606f')

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

package() {
  cd "$srcdir/$_name-$pkgver"
  _destdir="$pkgdir/usr/lib/python2.7/site-packages/"
  mkdir -p "$_destdir"
  cp -a * "$_destdir"
  install -Dm644 "../$_name-$pkgver-LICENSE.rst" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
