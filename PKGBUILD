# Maintainer: Matthias Mailänder <matthias@mailaender.name>
# Contributor: saxonbeta <saxonbeta at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=mmass
pkgver=5.5.0
pkgrel=4
pkgdesc="Open Source tool for precise mass spectrometric data analysis and interpretation written in Python."
arch=('i686' 'x86_64')
url="http://www.mmass.org"
license=('GPL-3.0')
depends=('hicolor-icon-theme' 'python2-wxpython3' 'python2-numpy')
makedepends=('unzip')
checkdepends=('desktop-file-utils')
source=("http://www.mmass.org/download/files/v${pkgver}/mmass_v${pkgver}_source.zip"
        "mmass.desktop"
        "mmass.install"
        "mmass.xml")
sha256sums=('e75e0792b51ed16f5b772f285b1be2031a0906fd35b02294752ccf816258508c'
            'SKIP'
            'SKIP'
            'SKIP')

prep() {
  dos2unix mspy/plot_canvas.py

  sed -i 's/\r$//' license.txt

  sed -i -e '1i#!/usr/bin/python' gui/*.py
  sed -i -e '1i#!/usr/bin/python' mspy/*.py

  rm mspy/calculations.so setup.py
}

build() {
  cd "mMass"

  pushd mspy
    python2 setup.py build
    mv -f build/lib.*/calculations.so ./calculations.so
  popd
}

check() {
  desktop-file-validate mmass.desktop
}

package() {
  install -Dm0644 mmass.desktop "$pkgdir"/usr/share/applications/mmass.desktop
  install -Dm0644 $srcdir/mmass.xml "$pkgdir"/usr/share/mime/packages/mmass.xml

  cd "mMass"

  pushd mspy
    python2 setup.py install --skip-build --prefix=/usr --root=$pkgdir/
  popd

  rm mspy/setup.py
  rm mspy/*.pyd

  mkdir -p "$pkgdir"/usr/lib/python2.7/mmass/configs/
  mkdir -p "$pkgdir"/usr/lib/python2.7/mmass/gui
  mkdir -p "$pkgdir"/usr/lib/python2.7/mmass/mspy/
  mkdir -p "$pkgdir"/usr/share/mmass/database
  install -Dm0755 mspy/*.py* "$pkgdir"/usr/lib/python2.7/mmass/mspy
  install -Dm0755 mspy/*.so "$pkgdir"/usr/lib/python2.7/mmass/mspy
  install -Dm0644 configs/*.xml "$pkgdir"/usr/lib/python2.7/mmass/configs
  install -Dm0755 gui/*.py* "$pkgdir"/usr/lib/python2.7/mmass/gui
  install -Dm0644 gui/images/gtk/icon_about.png "$pkgdir"/usr/lib/python2.7/mmass/gui/images/gtk
  install -Dm0755 mmass.py* "$pkgdir"/usr/lib/python2.7/mmass

  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/python2.7/mmass/mmass.py "$pkgdir"/usr/bin/mmass

  install -Dm0644 configs/*.xml "$pkgdir"/usr/share/mmass/database

  install -Dm0644 gui/images/gtk/icon_128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/mmass.png
  install -Dm0644 gui/images/gtk/icon_256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/mmass.png
  install -Dm0644 gui/images/gtk/icon_512.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/mmass.png

  sed -i -e '1i#!/usr/bin/python' "$pkgdir"/usr/lib/python2.7/mmass/mmass.py
  find "$pkgdir"/usr/lib/python2.7/ -name "*.py" | xargs sed -i '1s|/usr/bin/python|/usr/bin/python2|'
}
