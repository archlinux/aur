# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
# Based on hunspell-de PKGBUILD

pkgname=hunspell-de-base
pkgver=20161207
pkgrel=1
pkgdesc="German hunspell dictionaries, no de_BE, de_LI and de_LU symlinks"
arch=('any')
url="http://www.j3e.de/ispell/igerman98/"
license=('GPL')
makedepends=('hunspell' 'ispell')
optdepends=('hunspell: the spell checking libraries and apps')
provides=('hunspell-de')
conflicts=('hunspell-de')
source=("https://www.j3e.de/ispell/igerman98/dict/igerman98-$pkgver.tar.bz2")
sha256sums=('17296f03c5fea62d76ecc530ebe80f6adc430278f58d472dc1842d71612960a8')

build() {
  cd "$srcdir/igerman98-$pkgver"
  make hunspell/de_AT.dic hunspell/de_AT.aff \
       hunspell/de_CH.dic hunspell/de_CH.aff \
       hunspell/de_DE.dic hunspell/de_DE.aff
}

package() {
  cd "$srcdir/igerman98-$pkgver/hunspell"
  install -dm755 ${pkgdir}/usr/share/hunspell
  cp -p de_??.dic de_??.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd

  # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  cp -p README_de_??.txt $pkgdir/usr/share/doc/$pkgname
}
