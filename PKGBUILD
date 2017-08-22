# Maintainer: Christian Schwarz <me@cschwarz.com>
pkgname=artisan-roaster-scope
pkgver=1.1.0
pkgrel=1
pkgdesc="Artisan is a software that helps coffee roasters record, analyze, and control roast profiles."
arch=("any")
url="https://github.com/artisan-roaster-scope/artisan"
license=('GPL3')
depends=( "python2"
          "python2-sip"
          "python2-scipy"
          "python2-numpy"
          "python2-pyserial"
          "python2-requests"
          "python2-pyqt5"
          "python2-matplotlib"
          "python2-qrcode"
          "python2-bottle"
          "python2-gevent"
          "python2-gevent-websocket"
          "python2-phidgets"
          "python2-pymodbus"
          "python2-yoctopuce"
          "python2-unidecode"
)
makedepends=('git')
source=(
"https://github.com/artisan-roaster-scope/artisan/archive/v${pkgver}.tar.gz"
"artisan-v1.1.0-bugs.patch"
)
md5sums=(
'87d84a79537c3c66fafa367d779eeb17'
'72da7888224102ee896a1d1ebebaa1b5'
)
#generate with 'makepkg -g'

install="$pkgname.install"

prepare() {
  
  cd "$srcdir/artisan-${pkgver}"

  # Package thinks /usr/bin/env python returns python2 
  find .  -name "*.py" -exec sed -i \
            "s/#\!\/usr\/bin\/env python[\s\n]*/#\!\/usr\/bin\/env python2/" {} +
  find .  -name "*.py" -exec sed -i \
            "s/#\!\/usr\/bin\/python/#\!\/usr\/bin\/python2/" {} +

}

package() {
  
  cd "$srcdir/artisan-${pkgver}/src"
  patch artisanlib/main.py "$srcdir/artisan-v1.1.0-bugs.patch"


  # Copy the relevant project files to usr/share/artisan  
  cp -r debian/usr "$pkgdir/"
  
  usrshr="$pkgdir/usr/share/artisan"

  install -m755 -d "$usrshr"

  cp -r artisanlib "$usrshr"
  cp artisan*.{icns,ico,png,pro,py} "$usrshr"
  cp Comm*.py "$usrshr"
  cp -r const "$usrshr"
  cp -r icons "$usrshr"
  cp -r includes "$usrshr"
  cp KERNpython3.py "$usrshr"
  cp LICENSE.txt "$usrshr"
  cp qt.conf "$usrshr"
  cp -r translations "$usrshr"
  cp -r Wheels "$usrshr"

  # xdg-mime filetype descriptions
  install -m755 -d "$pkgdir/usr/share/appdata"
  cp *.xml "$pkgdir/usr/share/appdata"

  # Make main script executable
  chmod +x "$usrshr/artisan.py"

  # Create a symlink to the main python script in usr/bin
  install -m755 -d "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -sf "../share/artisan/artisan.py" artisan

}

# vim:set ts=2 sw=2 et:
