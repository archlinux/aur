# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>

pkgname=remotepc-bin
altpkgname=remotepc
pkgver=4.17.2
pkgrel=1
provides=('remotepc')
pkgdesc="Access your remote computer from any Windows, Mac, or Linux computer, iOS or Android device, or via the web"
arch=('x86_64')
url="https://www.remotepc.com"
dlurl="https://static.remotepc.com/downloads"
shortname="rpc"
internalnum="310320"
license=('custom')
install="services.install"
source=(${altpkgname}-${pkgver}.deb::${dlurl}/${shortname}/${internalnum}/${altpkgname}.deb)
sha1sums=('862cdc1f343bddd0d5dd9cf2e62ee12da8ea28dd')

package() {
 cd ${srcdir}
  
 # Extract files from the .deb archive
 ar xvf ${altpkgname}-${pkgver}.deb
 tar xvf data.tar.xz
 tar xvf control.tar.gz

 # Copy directories exactly as found in the .deb archive instructions
 cp -rv "${srcdir}/opt" "${pkgdir}"
 cp -rv "${srcdir}/usr" "${pkgdir}"
  
 # Prepare files and directories based on .deb archive instructions
 touch "${pkgdir}/opt/remotepc/chrome-sandbox"
 chmod 4755 "${pkgdir}/opt/remotepc/chrome-sandbox"
 touch "${pkgdir}/opt/remotepc/resources/isTnCAccepted"
 chmod ugo+rwx "${pkgdir}/opt/remotepc/resources/isTnCAccepted"
 
 # Prepare services directories and copy systemd units from /opt/ directory in .deb archive
 mkdir -pv "${pkgdir}/etc/systemd/system"
 mkdir -pv "${pkgdir}/etc/systemd/user"
 mkdir -pv "${pkgdir}/usr/bin"
 
 cp -fv "${pkgdir}/opt/remotepc/remotepc.service" "${pkgdir}/etc/systemd/system/"
 cp -fv "${pkgdir}/opt/remotepc/remotepc_installer.service" "${pkgdir}/etc/systemd/system/"
 cp -fv "${pkgdir}/opt/remotepc/remotepc-desktop.service" "${pkgdir}/etc/systemd/user/"

 # Make symlink to binary executable
 ln -sfv "${pkgdir}/opt/remotepc/remotepc" "${pkgdir}/usr/bin/remotepc"

 # Prepare exclusive log directory
 mkdir -pv "${pkgdir}/var/log/remotepc/remotePrinter"
 chmod 777 "${pkgdir}/var/log/remotepc/remotePrinter"
}

