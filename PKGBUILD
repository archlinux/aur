# Maintainer: saxonbeta <saxonbeta at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=mmass
pkgver=5.5.0
pkgrel=3
pkgdesc="Open source tool for precise mass spectrometric data analysis and interpretation written in python."
arch=('i686' 'x86_64')
url="http://www.mmass.org"
license=('GPL')
depends=('python2-numpy' 'wxpython2.8')
source=(${url}/download/files/v${pkgver}/${pkgname}_v${pkgver}_source.zip
	mMass.desktop
	mMass.xml
  mMass.install)
install=mMass.install
sha256sums=('e75e0792b51ed16f5b772f285b1be2031a0906fd35b02294752ccf816258508c'
	    '7ff1fc2fdb2f2183819b85a0a1cbbd672cf8222efbc25447139db883b01d0ed4'
      '653e64ff46c4c0ddc2f7973ce1477670f7c0c5d4c9321aa3b7afa2c42a948793'
      '2c0ef77eeb0f20e2ab1381e82854cc46cbb7e176a921cd80e4a67bb25bc6c6ac')


prepare() {
  cd "$srcdir/mMass/"
  #Patch to use wxpython 2.8
  sed -i "/import wx/iimport wxversion\nwxversion.select('2.8')" mmass.py
  
}
  

build() {
  cd "$srcdir/mMass/mspy"
  python2 setup.py build
  cp build/lib.linux-*-*/calculations.so .
}

package() {
  cd "$srcdir/mMass"
  install -m 0755 -d $pkgdir/usr/bin
  install -m 0755 -d $pkgdir/usr/share/$pkgname
  install -m 0755 -d $pkgdir/usr/share/$pkgname/{configs,gui,mspy}
  install -m 0755 -d $pkgdir/usr/share/$pkgname/gui/images/gtk
  install -m 0644 mmass.py $pkgdir/usr/share/$pkgname
  install -m 0644 'User Guide.pdf' $pkgdir/usr/share/$pkgname
  install -m 0644 configs/*.xml $pkgdir/usr/share/$pkgname/configs
  install -m 0644 gui/*.py $pkgdir/usr/share/$pkgname/gui
  install -m 0644 gui/images/gtk/*.png $pkgdir/usr/share/$pkgname/gui/images/gtk
  install -m 0644 mspy/*.py $pkgdir/usr/share/$pkgname/mspy
  install -m 0755 mspy/calculations.so $pkgdir/usr/share/$pkgname/mspy
  install -Dm 644 gui/images/gtk/icon_48.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm 644 $srcdir/mMass.desktop $pkgdir/usr/share/applications/mMass.desktop
  install -Dm644 $srcdir/mMass.xml $pkgdir/usr/share/mime/packages/mMass.xml
  cat >$pkgdir/usr/bin/mmass <<EOF
#!/bin/sh
python2 /usr/share/mmass/mmass.py ""
EOF
  chmod 0755 $pkgdir/usr/bin/mmass
}

# vim:set ts=2 sw=2 et:
