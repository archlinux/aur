# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=atd-demo
_pkgdate=20130212
_pkgver=1.08
pkgver=$_pkgver.$_pkgdate
pkgrel=3
pkgdesc="Demo of Airline Tycoon Deluxe for Linux"
url="http://rune-soft.com/Games/Released/Game-239/game=Airline_Tycoon_Deluxe-6"
arch=('i686' 'x86_64')
license=('custom')
depends_x86_64=('lib32-sdl_mixer')
depends_i686=('sdl_mixer')
conflicts=('atd')
options=('!strip')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://rune-soft.com/upload/documents/airline.tycoon.deluxe_$_pkgver-english.demo_x86-$_pkgdate.mojo.run"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname-fs.desktop")
sha256sums=('ff0b2f03cbfda4fe13aa803ced484d29e528a3b1bd30f04b03617c10ce7cda55'
            'b2ed7a9e4b98705592c591f367807d1e1e1c64f926cc0ac4477e4948ca6a8a73'
            '1bafcb9b0ccf33d8bdd607fd55fcbbfae7336a43a2a7acae12093cc7ebbe2b29'
            'a4499498fe6fd35a3a972e0bc6f84caa2a2531f910fae6a42388dabe54305fb5')

prepare() {
  cd data

  # unpack binary and libs
  bsdtar -xf bins.and.libs.tar.xz
}

package() {
  cd data

  # install data files (ensure file permissions)
  install -d "$pkgdir"/opt/$pkgname/{data,gli,misc,room,sound,video}
  for _file in {data,gli,misc,room,sound,video}/* {runelogo,spellbound}.bmp
  do
    install -m644 $_file "$pkgdir"/opt/$pkgname/$_file
  done

  # install the needed old boost libraries
  install -d "$pkgdir"/opt/$pkgname/lib32
  install -m644 lib32/libboost_* "$pkgdir"/opt/$pkgname/lib32

  # install binary, launcher and .desktop files
  install -m755 ATDeluxe.Demo "$pkgdir"/opt/$pkgname
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ATDeluxe.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -m644 ../$pkgname-fs.desktop "$pkgdir"/usr/share/applications
  # doc
  install -Dm644 Manual.pdf "$pkgdir"/usr/share/doc/$pkgname/Manual.pdf
  install -m644 CHANGELOG README "$pkgdir"/usr/share/doc/$pkgname
  # licence
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
