# Maintainer: Harsha Kuchampudi <harshakuchampudi@gmail.com>
pkgname=windscribe-cli
pkgver=1.0
pkgrel=2
pkgdesc="Port of Windscribe's VPN command line interface"
arch=('any')
url="https://windscribe.com/"
license=('GPL-2+')
depends=('openvpn')
replaces=('windscribe-cli')
install="windscribe-cli.install"
source=("$pkgname_$pkgver_all.deb::https://windscribe.com/install/desktop/linux_deb")
sha256sums=('9b173b1548c04524861839ff6c2e49a2a0e6143e7438cf5f5a784301010d15d1')

package() {
  # Extract the debian package
  echo "Extracting debian package"
  ar vx $srcdir/$pkgname_$pkgver_all.deb
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
  Restart=on-failure
  PIDFile=/etc/windscribe/windscribe.pid

  [Install]
  WantedBy=multi-user.target
  " >> $srcdir/data/etc/systemd/system/windscribe.service
  
  # Configure bash completion
  echo "Configuring bash completion"
  mkdir $pkgdir/etc
  cp -r "${srcdir}/data/etc/bash_completion.d" "${pkgdir}/etc/"
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