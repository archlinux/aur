pkgname=heroes-evolved
pkgver=1
pkgrel=0
pkgdesc='Heroes Evolved is the new micro-client MOBA from R2 Games. (Wine)'
url='https://he.r2games.com/'
arch=(any)
depends=(winetricks alsa-lib libldap lcms2 gnutls mpg123)
depends_x86_64=(lib32-alsa-lib lib32-libldap lib32-lcms2 lib32-gnutls lib32-mpg123)
makedepends=(icoutils imagemagick p7zip)

_name='Heroes Evolved'
_setupexe=Heroes_Evolved_Setup.exe
# alternative full client here
#_setupexe=Heroes_Evolved_Setup_Full.exe

source=(http://r2cdn2.r2games.com/en/heclient/$_setupexe
        heroes-evolved.sh
        heroes-evolved.desktop)
sha1sums=('2e46180388228c95226999dc4a8c99a48766cc36'
          '52a28f17a35ba007a5963d894aff43990405bd7e'
          '8248b6b0e98aff79ff5cd18add6fc1329c5881e3')
# allow this to show the group permissions warning to user
#install=$pkgname.install

build() {
  cd $srcdir
  7z x $_setupexe -o"$srcdir" -aoa
}

package() {
  cd $srcdir
  # games gid is 50
  install -Dm755 -g 50 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm755 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  # setup file
  install -Dm764 -g 50 s3ver.dat $pkgdir/opt/$pkgname/s3ver.dat
  install -Dm764 -g 50 "Heroes Evolved.exe" "$pkgdir/opt/$pkgname/Heroes Evolved.exe"
  install -Dm764 -g 50 HELauncher.exe $pkgdir/opt/$pkgname/HELauncher.exe
  # data
  cp -r app $pkgdir/opt/$pkgname/app
  # alternative data from the full installer
  #cp -r s3_web $pkgdir/opt/$pkgname/s3_web
  chgrp -R 50 $pkgdir/opt/$pkgname
  find $pkgdir/opt/$pkgname -type d -exec chmod 775 {} +
  find $pkgdir/opt/$pkgname -type f -exec chmod 764 {} +
  # icon
  convert "Heroes Evolved.ico" $pkgname.png
  install -Dm644 $pkgname-5.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
