# Maintainer: Guoyi Zhang <guoyi zhang at malacology dot net>
# Contributor: syne <madlikene at aim dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgbase=mesquite
pkgname=('mesquite' 'mesquite-extra' 'mesquite-doc')
pkgver=3.81_build955
pkgrel=1
arch=('any')
url="http://mesquiteproject.org"
license=('LGPL')
makedepends=('java-environment=8' 'maven' 'git' 'libicns' 'gendesk')
source=($pkgbase::git+https://github.com/MesquiteProject/MesquiteCore.git#tag=v${pkgver//_/-}
	$pkgbase.patch::https://github.com/MesquiteProject/MesquiteCore/pull/108.patch
        )
md5sums=('SKIP'
         '530fb128307845f75633ee897715b2c3')
prepare() {
  cd $srcdir/$pkgbase
  patch -p1 < $srcdir/$pkgbase.patch
}

build() {
  cd $srcdir/$pkgbase
  
  # compile pkg
  mvn package
  
  # generate desktop
  gendesk --pkgname "$pkgbase" --pkgdesc "A modular, extendible software for evolutionary biology, designed to help biologists organize and analyze comparative data about organisms" --exec="$pkgbase" --icon="$pkgbase"

  # generate binary
  echo "java -jar /usr/share/$pkgbase/Mesquite.jar" >> $pkgbase
  chmod +x $pkgbase

  cd target/classes
  rm -rf *.exe Mesquite_Start* starting* Running* examples
}

package_mesquite() {
  depends=('java-runtime=8' 'sh' 'python')
  pkgdesc="A modular, extendible software for evolutionary biology, designed to help biologists organize and analyze comparative data about organisms"
  optdepends=('mesquite-doc: doc for mesquite'
	      'mesquite-extra: extra data for mesquite')
  cd $srcdir/$pkgname
  cd target/classes

  # Install program files
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -r * $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 '{}' \;

  # Install icons 
  cd $srcdir/$pkgname/Executables/"MacOS via Automator and Script"
  icns2png -x Mesquite.icns
  install -Dm 644 Mesquite_128x128x32.png $pkgdir/usr/share/pixmaps/$pkgname.png

  # install binary
  install -Dm755 $srcdir/$pkgbase/$pkgbase $pkgdir/usr/bin/$pkgbase

  # Install a desktop entry
  install -Dm755 ${srcdir}/$pkgbase/$pkgbase.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

package_mesquite-doc(){
  pkgdesc="doc for mesquite"
  cd $srcdir/$pkgbase
  mkdir -p $pkgdir/usr/share/doc/$pkgbase/
  mv docs/* $pkgdir/usr/share/doc/$pkgbase/
  mkdir -p $pkgdir/usr/share/$pkgbase/
  ln -s /usr/share/doc/$pkgbase $pkgdir/usr/share/$pkgbase/docs
}

package_mesquite-extra(){
  pkgdesc="extra data for mesquite"
  cd $srcdir/$pkgbase
  mkdir -p $pkgdir/usr/share/$pkgbase/
  cd Resources
  mv examples $pkgdir/usr/share/$pkgbase/
}
