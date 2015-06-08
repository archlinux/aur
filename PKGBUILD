# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='th06-demo'
pkgname=('th06-demo-data' 'th06-demo-wine' 'th06-demo-pytouhou')
pkgver=0.13
pkgrel=3
url='http://www16.big.or.jp/~zun/html/th06.html'
arch=('any')
license=('custom')
makedepends=('convmv' 'icoutils')
source=('http://www16.big.or.jp/~zun/data/soft/kouma_tr013.lzh'
        "$pkgbase-wine.desktop" "$pkgbase-wine.sh"
        "$pkgbase-pytouhou.desktop" "$pkgbase-pytouhou.sh")
sha1sums=('dfeb4dd358c6613ec4d8b701d41672ca75b6a0c9'
          '333378812ca70ba6c075abef71e6743e8cd331ca'
          '96bdc21f1e4f14bfeb19ff7025e83e658ec50f33'
          '93d2273e95886b29dfd94af22a485b0b50706ba8'
          '4591e137f7948508140c5014d11eacad41b63b0d')

prepare() {
  cd "$srcdir"
  convmv -f CP932 -t UTF-8 -r --notest .
}

package_th06-demo-data() {
  pkgdesc='Embodiment of Scarlet Devil trial version. Sixth game of the Touhou Project series; data files.'

  cd "$srcdir/東方紅魔郷　体験版"

  install -dm755 "$pkgdir/usr/share/$pkgbase"
  install -m755 *.exe "$pkgdir/usr/share/$pkgbase"
  install -m644 *.DAT "$pkgdir/usr/share/$pkgbase"

  install -dm755 "$pkgdir/usr/share/doc/$pkgbase/html"
  install -m644 *.txt 'マニュアル/index.html' "$pkgdir/usr/share/doc/$pkgbase"
  install -m644 マニュアル/html/* "$pkgdir/usr/share/doc/$pkgbase/html"

  install -dm755 "$pkgdir/usr/share/pixmaps"
  wrestool -x -o th06-demo.ico 東方紅魔郷.exe
  install -m644 th06-demo.ico "$pkgdir/usr/share/pixmaps"

  # Here we convert the ico file to png, not sure if it’s worth it.
  icotool -x th06-demo.ico
  install -m644 th06-demo_1_32x32x8.png  "$pkgdir/usr/share/pixmaps/th06-demo.png"
}

package_th06-demo-wine() {
  pkgdesc='Embodiment of Scarlet Devil trial version. Sixth game of the Touhou Project series; Wine version.'
  depends=("$pkgbase-data" 'wine')
  optdepends=('timidity++: for MIDI musics')

  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications"

  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

package_th06-demo-pytouhou() {
  pkgdesc='Embodiment of Scarlet Devil trial version. Sixth game of the Touhou Project series; PyTouhou version.'
  depends=("$pkgbase-data" 'pytouhou-hg')

  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications"

  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
