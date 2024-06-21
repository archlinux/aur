# Maintainer: Jérémie BELLION-JOURDAN <jeremie at jbellion dot fr>
# Based on aur build of brother-mfc-4340dw
#
_model=dcpj1050dw
_device_name=MFC-J1010DW
pkgname=brother-dcp-j1050dw
pkgver=3.5.0
pkgrel=1
pkgdesc="LPR driver and CUPS wrapper for Brother ${_device_name}"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=fr&lang=fr&prod=dcpj1050dw_eu_as"
license=("EULA")
source=("https://download.brother.com/welcome/dlf105351/dcpj1050dwpdrv-3.5.0-1.i386.rpm")
sha256sums=('a2f3ec8ab53186d7476b4487f0c719e4e04b225d238526fd7c7f2f0b139c5d55')
depends=('perl' 'cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan5' 'brscan-skey')
install="$pkgname.install"

package() {
  # unfortunately, /opt is hard-coded into driver binaries and cannot be replaced
  SRC_PREFIX=/opt
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


