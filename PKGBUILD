# Maintainer: PhotonX <michael dot kogan at gmx dot net>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=medit
pkgver=1.2.0
pkgrel=7
pkgdesc='GTK+ text editor'
arch=('x86_64')
url='http://mooedit.sourceforge.net/'
license=('LGPL2.1')
depends=('libsm' 'pygtk')
makedepends=('intltool' 'python')
optdepends=('ctags: Show functions in the open document'
		'vte-legacy: Use the integrated terminal')
source=(https://downloads.sourceforge.net/mooedit/$pkgname-$pkgver.tar.bz2
        medit.appdata.xml)
sha256sums=('f0f7b3d9e3337907a5b27aa2ff3a084250d7517b38488c50872a621b4e1f3a4d'
            'dd83c9fcb5023563b7826ad6b796946a86947f886bdff773a8feb1a35b462618')

prepare() {
  cd $pkgname-$pkgver

  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' moo/moopython/plugins/lib/pyconsole.py

  # Recognise PKGBUILD as shell script
  sed -i 's/*.sh/*.sh;PKGBUILD/' moo/mooedit/langs/sh.lang
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-install-hooks PYTHON=python2
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
