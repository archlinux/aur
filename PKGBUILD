# Maintainer: Dave Blair <mail@dave-blair.de>
# Contributor: Nick Bair <njbair at gmail dot com>
pkgname=bubbleupnpserver
pkgver=0.9.23
pkgrel=2
pkgdesc="Stream content to Android devices over the Internet – requires UPNP/DNLA backend e.g. Mediatomb"
arch=('any')
url="http://www.bubblesoftapps.com/bubbleupnpserver/"
license=('custom:bubbleupnpserver')
depends=('java-runtime>=7' 'ffmpeg')
makedepends=('unzip')
install=${pkgname}.install
source=("http://www.bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip")
md5sums=('83e4df8da91f577a138143ceecd6d120')

build() {
  cd ${srcdir}

  unzip -qfo "${srcdir}/BubbleUPnPServer-distrib.zip" -d ${srcdir}

  msg2 "Creating a shell-accessible script"
  echo "#! /bin/bash
sudo /usr/share/${pkgname}/launch.sh
" > ${srcdir}/${pkgname}.sh

  msg2 "Installing systemd service unit file..."
  echo "[Unit]
Description=BubbleUPnP Server
[Service]
ExecStart=/usr/share/${pkgname}/launch.sh
SuccessExitStatus=1 2 SIGKILL
[Install]
WantedBy=network.target" > ${srcdir}/${pkgname}.service
}

package() {
  install -D -m644 ${srcdir}/LICENCE.txt                      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ${srcdir}/bcprov-jdk16-146.jar             ${pkgdir}/usr/share/${pkgname}/bcprov-jdk16-146.jar 
  install -D -m644 ${srcdir}/BubbleUPnPServerLauncher.jar     ${pkgdir}/usr/share/${pkgname}/BubbleUPnPServerLauncher.jar 
  install -D -m755 ${srcdir}/launch.sh                        ${pkgdir}/usr/share/${pkgname}/launch.sh
  install -D -m644 ${srcdir}/${pkgname}.service               ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -D -m755 ${srcdir}/${pkgname}.sh                    ${pkgdir}/usr/bin/${pkgname}.sh
}
