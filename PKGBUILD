# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

_pkgname=ipe-tools
pkgname=$_pkgname-git
pkgrel=4
pkgver=git
arch=('i686' 'x86_64')
makedepends=('git' 'sed')
depends=('ipe')
url="https://github.com/otfried/ipe-tools"
pkgdesc="Tools for Ipe: pdftoipe, figtoipe, ipe5toxml, svgtoipe"
source=("git+https://github.com/otfried/ipe-tools.git")
md5sums=('SKIP')

build() {
    # pdftoipe
    cd "$srcdir/ipe-tools/pdftoipe"
    git checkout 1bc9c52        # to work with poppler 0.82.0; remove once Arch updates poppler to >=0.83.0
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
