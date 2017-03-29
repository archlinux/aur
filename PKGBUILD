# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=okimfpsdrv
pkgver=1.6.0
_pkgver=1.6-0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Scanner drivers OKI multifunctional printers"
url="http://www.oki.co.uk/support/printer/printer-drivers"
license=('custom')
backup=('usr/lib/okimfpdrv/device.conf')
depends=('libusb' 'python2')
optdepends=('netpbm: support for additional output formats')
# The driver may need to be be downloaded manually from:
#   http://www.oki.co.uk/support/printer/printer-drivers/ 
#
# 1. select the printer
# 2. select Linux drivers and Utilities
# 3. download either "Scanner Driver (Red Hat i386)" or "Scanner Driver (Red Hat x86_64)"
source=("okiscand.service")
source_i686=("http://www.oki.com/uk/printing/download/okimfpsdrv-${_pkgver}.i386_90706.rpm")
source_x86_64=("http://www.oki.com/uk/printing/download/okimfpsdrv-${_pkgver}.x86_64_90711.rpm")
md5sums=('0164a329e93405806dcf20700b01008d')
md5sums_i686=('53c3a9fa6c7a99cead94b084dc46309c')
md5sums_x86_64=('edd807f035911b7bbad097f57cac2f5e')

package() {
  bsdtar -x -f "$srcdir"/*.rpm -C "$pkgdir"

  # fix for the Arch linux directory structure
  [ "$CARCH" = "x86_64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/sbin"
  rm -r "$pkgdir/etc/init.d"
  mv "$pkgdir/usr/libexec/"* "$pkgdir/usr/lib"
  rmdir "$pkgdir/usr/libexec"
  ln -s "/usr/lib" "$pkgdir/usr/libexec"

  # install the systemd service file
  install -Dm0644 "$srcdir/okiscand.service" "$pkgdir/usr/lib/systemd/system/okiscand.service"

  # install the license
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  cp -r "$pkgdir/usr/share/doc/okimfpsdrv/"* "$pkgdir/usr/share/licenses/$pkgname"

  # fix python version
  find "$pkgdir" -type f -name "*.py" -exec sed -i 's|^#!.*python$|&2|' '{}' ';'

  # delete old .pyc and .pyo files
  find "$pkgdir" -type f -name "*.pyc" -delete
  find "$pkgdir" -type f -name "*.pyo" -delete
  # compile new .pyc and .pyo files
  sleep 1 # make sure the compiled files have higher timestamp
  python2 -O -m compileall "$pkgdir"

  # touch the config file, so it is tracked by pacman
  touch "$pkgdir/usr/lib/okimfpdrv/device.conf"

  # move the assistant applet desktop file from autostart to applications
  mkdir -p "$pkgdir/usr/share/applications/"
  mv "$pkgdir/etc/xdg/autostart/okimfp-assistant-applet.desktop" "$pkgdir/usr/share/applications/"
  rm -r "$pkgdir/etc/xdg"
}

