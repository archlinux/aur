# Maintainer: Yann Leretaille <yann@leretaille.com>

pkgname=xerox-phaser-3320
pkgver=4.01.06
pkgrel=1
pkgdesc="CUPS driver for the Xerox Phaser 3320 series. Also supports Phaser 3117, 3140, 3160, 3200, 3250, 3250, 3300, 3435, 3600, 6110, WorkCentre 3210, 3220, 3315, 3325, 3550, 4118, PE120, PE220, FaxCentre 2218"
url="https://www.support.xerox.com/en-us/product/phaser-3320/downloads"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups' 'gettext')
source=("https://www.support.xerox.com/download/121251")
sha256sums=('9b5180af42ab042048969d8412a3e423c50d8fd5e4ec9186cb029802e92454a2')

pkgver () {
  cd "${srcdir}/cdroot/Linux/noarch/at_opt/share"
  echo $(cat VERSION-Printer_LINUX | sed 's/ .*//')
}

prepare () {
  chmod -R u+w "${srcdir}"
}

package() {
    arch_dir="$CARCH"
    if [[ "$CARCH" == "i686" ]]; then
        arch_dir="i386"
    fi

    cd "${srcdir}/cdroot/Linux"
    mkdir "${pkgdir}/usr/"
    cp -a "noarch/at_root/etc" "${pkgdir}/"
    cp -a "${arch_dir}/at_opt/bin" "${pkgdir}/usr/"
    rm "${pkgdir}/usr/bin/gettext"
    if [[ "$CARCH" == "x86_64" ]]; then
        cp -a "${arch_dir}/at_root/usr/lib64" "${pkgdir}/usr/lib"
    else 
        cp -a "${arch_dir}/at_root/usr/lib" "${pkgdir}/usr/lib"
    fi
    cp "${arch_dir}/at_root/opt/smfp-common/lib/libnetsnmp.so.10.0.2" "${pkgdir}/usr/lib/libnetsnmp.so.10"
    mkdir -p ${pkgdir}/usr/share/cups/model
    cp -a noarch/at_opt/share/ppd/* ${pkgdir}/usr/share/cups/model/
}
