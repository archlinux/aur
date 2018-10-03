##########################################################################
# Maintainer:   Harsha Kuchampudi <harshakuchampudi AT gmail DOT com>
# Github:       https://github.com/hkuchampudi/Windscribe
# Updated:      2018-10-03
##########################################################################

pkgname=windscribe-cli
pkgver=1.3
pkgrel=19
pkgdesc="Port of Windscribe's command line interface"
arch=('x86_64' 'i686' 'armv6h')
url="https://windscribe.com/"
license=('GPL-2+')
depends=('openvpn')
optdepends=('stunnel')
replaces=('windscribe-cli')
install="windscribe-cli.install"
source_armv6h=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}-${pkgrel}_armhf.deb")
source_i686=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}-${pkgrel}_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_armv6h=('af8938c03355c7523f3abbe2090cbc43b7f782c3f1caf90c19b91b03173dd524')
sha256sums_i686=('141d9d229cd94de6d5212f909840682f5bf2d85f0de91407cf7fec28ff79161f')
sha256sums_x86_64=('2adef3ff36423de681279a7f8ddaac29612779bdbcba9cf24098952646fa0253')

package() {
  # Extract the debian package
  echo "Extracting debian package"
  ar vx $srcdir/${pkgname}_${pkgver}_${pkgrel}.deb
  mkdir $srcdir/data
  mkdir $srcdir/control
  tar xf "data.tar.xz" -C "${srcdir}/data"
  tar xf "control.tar.gz" -C "${srcdir}/control"
  
  # Create systemd service
  echo "Creating systemd service"
  mkdir -p $srcdir/data/etc/systemd/system
  echo "
  [Unit]
  Description=Windscribe VPN CLI Service
  After=syslog.target network.target remote-fs.target nss-lookup.target

  [Service]
  Type=simple
  ExecStart=/usr/bin/windscribe start
  ExecStop=/usr/bin/windscribe stop
  Restart=on-failure
  KillMode=control-group
  SuccessExitStatus=SIGKILL
  PIDFile=/etc/windscribe/windscribe.pid

  [Install]
  WantedBy=multi-user.target
  " >> $srcdir/data/etc/systemd/system/windscribe.service
  
  # Configure bash completion
  echo "Configuring bash completion"
  mkdir $pkgdir/etc
  cp -r "${srcdir}/data/etc/bash_completion.d" "${pkgdir}/etc/"
  # Make windscribe directory
  echo "Creating windscribe directory"
  mkdir $pkgdir/etc/windscribe
  # Configure systemd service
  echo "Configuring systemd service"
  mkdir -p $pkgdir/etc/systemd/system/
  cp "${srcdir}/data/etc/systemd/system/windscribe.service" "${pkgdir}/etc/systemd/system/"
  chmod 0664 "${pkgdir}/etc/systemd/system/windscribe.service"
  # Configure windscribe binary and docs
  echo "Configuring binary and docs"
  mkdir -p $pkgdir/usr/bin
  cp -r "${srcdir}/data/usr/" "${pkgdir}/"
  chmod 0755 "${pkgdir}/usr/bin/windscribe"
  chmod 0755 -R "${pkgdir}/usr/share/doc/windscribe-cli" 
}
