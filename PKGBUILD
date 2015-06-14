# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=rasterbator
pkgver=1.21
pkgrel=2
pkgdesc="Create huge, rasterized images from any picture."
url="http://arje.net/rasterbator"
license=('custom')
arch=('i686' 'x86_64')
depends=('mono')
source=(http://arje.net/files/Rasterbator_Standalone_${pkgver}.zip
        http://www.gnu.org/licenses/agpl-3.0.txt
        readme.licenses
        $pkgname.patch
        $pkgname
        $pkgname.png
        $pkgname.desktop)
md5sums=('426ed9e545433d6d4b83ce555539c48a'
         '73f1eb20517c55bf9493b7dd6e480788'
         '1da706012a634ece69c0ad83f0321640'
         'd60a3b969f3e413584a4be1b7cd19114'
         'd26d0e432dc4ec0f80bac0cda5978efa'
         '49753e22af9b3268d31825bc2c502a18'
         '679d0dbd73404815d6e6b0b35c3910b7')

prepare() {
  cd Rasterbator\ Standalone/source
  patch MainForm.cs < $srcdir/$pkgname.patch
}

build() {
  cd Rasterbator\ Standalone/source
  mcs -out:../Rasterbator.exe -unsafe -resource:Rasterbator.MainForm.resources \
   -r:System.Windows.Forms -r:System.Drawing -r:../itextsharp.dll *.cs
}

package() {
  install -d $pkgdir/usr/{bin,share/{applications,pixmaps,licenses/$pkgname,doc/$pkgname/docfiles,$pkgname/languages}}

  install -m755 $pkgname $pkgdir/usr/bin
  install -m644 $pkgname.png $pkgdir/usr/share/pixmaps
  install -m644 $pkgname.desktop $pkgdir/usr/share/applications
  install -m644 agpl-3.0.txt $pkgdir/usr/share/licenses/$pkgname
  install -m644 readme.licenses $pkgdir/usr/share/licenses/$pkgname

  cd Rasterbator\ Standalone
  install -m644 Rasterbator.exe $pkgdir/usr/share/$pkgname
  install -m644 -t $pkgdir/usr/share/$pkgname *.dll
  install -m644 -t $pkgdir/usr/share/$pkgname/languages languages/*
  install -m644 -t $pkgdir/usr/share/doc/$pkgname/docfiles docfiles/*
  install -m644 readme.html $pkgdir/usr/share/doc/$pkgname
}