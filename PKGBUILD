# Contributor: Sergio Tridente <tioduke AT gmail DOT com>

pkgname=gate
pkgver=8.4
_build=5748
pkgrel=1
pkgdesc="GATE Developer is a development environment that provides a rich set of graphical interactive tools for the creation, measurement and maintenance of software components for processing human language."
arch=('any')
url="http://gate.ac.uk/"
license=('LGPL')
depends=('java-runtime')
options=(!strip)
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-build${_build}-BIN.zip gate.desktop gate.png)
md5sums=('6b1d2d703625453dc2391e9c32dfa5bd'
         'a7a2cb37bf093d4b4164c7d381661f33'
         'acf3e7a9fcbdedd24589394260d56d12')

build() {
  rm -rf $srcdir/${pkgname}-${pkgver}-build${_build}-BIN/GATE.app
  find $srcdir/${pkgname}-${pkgver}-build${_build}-BIN -name "*.bat" -type f -exec rm {} \;
  find $srcdir/${pkgname}-${pkgver}-build${_build}-BIN -name "*.cmd" -type f -exec rm {} \;
  find $srcdir/${pkgname}-${pkgver}-build${_build}-BIN -name "*.exe" -type f -exec rm {} \;
}

package() {
  mkdir -p $pkgdir/usr/share/java/${pkgname}/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/doc/${pkgname}/
  mkdir -p $pkgdir/usr/share/doc/${pkgname}/lib/
  mkdir -p $pkgdir/usr/share/{pixmaps,applications}

  cp -r $srcdir/${pkgname}-${pkgver}-build${_build}-BIN/* $pkgdir/usr/share/java/${pkgname}/
  find $pkgdir/usr/share/java/${pkgname} -type f -exec chmod 644 {} \;
  find $pkgdir/usr/share/java/${pkgname} -type d -exec chmod 755 {} \;
  find $pkgdir/usr/share/java/${pkgname} -name "*.pl" -type f -exec chmod 755 {} \;
  find $pkgdir/usr/share/java/${pkgname} -type f -exec egrep -q "#\! ?/bin/(ba)?sh" {} \; -exec chmod 755 {} \;

  ln -s /usr/share/java/${pkgname}/bin/gate.sh $pkgdir/usr/bin/${pkgname}

  mv $pkgdir/usr/share/java/${pkgname}/{licence.html,tao.pdf} $pkgdir/usr/share/doc/${pkgname}/
  mv $pkgdir/usr/share/java/${pkgname}/lib/{ivy-report.css,*.html} $pkgdir/usr/share/doc/${pkgname}/lib/

  cd $srcdir
  install -Dm644 gate.png $pkgdir/usr/share/pixmaps/
  install -Dm644 gate.desktop $pkgdir/usr/share/applications/
}
