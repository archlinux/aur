# Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=nut-monitor
pkgver=2.8.0
pkgrel=2
pkgdesc="GUI to manage devices connected a NUT server"
arch=('any')
url="http://www.networkupstools.org/"
license=('GPL3')
depends=('python' 'python-pyqt5' 'hicolor-icon-theme')
makedepends=('desktop-file-utils')
source=("http://www.networkupstools.org/source/2.8/nut-$pkgver.tar.gz")
sha256sums=('c3e5a708da797b7c70b653d37b1206a000fcb503b85519fe4cdf6353f792bfe5')

prepare() {
  cd "$srcdir/nut-$pkgver"

  sed -i 's|os.path.dirname( sys.argv\[0\] )|"/usr/share/nut-monitor"|' scripts/python/app/NUT-Monitor-py3qt5.in
}

build() {
  cd "$srcdir/nut-$pkgver"

  ./configure \
    --prefix=/usr \
    --without-python2
}

package() {
  cd "$srcdir/nut-$pkgver"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -v -d -m 755 "${pkgdir}${site_packages}"
  install -m644 scripts/python/module/PyNUT.py "${pkgdir}${site_packages}"

  install -v -d -m 755 ${pkgdir}/usr/{bin,share/{appdata,nut-monitor/{pixmaps,ui,icons/256x256}}}
  install -m 755 scripts/python/app/NUT-Monitor-py3qt5 ${pkgdir}/usr/bin
  install -m 644 scripts/python/app/nut-monitor.appdata.xml ${pkgdir}/usr/share/appdata
  install -m 644 scripts/python/app/pixmaps/* ${pkgdir}/usr/share/nut-monitor/pixmaps
  install -m 644 scripts/python/app/ui/*.ui ${pkgdir}/usr/share/nut-monitor/ui
  install -m 644 scripts/python/app/icons/256x256/nut-monitor.png ${pkgdir}/usr/share/nut-monitor/icons/256x256

  for size in {48x48,64x64,256x256,scalable}; do
    install -v -d -m 755 ${pkgdir}/usr/share/icons/hicolor/${size}/apps
    install -m 644 scripts/python/app/icons/${size}/* ${pkgdir}/usr/share/icons/hicolor/${size}/apps
  done

  desktop-file-install --dir=$pkgdir/usr/share/applications scripts/python/app/nut-monitor-py3qt5.desktop

  ln -s NUT-Monitor-py3qt5 ${pkgdir}/usr/bin/nut-monitor
}
