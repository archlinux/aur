# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=atd-demo
_pkgdate=20150515
_pkgver=1.08
pkgver=$_pkgver.$_pkgdate
pkgrel=1
pkgdesc="Demo of Airline Tycoon Deluxe for Linux"
url="http://rune-soft.com/Games/Released/Game-239/game=Airline_Tycoon_Deluxe-6"
arch=('i686' 'x86_64')
license=('custom: commercial')
depends_x86_64=('lib32-sdl2_mixer' 'lib32-physfs' 'lib32-smpeg2')
depends_i686=('sdl2_mixer' 'physfs' 'smpeg2')
conflicts=('atd')
options=('!strip')
install=$pkgname.install
source=("https://bitbucket.org/runesoftdev/airline_public/downloads/airline.tycoon.deluxe_$_pkgver-multilingual.demo_x86-$_pkgdate.mojo.run"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname-fs.desktop")
sha256sums=('1524e546684338fd14daa6077f2864657a75190528dbbdadfee7e26d897a27a1'
            '27d7adba7f9a009c9bac82933fc36d022c5b9375a445185214f208808052abdc'
            '1283409822fe71ead358974484f1536897becf68b21141ecac02affea4434884'
            '9118736b33fa8e5b096a9ed26f66404b7345573dd80a1cb116de8ed867e2e901')

prepare() {
  # unpack
  bsdtar -xf data/data.tar
}

package() {
  # install data files (ensure file permissions)
  install -d "$pkgdir"/opt/$pkgname/{gli,misc,room,sound,video}
  install -d "$pkgdir"/opt/$pkgname/{de,en,fr}/{data,gli,misc}
  for _file in {gli,misc,room,sound,video}/* \
    {de,en,fr}/{data,gli,misc}/* {language,runelogo,spellbound}.bmp
  do
    install -m0644 $_file "$pkgdir"/opt/$pkgname/$_file
  done

  # install the needed old boost libraries
  install -d "$pkgdir"/opt/$pkgname/lib32
  install -m0644 lib32/libboost_* "$pkgdir"/opt/$pkgname/lib32

  # install binary, launcher and .desktop files
  install -m0755 ATDeluxe.Demo "$pkgdir"/opt/$pkgname
  install -Dm0755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm0644 ATDeluxe.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm
  install -d "$pkgdir"/usr/share/applications
  install -m0644 $pkgname{,-fs}.desktop "$pkgdir"/usr/share/applications
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m0644 {Handbuch,Manual,Manuel}.pdf CHANGELOG README \
    "$pkgdir"/usr/share/doc/$pkgname
  # licence
  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
