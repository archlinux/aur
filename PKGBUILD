# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=okimfpsdrv
pkgver=1.5.0
_pkgver=1.5-0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Scanner drivers OKI multifunctional printers"
url="http://www.oki.co.uk/support/printer/printer-drivers"
license=('custom')
depends=('libusb' 'python2')
# http://www.oki.co.uk/support/printer/printer-drivers/
source=("okiscand.service")
source_i686=("${pkgname}-${_pkgver}-i686.zip::http://www.oki.co.uk/Includes/Pages/FileDownload.aspx?id=tcm:122-156523")
source_x86_64=("${pkgname}-${_pkgver}-x86_64.zip::http://www.oki.co.uk/Includes/Pages/FileDownload.aspx?id=tcm:122-156524")
md5sums=('d76afbb748d6daf989520c14876e3767')
md5sums_i686=('090fed6956f8647a6eb099d6f22bddab')
md5sums_x86_64=('3d8b6d8ff7a52e7e83429406856216bc')

if [ "$CARCH" = "x86_64" ];  then
  _package="$pkgname-${_pkgver}.x86_64.rpm"
else
   _package="$pkgname-${_pkgver}.i386.rpm"
fi

package() {
  bsdtar -x -f "$srcdir/${_package}/${_package}" -C "$pkgdir"

  # fix for the Arch linux directory structure
  [ "$CARCH" = "x86_64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/sbin"
  rm -r "$pkgdir/etc/init.d"
  mv "$pkgdir/usr/libexec/"* "$pkgdir/usr/lib"
  rmdir "$pkgdir/usr/libexec"
  ln -s "$pkgdir/usr/lib" "$pkgdir/usr/libexec"

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
}

