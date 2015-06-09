# Maintainer: Steven Allen <steven {at} stebalien {dot} com>
# Contributor: Reverie <reverie@takhis.net>

pkgname=wordnet
pkgver=3.1
_srcver=3.0
pkgrel=1
pkgdesc="An Electronic Lexical Database from Princeton University"
arch=('i686' 'x86_64')
url="http://wordnet.princeton.edu/"
license=("custom")
options=(staticlibs)
depends=('tk')
source=(http://wordnetcode.princeton.edu/${_srcver}/WordNet-${_srcver}.tar.bz2
        http://wordnetcode.princeton.edu/wn${pkgver}.dict.tar.gz
        wordnet.desktop
        wordnet.png)
md5sums=('89b4db7c6840ce69a8e315a3f83d996b'
         '072f83df0ca7c387a44dd7ef5b199150'
         '0211d836cccb72e8aabe88c5e47a8b1e'
         '2c6d64f7d28062944d6969deb8dee9ab')

build() {
  cd $srcdir/WordNet-$_srcver
  ./configure --prefix=/usr --mandir=/usr/share/man
  sed 's:#define DEFAULTPATH "/usr/dict":#define DEFAULTPATH "/usr/share/wordnet/dict":' -i config.h
  sed 's:"/usr/local/WordNet-3.0/lib/wnres":"/usr/share/wordnet/wnres":' -i src/wnb
  make CFLAGS="$CFLAGS -DUSE_INTERP_RESULT"
}

package() {
  cd $srcdir/WordNet-$_srcver
  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/doc $pkgdir/usr/share/wordnet
  mv $pkgdir/usr/lib/wnres $pkgdir/usr/share/wordnet/wnres
  rm -fr $pkgdir/usr/include/tk

  # Replace dictionary files
  cp -a $srcdir/dict/ $pkgdir/usr/share/wordnet/dict
  rm -fr $pkgdir/usr/dict

  install -D -m644 $srcdir/wordnet.desktop $pkgdir/usr/share/applications/wordnet.desktop
  install -D -m644 $srcdir/wordnet.png $pkgdir/usr/share/pixmaps/wordnet.png
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
