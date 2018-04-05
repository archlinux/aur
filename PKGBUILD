##########################################################################
# Maintainer:   Harsha Kuchampudi <harshakuchampudi AT gmail DOT com>
# Github:       https://github.com/hkuchampudi/Windscribe
# Updated:      2018-04-04
##########################################################################

pkgname=windscribe-cli
pkgver=1.1
pkgrel=1
pkgdesc="Port of Windscribe's command line interface"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://windscribe.com/"
license=('GPL-2+')
depends=('openvpn')
optdepends=('stunnel')
replaces=('windscribe-cli')
install="windscribe-cli.install"
source_armv6h=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}-${pkgrel}_armhf.deb")
source_armv7h=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}-${pkgrel}_armhf.deb")
source_i686=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}_x86.deb")
source_x86_64=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}_x64.deb")
sha256sums_armv6h=('2fcf951dab5c70877660c49beb2ce35c7f1b1df47c33caa471ea0cd96f58284c')
sha256sums_armv7h=('2fcf951dab5c70877660c49beb2ce35c7f1b1df47c33caa471ea0cd96f58284c')
sha256sums_i686=('049d8cf2231a50e43ed9c68f866219eb9d7604936ac1b9f4fdaeed3dedef4108')
sha256sums_x86_64=('3639313f36bc16a200ce31e2c2d5c3e4f555189d9ab2d8d6acd376ed33dea180')

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
