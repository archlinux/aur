# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=atd-demo
_pkgdate=20130212
_pkgver=1.08
pkgver=$_pkgver.$_pkgdate
pkgrel=1
pkgdesc="This is a demo of Airline Tycoon Deluxe for Linux."
url="http://rune-soft.com/Games/Released/Game-239/game=Airline_Tycoon_Deluxe-6"
arch=('x86_64' 'i686')
license=('custom')
depends=('sdl_mixer')
[ "$CARCH" == "x86_64" ] && depends=('lib32-gcc-libs' 'lib32-sdl')
conflicts=('atd')
options=('!strip')
install=$pkgname.install
source=(https://bitbucket.org/runesoftdev/airline_public/downloads/airline.tycoon.deluxe_$_pkgver-english.demo_x86-$_pkgdate.mojo.run
        $pkgname.sh
        $pkgname.desktop
        $pkgname-fs.desktop)
md5sums=('d7bace7f1d67fda376919bf83c942fb4'
         'SKIP'
         'SKIP'
         'SKIP')
# this sha256sum is provided by runesoft:
sha256sums=('ff0b2f03cbfda4fe13aa803ced484d29e528a3b1bd30f04b03617c10ce7cda55'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  cd data

  # create output folders
  install -d $pkgdir/opt/$pkgname/{data,gli,misc,room,sound,video} \
             $pkgdir/usr/{share/{applications,licenses/$pkgname},bin}

  # install data files (ensure file permissions)
  for f in {data,gli,misc,room,sound,video}/* Manual.pdf README \
           runelogo.bmp spellbound.bmp ATDeluxe.xpm CHANGELOG
  do
    install -m644 $f $pkgdir/opt/atd-demo/$f
  done

  # unpack binary and libs
  bsdtar -xf bins.and.libs.tar.xz

  # install needed libraries that are not in the repositories
  install -d $pkgdir/opt/atd-demo/lib32
  if [ "$CARCH" == "i686" ]; then
    cp lib32/libboost_* $pkgdir/opt/atd-demo/lib32/
  elif [ "$CARCH" == "x86_64" ]; then
    cp lib32/{libboost_,libSDL_mixer,libsmpeg}* $pkgdir/opt/atd-demo/lib32/
  fi

  # install binary and launcher
  install -m755 ATDeluxe.Demo $pkgdir/opt/$pkgname/
  install -m755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -m644 ../$pkgname{,-fs}.desktop $pkgdir/usr/share/applications/

  # install licence
  install -m644 LICENCE $pkgdir/usr/share/licenses/$pkgname/
}
