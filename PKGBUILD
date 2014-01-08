# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=atd-demo
_pkgdate=20130212
_pkgver=1.08
pkgver=$_pkgver.$_pkgdate
pkgrel=1
pkgdesc="This is a demo of Airline Tycoon Deluxe for Linux."
url="http://rune-soft.com/Games/Released/Game-239/game=Airline_Tycoon_Deluxe-6"
arch=('i686' 'x86_64')
license=('custom')
depends=('sdl_mixer')
[ "$CARCH" == "x86_64" ] && depends=('lib32-gcc-libs' 'lib32-sdl')
conflicts=('atd')
options=('!strip')
install=$pkgname.install
source=("https://bitbucket.org/runesoftdev/airline_public/downloads/airline.tycoon.deluxe_$_pkgver-english.demo_x86-$_pkgdate.mojo.run"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname-fs.desktop")
# this sha256sum is provided by runesoft:
sha256sums=('ff0b2f03cbfda4fe13aa803ced484d29e528a3b1bd30f04b03617c10ce7cda55'
            '804921da338e7a29351d83de33475c7ede92e7f8fcfbc0b7755f9b05739e4906'
            '42b4848957cd57067f095c9aa08060e8c9435df7cb6a0d4250c6c847c0667a4f'
            '365468f8f75658670d4b400cce2dad2a7bc07ed7070629cdb9ec82f5c3906906')

package() {
  cd data

  # create output folders
  install -d "$pkgdir"/opt/$pkgname/{data,gli,misc,room,sound,video} \
             "$pkgdir"/usr/{share/applications,bin}

  # install data files (ensure file permissions)
  for f in {data,gli,misc,room,sound,video}/* Manual.pdf README \
           runelogo.bmp spellbound.bmp ATDeluxe.xpm CHANGELOG
  do
    install -m644 $f "$pkgdir"/opt/atd-demo/$f
  done

  # unpack binary and libs
  bsdtar -xf bins.and.libs.tar.xz

  # install needed libraries that are not in the repositories
  install -d "$pkgdir"/opt/atd-demo/lib32
  if [ "$CARCH" == "i686" ]; then
    cp lib32/libboost_* "$pkgdir"/opt/atd-demo/lib32/
  elif [ "$CARCH" == "x86_64" ]; then
    cp lib32/{libboost_,libSDL_mixer,libsmpeg}* "$pkgdir"/opt/atd-demo/lib32/
  fi

  # install binary and launcher
  install -m755 ATDeluxe.Demo "$pkgdir"/opt/$pkgname/
  install -m755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -m644 ../$pkgname{,-fs}.desktop "$pkgdir"/usr/share/applications/

  # install licence
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
