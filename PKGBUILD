# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/

_product="gt-s650"
pkgname="iscan-plugin-${_product}"
pkgver=2.30.4
_pkg_plug_ver=1.1.1-1
_scan_ver=6.7.65.0
_scan_plug_ver=1.0.0.6-1
pkgrel=3
pkgdesc="EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET, EW, L, LX, PX, WF, XP Series, FF-640, GT-S650, Perfection V19, Perfection V39)"
arch=('x86_64' 'i686')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('glibc' 'gcc-libs' 'iscan' 'iscan-data')
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

case "${CARCH}" in
  x86_64)
    _arch_a="x64"
    _arch_b="amd64"
    ;;
  i686)
    _arch_a="x86"
    _arch_b="i386"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}" >&2
    exit 1
    ;;
esac

prepare() {
  # Prepare the plugin
  cd "${srcdir}/iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins"
  bsdtar -xf "${pkgname}_${_pkg_plug_ver}_${_arch_b}.deb"
  bsdtar -xf "data.tar.gz"

  # Prepare the documentation and licenses
  cd "usr/share/doc/${pkgname}"
  gzip -fkd "NEWS.gz"
  gzip -fkd "COPYING.EPSON.en.txt.gz"
  # gzip -fkd "COPYING.EPSON.ja.txt.gz"

  # Prepare the firmware
  cd "${srcdir}/epsonscan2-bundle-${_scan_ver}.${CARCH}.deb/plugins"
  bsdtar -xf "epsonscan2-non-free-plugin_${_scan_plug_ver}_${_arch_b}.deb"
  bsdtar -xf "data.tar.xz"
}

package() {
  # Install the plugin
  cd "${srcdir}/iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins/usr/lib/iscan"
  install -Dm644 "libiscan-plugin-${_product}.so.0.0.0" "${pkgdir}/usr/lib/iscan/libiscan-plugin-${_product}.so.0.0.0"
  ln -s "libiscan-plugin-${_product}.so.0.0.0"          "${pkgdir}/usr/lib/iscan/libiscan-plugin-${_product}.so.0"
  ln -s "libiscan-plugin-${_product}.so.0.0.0"          "${pkgdir}/usr/lib/iscan/libiscan-plugin-${_product}.so"

  # Install the firmware
  # cd "${srcdir}/iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins/usr/share/iscan"
  # install -Dm644 "esfw010c.bin" "${pkgdir}/usr/share/iscan/esfw010c.bin"

  # Install shared data
  cd "${srcdir}/iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins/usr/share/iscan-data/device"
  install -Dm644 "50657266656374696f6e20563139.xml" "${pkgdir}/usr/share/iscan-data/device/50657266656374696f6e20563139.xml"
  install -Dm644 "50657266656374696f6e20563339.xml" "${pkgdir}/usr/share/iscan-data/device/50657266656374696f6e20563339.xml"

  # Install documentation
  cd "${srcdir}/iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins/usr/share/doc/${pkgname}"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "NEWS"   "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  
  # Install licenses
  cd "${srcdir}/iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins/usr/share/doc/${pkgname}"
  install -Dm644 "copyright"            "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm644 "COPYING.EPSON.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON.en"
  # install -Dm644 "COPYING.EPSON.ja.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON.ja"

  # Install proper firmware
  cd "${srcdir}/epsonscan2-bundle-${_scan_ver}.${CARCH}.deb/plugins/usr/share/epsonscan2"
  install -Dm644 "esfw010c.bin" "${pkgdir}/usr/share/iscan/esfw010c.bin"
}
