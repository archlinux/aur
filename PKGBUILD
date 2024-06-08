# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/

_product=gt-s650
pkgname=iscan-plugin-${_product}
pkgver=2.30.4
_pkg_plug_ver=1.1.1-1
_scan_ver=6.7.65.0
_scan_plug_ver=1.0.0.6-1
pkgrel=3
pkgdesc="EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET, EW, L, LX, PX, WF, XP Series, FF-640, GT-S650, Perfection V19, Perfection V39)"
arch=('x86_64' 'i686')
case "$CARCH" in
  x86_64)
    _arch_a="x64"
    _arch_b="amd64"
    ;;
  i686)
    _arch_a="x86"
    _arch_b="i386"
    ;;
  *)
    echo "Unsupported architecture: $CARCH" >&2
    exit 1
    ;;
esac
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('iscan' 'iscan-data')
source=("${pkgname}.install")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/${_product}/deb/x64/iscan-${_product}-bundle-${pkgver}.x64.deb.tar.gz"
               "https://download3.ebz.epson.net/dsc/f/03/00/15/87/26/2525daf2881161ddb0957e22601734bfedab5152/epsonscan2-bundle-${_scan_ver}.x86_64.deb.tar.gz")
source_i686=("https://download2.ebz.epson.net/iscan/plugin/${_product}/deb/x86/iscan-${_product}-bundle-${pkgver}.x86.deb.tar.gz"
             "https://download3.ebz.epson.net/dsc/f/03/00/15/87/27/a2f4b9c48258de4e0c8082509a94060aa0ce7c61/epsonscan2-bundle-${_scan_ver}.i686.deb.tar.gz")
sha256sums=('b2b50e633cdf060ef475ca80c456be7863272db31e056bdc303f9e38b6aac8ba')
sha256sums_x86_64=('553eb55fef42ebcae562f3b8442d43093a16d8b53893da3b0d25396e81377949'
                   '66fe6bd9189dc67cd3d61c852eacc01ecaa1de59cc029d948d2199b38dca932d')
sha256sums_i686=('657cd8d8e0e5dfcb305dde65c99d5fc085ad3eb5a889b048ef81bf99afa27d05'
                 '626baea9833265bc7c8e60ee08f94372ea81cb2b627239a4712a0411068241e2')
install="${pkgname}.install"

prepare() {
  # Prepare the plugin
  cd "${srcdir}/iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins"
  bsdtar -xf "${pkgname}_${_pkg_plug_ver}_${_arch_b}.deb"
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/${pkgname}/NEWS.gz"
  gzip -fkd "usr/share/doc/${pkgname}/COPYING.EPSON.en.txt.gz"
  # Prepare the firmware
  cd "${srcdir}/epsonscan2-bundle-${_scan_ver}.${CARCH}.deb/plugins"
  bsdtar -xf "epsonscan2-non-free-plugin_${_scan_plug_ver}_${_arch_b}.deb"
  bsdtar -xf data.tar.xz
}

package() {
  cd "${srcdir}/iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins/usr"
  # Install the plugin
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/iscan/libiscan-plugin-${_product}.so.0.0.0"
  ln -s "libiscan-plugin-${_product}.so.0.0.0" "${pkgdir}/usr/lib/iscan/libiscan-plugin-${_product}.so"
  ln -s "libiscan-plugin-${_product}.so.0.0.0" "${pkgdir}/usr/lib/iscan/libiscan-plugin-${_product}.so.0"
  # Install the firmware
  # install -m 755 -d "${pkgdir}/usr/share/iscan"
  # install -m 644 -t "${pkgdir}/usr/share/iscan" "share/iscan/esfw010c.bin"
  # Install shared data
  install -m 755 -d "${pkgdir}/usr/share/iscan-data/device"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "share/iscan-data/device/50657266656374696f6e20563139.xml"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "share/iscan-data/device/50657266656374696f6e20563339.xml"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "share/doc/${pkgname}/NEWS"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "share/doc/${pkgname}/COPYING.EPSON.en.txt" \
    "share/doc/${pkgname}/copyright"
  # Install proper firmware
  cd "${srcdir}/epsonscan2-bundle-${_scan_ver}.${CARCH}.deb/plugins/usr"
  install -m 755 -d "${pkgdir}/usr/share/iscan"
  install -m 644 -t "${pkgdir}/usr/share/iscan" "share/epsonscan2/esfw010c.bin"
}
