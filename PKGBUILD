# Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=nut-monitor-git
pkgver=2.8.1.r256.gec3df0ef4
pkgrel=1
pkgdesc="GUI to manage devices connected a NUT server"
arch=('any')
url="http://www.networkupstools.org/"
license=('GPL3')
depends=('nut' 'python' 'python-pyqt5' 'hicolor-icon-theme')
provides=('nut-monitor')
conflicts=('nut-monitor')
makedepends=('desktop-file-utils' 'git')
source=('git+https://github.com/networkupstools/nut.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/nut"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "$srcdir/nut"

  ./autogen.sh
  
  sed -i 's|os.path.dirname( sys.argv\[0\] )|"/usr/share/nut-monitor"|' scripts/python/app/NUT-Monitor-py3qt5.in
}

build() {
  cd "$srcdir/nut"

  ./configure \
    --prefix=/usr \
    --without-python2
}

package() {
  cd "$srcdir/nut"

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
