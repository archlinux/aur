# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Sergej Pupykin <sergej@p5n.pp.ru> 
# Contributor: Fabio Lolix <fabio.loli@disroot.org>>

pkgname=free-delta
pkgver=3.4.0
pkgrel=1
pkgdesc="An Open Source System for Processing Taxonomic Descriptions"
arch=('x86_64')
url="http://freedelta.sourceforge.net/"
#url="https://www.delta-intkey.com/"
license=('GPL-2.0-or-later')
depends=(gtk2 classic-delta)
makedepends=(lazarus imagemagick git)
source=("git+https://github.com/maurobio/freedelta.git#tag=v$pkgver"
	"Free_Delta_Editor.desktop"
	"${pkgver}.patch::https://github.com/maurobio/freedelta/compare/main...starsareintherose:freedelta:${pkgver}.patch"
	"https://packages.lazarus-ide.org/SynFacilSyn.zip"
	"https://packages.lazarus-ide.org/HtmlViewer.zip"
	"https://packages.lazarus-ide.org/HistoryFiles.zip"
	"git+https://github.com/skalogryz/richmemo.git")
sha256sums=('e7c9117075d257d14c4aee59dc3ce61eb9d58f257d7805aaa09b3c2f3c3fac35'
            'df398bcf5f3ef5ae7bddd624e309f9b30188eb1200befc436acf11f4a8fcd7c9'
            '364cc15da5fbd5ba6e101793f8f6c906ef31aba22ffaf5621d700986d3cbc786'
            '7d7176cb08b546c6f7537032aba9fbca60c72e17cfc66dc320ebcbb8a239b03a'
            '23425f67446a1751858c2a149da7669d1ee297cc2e724da719763ff015f274b4'
            '56921e78696d12690f0123e742d92663706386e6342a46e96a0ed9a14cbecc92'
            'SKIP')
prepare () {
  cd $srcdir/freedelta
  patch -N -i ${srcdir}/${pkgver}.patch
}
build () {
  # depends
  cd $srcdir/'SynFacilSyn 1.21'
  lazbuild --lazarusdir=/usr/lib/lazarus *.lpk
  cd $srcdir/HistoryFiles
  lazbuild --lazarusdir=/usr/lib/lazarus *.lpk
  cd $srcdir/HtmlViewer/package
  lazbuild --lazarusdir=/usr/lib/lazarus *.lpk
  cd $srcdir/richmemo
  lazbuild --lazarusdir=/usr/lib/lazarus --ws=gtk2 *.lpk
  
  # binary
  cd $srcdir/freedelta
  lazbuild --lazarusdir=/usr/lib/lazarus -r fde.lpi

  # desktop png
  convert "fde.ico" -thumbnail 256x256 -alpha on -background none -flatten "fde.png"
}
package() {
  install -dDm755 "$pkgdir"/usr/{bin,share/$pkgname}

  install -Dm 755 Free_Delta_Editor.desktop $pkgdir/usr/share/applications/Free_Delta_Editor.desktop
  
  cd freedelta

for dire in languages vocabulary
do
  cp -r $dire $pkgdir/usr/share/$pkgname/
done

  install -Dm 755 fde $pkgdir/usr/share/$pkgname/fde
  install -Dm 644 fde.png $pkgdir/usr/share/pixmaps/fde.png
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  ln -s /usr/share/$pkgname/fde $pkgdir/usr/bin/fde

# add function of free-delta
for prog in dist key confor
do
  ln -s /usr/bin/$prog $pkgdir/usr/share/$pkgname/$prog
done	
}
