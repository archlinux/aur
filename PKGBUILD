##########################################################################
# Maintainer:   Harsha Kuchampudi <harshakuchampudi AT gmail DOT com>
# Github:       https://github.com/hkuchampudi/Windscribe
# Updated:      2018-07-19
##########################################################################

pkgname=windscribe-cli
pkgver=1.2
pkgrel=9
pkgdesc="Port of Windscribe's command line interface"
arch=('x86_64' 'armv6h')
url="https://windscribe.com/"
license=('GPL-2+')
depends=('openvpn')
optdepends=('stunnel')
replaces=('windscribe-cli')
install="windscribe-cli.install"
source_armv6h=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}-${pkgrel}_armhf.deb")
source_x86_64=("${pkgname}_${pkgver}_${pkgrel}.deb::https://assets.staticnetcontent.com/desktop/linux/windscribe-cli_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_armv6h=('b1297791abe067410780aca8dcca821fa8a2ea64925c679e3fc50f46eaec2b1c')
sha256sums_x86_64=('d59233c25ab5718f85baab15f65b5d25c8455d7f8ed6596cf2d26845e9925289')

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
