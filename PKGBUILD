# Contributor: Christopher Reimer <mail[at]creimer[dot]net>
pkgname=sundtek
pkgver=150728.175535
pkgrel=1
pkgdesc='Driver for Sundtek MediaTV Pro'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.sundtek.com'
license=('custom')
install="$pkgname.install"
optdepends=('lib32-gcc-libs: FM Radio' 'libpulse: FM Radio')
source=('sundtek.rules'
        'sundtek.service'
        'sundtek-restart.service')
source_x86_64=('installer_64bit.tar.gz::http://sundtek.de/media/netinst/64bit/installer.tar.gz?ARCH')
source_i686=('installer_32bit.tar.gz::http://sundtek.de/media/netinst/32bit/installer.tar.gz?ARCH')
source_armv6h=('installer_armsysvhf.tar.gz::http://sundtek.de/media/netinst/armsysvhf/installer.tar.gz?ARCH')
sha256sums=('25d285416ca8b050fdd6fb21b70d448500e402767f87ce19a85520eb005da589'
            'c8c928d5ff8f1ee48ab2eb5c287c172e33c15b4a7d7ec7a0f993e701351c3f9d'
            '5192c1283b2c117188d265d29f360ff99baeb87bfb703961f9d6d6e692c800db')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
md5sums_armv6h=('SKIP')

pkgver() {
  cd "$srcdir/opt/bin"

  # fix broken access rights
  chmod +r -R *

  _date=$(./mediasrv --build 2>&1 | cut -d' ' -f3 | cut -b3- | tr -d -)
  _time=$(./mediasrv --build 2>&1 | cut -d' ' -f4 | tr -d :)
  echo -n $_date.$_time
}

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/opt/lib"
  cp -pr opt/bin "$pkgdir/opt/"
  cp -pr opt/lib/*.so "$pkgdir/opt/lib/"
  
  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  cp etc/udev/rules.d/* "$pkgdir/usr/lib/udev/rules.d"
  install -D "sundtek.rules" "$pkgdir/etc/udev/rules.d/sundtek.rules"
  install -D "sundtek.service" "$pkgdir/usr/lib/systemd/system/sundtek.service"
  install -D "sundtek-restart.service" "$pkgdir/usr/lib/systemd/system/sundtek-restart.service"
  install -D "opt/doc/README" "$pkgdir/usr/share/licenses/sundtek/README"
}
