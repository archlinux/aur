# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=cdcat
pkgver=2.3.1
pkgrel=1
pkgdesc="CD/DVD/Media catalog software (Qt based)"
arch=('i686' 'x86_64')
url="http://cdcat.sourceforge.net/"
license=('GPL')
depends=('qt4' 'libtar' 'lib7zip' 'p7zip' 'crypto++')
makedepends=('libmediainfo' 'libexif')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"
        "$pkgname.desktop")
md5sums=('b7b4ea3e213620c1126c64125b93e63a'
         '919c7e03e085a1af5a1e4d30075e30a7')

build() {
  cd $pkgname-$pkgver/src

  # strip local path
  sed -i "s|/local||g" $pkgname.pro

  # use cryptopp instead of crypto++
  sed -i 's/crypto++/cryptopp/g' `grep -rl crypto++`

  qmake-qt4 $pkgname.pro && make
}

package() {
  cd $pkgname-$pkgver/src
  make INSTALL_ROOT="$pkgdir" install

  # desktop file
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icons
  for _s in 16x16 22x22 32x32 48x48 64x64; do
    install -Dm644 ../${pkgname}_logo_$_s.png \
      "$pkgdir/usr/share/icons/hicolor/$_s/apps/$pkgname.png"
  done
  install -Dm644 ../${pkgname}_logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.png"

  # translations
  cd lang
  for _f in *.ts; do
    _tdir="$pkgdir/usr/share/locale/${_f:6:2}/LC_MESSAGES"
    install -d "$_tdir"
    lrelease-qt4 -silent -qm "$_tdir/${_f/ts/qm}" $_f
  done
}
