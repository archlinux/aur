#!/usr/bin/env zsh
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=gnome-next-meeting-applet
opkgname=gnome_next_meeting_applet
pkgver=2.11.0
pkgrel=1
pkgdesc="An applet to show your next meetings from Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/gnome-next-meeting-applet"
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-humanize' 'libappindicator-gtk3' 'gnome-shell-extension-appindicator' 'evolution-data-server' 'evolution-data-server' 'python-dateutil' 'python-dbus' 'python-cairo')
source=( ${url}/releases/download/${pkgver}/${opkgname}-${pkgver}.tar.gz )
sha256sums=('e8cc5afeb88ac171ade73d93eff3249983854b5701369f4f3643483d54c6dc09')
makedepends=("python-poetry-core")

build() {
  cd "${srcdir}/$opkgname-$pkgver"
  python -m build -wn
}

package() {
  cd "${srcdir}/${opkgname}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer -d "$pkgdir" dist/*.whl
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp -a data/images ${pkgdir}/usr/share/${pkgname}/
  install -Dp -m644 data/desktop/com.chmouel.gnomeNextMeetingApplet.appdata.xml ${pkgdir}/usr/share/metainfo/com.chmouel.gnomeNextMeetingApplet.appdata.xml
  install -Dp -m644 data/desktop/com.chmouel.gnomeNextMeetingApplet.desktop ${pkgdir}/usr/share/applications/com.chmouel.gnomeNextMeetingApplet.desktop
  install -m0644 -Dp data/desktop/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  install -m0644 -Dp config.sample.yaml ${pkgdir}/usr/share/docs/${pkgname}
}

