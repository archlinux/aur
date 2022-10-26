#!/usr/bin/env zsh
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=gnome-next-meeting-applet
opkgname=gnome_next_meeting_applet
pkgver=2.9.1
pkgrel=1
pkgdesc="An applet to show your next meetings from Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/gnome-next-meeting-applet"
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-humanize' 'libappindicator-gtk3' 'gnome-shell-extension-appindicator' 'evolution-data-server' 'evolution-data-server' 'python-dateutil' 'python-dbus')
source=( ${url}/releases/download/${pkgver}/${opkgname}-${pkgver}.tar.gz )
sha256sums=('b764e3b6d7141f56fc6cdf09d3dccf8dabcb420d58391936a8e4f9ff690129a2')
makedepends=("python-setuptools")

prepare(){
  cd "${srcdir}/$opkgname-$pkgver"
  sed  -i "/.*dbus-python.*/d" setup.py
}

build() {
  cd "${srcdir}/$opkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${opkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp -a data/images ${pkgdir}/usr/share/${pkgname}/
  install -Dp -m644 data/desktop/com.chmouel.gnomeNextMeetingApplet.appdata.xml ${pkgdir}/usr/share/metainfo/com.chmouel.gnomeNextMeetingApplet.appdata.xml
  install -Dp -m644 data/desktop/com.chmouel.gnomeNextMeetingApplet.desktop ${pkgdir}/usr/share/applications/com.chmouel.gnomeNextMeetingApplet.desktop
  install -m0644 -Dp data/desktop/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  install -m0644 -Dp config.sample.yaml ${pkgdir}/usr/share/docs/${pkgname}
}
