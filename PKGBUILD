# Contributor: Sergio Tridente <tioduke AT gmail DOT com>

pkgname=gate
pkgver=8.6
pkgrel=1
pkgdesc="GATE Developer is a development environment that provides a rich set of graphical interactive tools for the creation, measurement and maintenance of software components for processing human language."
arch=('any')
url="http://gate.ac.uk/"
license=('LGPL')
depends=('java-runtime')
options=(!strip)
source=(https://github.com/GateNLP/gate-core/releases/download/v${pkgver}/gate-developer-${pkgver}-distro.zip gate.desktop gate.png)
md5sums=('162d7a174098748d21ff0cee155e5de7'
         'a7a2cb37bf093d4b4164c7d381661f33'
         'acf3e7a9fcbdedd24589394260d56d12')

build() {
  rm -rf $srcdir/${pkgname}-developer-${pkgver}/GATE.app
  find $srcdir/${pkgname}-developer-${pkgver} -name "*.bat" -type f -exec rm {} \;
  find $srcdir/${pkgname}-developer-${pkgver} -name "*.cmd" -type f -exec rm {} \;
  find $srcdir/${pkgname}-developer-${pkgver} -name "*.exe" -type f -exec rm {} \;
}

package() {
  mkdir -p $pkgdir/usr/share/java/${pkgname}/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/doc/${pkgname}/
  mkdir -p $pkgdir/usr/share/doc/${pkgname}/lib/
  mkdir -p $pkgdir/usr/share/{pixmaps,applications}

  cp -r $srcdir/${pkgname}-developer-${pkgver}/* $pkgdir/usr/share/java/${pkgname}/
  find $pkgdir/usr/share/java/${pkgname} -type f -exec chmod 644 {} \;
  find $pkgdir/usr/share/java/${pkgname} -type d -exec chmod 755 {} \;
  find $pkgdir/usr/share/java/${pkgname} -name "*.pl" -type f -exec chmod 755 {} \;
  find $pkgdir/usr/share/java/${pkgname} -type f -exec egrep -q "#\! ?/bin/(ba)?sh" {} \; -exec chmod 755 {} \;

  ln -s /usr/share/java/${pkgname}/bin/gate.sh $pkgdir/usr/bin/${pkgname}

  cd $srcdir
  install -Dm644 gate.png $pkgdir/usr/share/pixmaps/
  install -Dm644 gate.desktop $pkgdir/usr/share/applications/
}
