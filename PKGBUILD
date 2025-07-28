# Maintainer: Raphael Trück <rtrueck at magenta dot de>
# Adapted from pfufs.git
# Credits to Alexander Kobel <a-kobel@a-kobel.de>

pkgname=pfusp-bin
pkgver=2.2.2
pkgvernodots=222
pkgrel=3
pkgdesc='Fujitsu SP series Image Scanner Driver for SANE'
url='http://imagescanner.fujitsu.com/global/dl/'
arch=('x86_64')
license=('custom')
depends=('sane' 'libxml2-legacy')

source=("https://origin.pfultd.com/downloads/IMAGE/driver/ubuntu/${pkgvernodots}/pfusp-ubuntu_${pkgver}_amd64.deb"        
        pfusp.pdf::"http://origin.pfultd.com/downloads/IMAGE/driver/ubuntu/221/P2U3-0210-04ENZ0.pdf"
        60-pfusp.rules
        pfusp
        pfusp.conf        
        pfuspscanbutton.service
        simple-scan.conf
        consumablessettings.xml)
sha256sums=('0c87c7e005d01ec3740818970538828f48eef0d445cc43eb64a95039cbd9869c'
            'a0b76dfae6f8e7bb9f5aaab8469e883187a1d6d812bfab42fe3158ba91c297d1'
            '1a385519132a6a6935956d6dc150e75dcba1bdfd8b4137547aa9f5c1bf2bada0'            
            'df13d759a010d83058e934c86c86cd5491c3f4ff9a46f79aae07822b2bb37a4a'
            '3e3d083b2e9bc3eaf6a16f29a6d901765ff9613265a6fae7ad2674092321b478'            
            'cfc777703f7df2f43e749852e9f658bbeb78c1a5a14fd9e8d0ae711cae43632f'
            '5bdb32b26949be8934756427e62f3694999151229fbedd90fcd9353d61d75113'
            '6b1ba6fbfbd5759f218c2c158aef2cc09718edf50d7ecea9e58064eeb2197b07')

prepare () {
  cd "$srcdir"
  tar xf data.tar.xz

  find . -type f -exec chmod 644 '{}' +
  find . -type f -name 'License*' -exec chmod 444 '{}' +
  find . -type f -name 'readme*' -exec chmod 444 '{}' +
  cd opt/pfusp
  chmod 755 bin/* consumables/* etc/pfuspsysinfo.sh lib/* pfuspgetinfo/*
}

package () {
  cd "$srcdir"

  install -d "$pkgdir/opt/pfusp/image"

  cp -pR usr/ "$pkgdir/"
  cp -pR opt/pfusp/*/ "$pkgdir/opt/pfusp/"

  install -vDm 444 -t "$pkgdir/usr/share/doc/$pkgname" pfusp.pdf opt/pfusp/readme*.txt
  install -vDm 444 -t "$pkgdir/usr/share/licenses/$pkgname" opt/pfusp/License*.txt

  # from the deb's preinst
  install -vDm 644 -t "$pkgdir/usr/lib/udev/rules.d" 60-pfusp.rules

  install -vDm 644 -t "$pkgdir/usr/lib/systemd/system" pfuspscanbutton.service

  # from the deb's postinst
  install -vDm 644 -t "$pkgdir/etc/sane.d/dll.d" pfusp
  install -vDm 644 -t "$pkgdir/opt/pfusp/etc" pfusp.conf simple-scan.conf consumablessettings.xml
  

  install -d "$pkgdir/usr/bin"
  ln -s -t "$pkgdir/usr/bin" /opt/pfusp/consumables/pfuspconsumables
  ln -s -t "$pkgdir/usr/bin" /opt/pfusp/bin/pfuspscanmanager
  

  mv "$pkgdir/opt/pfusp/etc" "$pkgdir/etc/pfusp"
  ln -s /etc/pfusp "$pkgdir/opt/pfusp/etc"
}
