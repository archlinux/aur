# Based on brother-mfc-j4335dw, which is:
# Based on brother-mfc-j5845dw and brother-mfc-l2710dw
#
# Corrected according to the RPM postinstall script
# and the driver install script (cupswrapper/cupswrapper${_model})
_model=mfcj4340dw
_device_name=MFC-J4340DW
pkgname=brother-mfc-j4340dw
pkgver=3.5.0
pkgrel=1
pkgdesc="LPR driver and CUPS wrapper for Brother ${_device_name} printer"
arch=("i686" "x86_64")
url="https://www.brother.co.uk/support/mfc-j4340dw/downloads"
license=("EULA")
source=("https://download.brother.com/welcome/dlf105295/${_model}pdrv-${pkgver}-${pkgrel}.i386.rpm")
sha256sums=('8a399d8716bd6117730b69463834ffe702af4a7da504dc8432c30a8b9ba89784')
depends=('perl' 'cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan5')
install="$pkgname.install"

package() {
  SRC_PREFIX=/opt # unfortunately, /opt is hard-coded into driver binaries and cannot be replaced
  PREFIX=/usr/share

  find "$srcdir$SRC_PREFIX/brother" -type d -exec chmod 755 '{}' +
  find "$srcdir$SRC_PREFIX/brother" -type f -exec chmod 644 '{}' +
  find "$srcdir$SRC_PREFIX/brother/Printers/$_model/lpd" -type f -exec chmod +x '{}' +

  mkdir -p "$pkgdir$SRC_PREFIX"
  cp -R "$srcdir$SRC_PREFIX/brother" "$pkgdir$SRC_PREFIX"

  # /etc/printcap is managed by cups
  find "$pkgdir" -type f -name 'setupPrintcap*' -delete

  # symlink for the PPD
  ppd_file_name="$SRC_PREFIX/brother/Printers/$_model/cupswrapper/brother_${_model}_printer_en.ppd"
  install -d "$pkgdir$PREFIX/cups/model/Brother"
  ln -s "$ppd_file_name" "$pkgdir$PREFIX/cups/model/Brother/"
  #install -d "$pkgdir$PREFIX/ppd/Brother"
  #ln -s "$ppd_file_name" "$pkgdir$PREFIX/ppd/Brother/"
  #install -d "$pkgdir$PREFIX/ppd/cupsfilters"
  #ln -s "$ppd_file_name" "$pkgdir$PREFIX/ppd/cupsfilters/"

  ldpwrapper="$SRC_PREFIX/brother/Printers/$_model/cupswrapper/brother_lpdwrapper_${_model}"
  chmod +x "$pkgdir$ldpwrapper"
  mkdir -p "$pkgdir/usr/lib/cups/filter/"
  ln -s "$ldpwrapper" "${pkgdir}/usr/lib/cups/filter/"

  # a couple architecture-specific symlinks
  ln -s "$SRC_PREFIX/brother/Printers/$_model/lpd/$CARCH/br${_model}filter" "$pkgdir$SRC_PREFIX/brother/Printers/$_model/lpd/"
  ln -s "$SRC_PREFIX/brother/Printers/$_model/lpd/$CARCH/brprintconf_${_model}" "$pkgdir$SRC_PREFIX/brother/Printers/$_model/lpd/"

  install -d "$pkgdir/usr/bin"
  ln -s "$SRC_PREFIX/brother/Printers/$_model/lpd/brprintconf_${_model}" "$pkgdir/usr/bin/"
}
