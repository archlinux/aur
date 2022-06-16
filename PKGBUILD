# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

_pkgname=ipe-tools
pkgname=$_pkgname-git
pkgrel=7
pkgver=git
arch=('i686' 'x86_64')
makedepends=('git' 'sed')
depends=('ipe')
url="https://github.com/otfried/ipe-tools"
pkgdesc="Tools for Ipe: pdftoipe, figtoipe, ipe5toxml, svgtoipe"
source=("git+https://github.com/otfried/ipe-tools.git" "0001-pdftoipe-fix-building-with-poppler-22.03.0.patch")
md5sums=('SKIP'
         'cff0ef4cdbad6e636fee98bb5123f740')

prepare() {
    cd "$srcdir/ipe-tools"
    patch -p1 < "$srcdir/0001-pdftoipe-fix-building-with-poppler-22.03.0.patch"
}

build() {
    # pdftoipe
    cd "$srcdir/ipe-tools/pdftoipe"
    make

    # figtoipe
    cd "$srcdir/ipe-tools/figtoipe"
    make

    # ipe5toxml
    cd "$srcdir/ipe-tools/ipe5toxml"
    make

    # svgtoipe
    cd "$srcdir/ipe-tools/svgtoipe"
    sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" svgtoipe.py

    # ipepython
    cd "$srcdir/ipe-tools/ipepython"
    python setup.py build
}

package() {
  mkdir -p "$pkgdir/usr/bin"

  cp "$srcdir/ipe-tools/pdftoipe/pdftoipe" "$pkgdir/usr/bin"
  cp "$srcdir/ipe-tools/figtoipe/figtoipe" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/ipe-tools/svgtoipe/svgtoipe.py" "$pkgdir/usr/bin"
  cp "$srcdir/ipe-tools/ipe5toxml/ipe5toxml" "$pkgdir/usr/bin"

  cd "$srcdir/ipe-tools/ipepython"
  python setup.py install --prefix="$pkgdir/usr"
}

# vim: ft=sh syn=sh et ts=2 sw=2
md5sums=('SKIP'
         'fa23828c2d7fdf2d86460a6a443a4a37')
