# $Id: PKGBUILD 197396 2016-11-29 17:37:31Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Samuel Mathieson <smathieson@gmail.com>

pkgname=moinmoin
_xpkgname=moin
pkgver=1.9.9
pkgrel=2
pkgdesc="A python wiki clone"
arch=(any)
url="http://moinmo.in/"
license=('GPL')
depends=('python2')
conflicts=('moin')
install=moinmoin.install
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393')
source=("https://static.moinmo.in/files/moin-$pkgver.tar.gz"{,.asc}
	"$pkgname.patch::https://bitbucket.org/thomaswaldmann/moin-1.9/commits/561b7a9c2bd91b61d26cd8a5f39aa36bf5c6159e/raw")
sha256sums=('4397d7760b7ae324d7914ffeb1a9eeb15e09933b61468072acd3c3870351efa4'
            'SKIP'
            '55abcbe7356390bbc6b8504012365c9f5c50cbb68cd7ec10632945aaaae37438')

prepare() {
  cd "$srcdir"/${_xpkgname}-$pkgver
  # python2 fix
  for file in $(find . -name '*.py' -print) wiki/server/*; do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  patch -p1 -i $srcdir/$pkgname.patch
}

build() {
  cd "$srcdir"/${_xpkgname}-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/${_xpkgname}-$pkgver
  python2 setup.py install --root="$pkgdir" --record=INSTALLED_FILES
}
