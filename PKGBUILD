# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=gnome-next-meeting-applet
pkgver=2.8.1
pkgrel=1
pkgdesc="An applet to show your next meetings from Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/gnome-next-meeting-applet"
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-humanize' 'libappindicator-gtk3' 'gnome-shell-extension-appindicator' 'evolution-data-server' 'evolution-data-server' 'python-dateutil' 'python-dbus')
source=( ${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz )
sha256sums=('677858f066f83029988a521b0658424d348d9a9d0f4a126cceba84a444fa60c1')
makedepends=("python-setuptools")

prepare(){
  cd "${srcdir}/$pkgname-$pkgver"
  sed  -i "/.*dbus-python.*/d" setup.py
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp -a data/images ${pkgdir}/usr/share/${pkgname}/
  install -Dp -m644 data/desktop/com.chmouel.gnomeNextMeetingApplet.appdata.xml ${pkgdir}/usr/share/metainfo/com.chmouel.gnomeNextMeetingApplet.appdata.xml
  install -Dp -m644 data/desktop/com.chmouel.gnomeNextMeetingApplet.desktop ${pkgdir}/usr/share/applications/com.chmouel.gnomeNextMeetingApplet.desktop
  install -m0644 -Dp data/desktop/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  install -m0644 -Dp config.sample.yaml ${pkgdir}/usr/share/docs/${pkgname}
}
