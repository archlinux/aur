# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributors: rabyte, Ito

pkgname=lure
pkgver=1.1
pkgrel=4
pkgdesc="Fantasy point-and-click adventure game with comedic elements (aka Lure of the Temptress) - multi language"
arch=('any')
url="http://www.revolution.co.uk/games/lure/"
license=('custom')
depends=('scummvm')
optdepends=('bash: for the launchers')
install=lure.install
source=("http://downloads.sourceforge.net/scummvm/lure-$pkgver.zip"
        "http://downloads.sourceforge.net/scummvm/lure-de-$pkgver.zip"
        "http://downloads.sourceforge.net/scummvm/lure-fr-$pkgver.zip"
        "http://downloads.sourceforge.net/scummvm/lure-it-$pkgver.zip"
        "http://downloads.sourceforge.net/scummvm/lure-es-$pkgver.zip"
        "lure.sh")
sha256sums=('f3178245a1483da1168c3a11e70b65d33c389f1f5df63d4f3a356886c1890108'
            '5e83a6a8646629c55cfd84932b10231af2ff16d96e815ed0ce86564a0b3c186b'
            '2983149f9912a72761b1225e834a41d19aa565689b9027061a0220779694a1f8'
            '524270b2fb3f1caef621acf4379e3dbb69aed3c8ec1a98b38e94b290d3b046cf'
            '9306b9faad8c0a8189d3cbbfead511fc4d993655cc845cb8e15369baed2f7bb7'
            '78d30384f5398a68a8dd551b343c4a83d19af37a303f82c532566967de7e88e7')

package() {
  # make following language loops easier
  mv lure lure-en

  # copy data files
  for _l in en de es fr it; do
    for _d in 1 2 4; do
      # fix case of files
      [ $_l == de -o $_l == en ] && _f="Disk$_d.vga" || _f="DISK$_d.VGA"
      install -Dm644 lure-$_l/$_f "$pkgdir"/usr/share/lure/$_l/Disk$_d.vga
    done
    # link common file
    [ $_l == en ] || ln -s ../en/Disk3.vga "$pkgdir"/usr/share/lure/$_l/Disk3.vga
  done

  # doc
  install -Dm644 lure-en/PROTECT.PDF "$pkgdir"/usr/share/doc/lure/Protection.pdf
  install -m644 lure-en/README "$pkgdir"/usr/share/doc/lure
  for _l in en de es fr it; do
    install -m644 lure-$_l/Manual.pdf "$pkgdir"/usr/share/doc/lure/Manual-$_l.pdf
  done

  # license
  install -Dm644 lure-en/LICENSE.txt "$pkgdir"/usr/share/licenses/lure/LICENSE

  # launchers
  install -Dm755 lure.sh "$pkgdir"/usr/bin/lure-en
  for _l in de es fr it; do
    ln -s lure-en "$pkgdir"/usr/bin/lure-$_l
  done
}
