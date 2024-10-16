# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/

_product="gt-s650"
pkgname="iscan-plugin-${_product}"
pkgver=2.30.4
_pkg_plug_ver=1.1.1-1
_scan_ver=6.7.65.0
_scan_plug_ver=1.0.0.6-1
pkgrel=4
pkgdesc="EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET, EW, L, LX, PX, WF, XP Series, FF-640, GT-S650, Perfection V19, Perfection V39)"
arch=('x86_64' 'i686')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('gcc-libs' 'glibc' 'iscan' 'iscan-data')
makedepends=('gzip')
_pkgsrc="${pkgname}-${pkgver}"
_epson2_src="epsonscan2-${_scan_ver}"
noextract=("${_pkgsrc}-"{x86_64,i686}".tar.gz"
           "${_epson2_src}-"{x86_64,i686}".tar.gz")
source=("${pkgname}.install")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::https://download2.ebz.epson.net/iscan/plugin/${_product}/deb/x64/iscan-${_product}-bundle-${pkgver}.x64.deb.tar.gz"
               "${_epson2_src}-x86_64.tar.gz::https://download3.ebz.epson.net/dsc/f/03/00/15/87/26/2525daf2881161ddb0957e22601734bfedab5152/epsonscan2-bundle-${_scan_ver}.x86_64.deb.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::https://download2.ebz.epson.net/iscan/plugin/${_product}/deb/x86/iscan-${_product}-bundle-${pkgver}.x86.deb.tar.gz"
             "${_epson2_src}-i686.tar.gz::https://download3.ebz.epson.net/dsc/f/03/00/15/87/27/a2f4b9c48258de4e0c8082509a94060aa0ce7c61/epsonscan2-bundle-${_scan_ver}.i686.deb.tar.gz")
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
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}" "${_epson2_src}-${CARCH}"

  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" --strip-components 2 \
    "iscan-${_product}-bundle-${pkgver}.${_arch_a}.deb/plugins/${pkgname}_${_pkg_plug_ver}_${_arch_b}.deb"
  bsdtar -xf "${pkgname}_${_pkg_plug_ver}_${_arch_b}.deb" "data.tar."*
  bsdtar -xzf "data.tar."* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f "${pkgname}_${_pkg_plug_ver}_${_arch_b}.deb" "data.tar."*

  bsdtar -xzf "${_epson2_src}-${CARCH}.tar.gz" --strip-components 2 \
    "epsonscan2-bundle-${_scan_ver}.${CARCH}.deb/plugins/epsonscan2-non-free-plugin_${_scan_plug_ver}_${_arch_b}.deb"
  bsdtar -xf "epsonscan2-non-free-plugin_${_scan_plug_ver}_${_arch_b}.deb" "data.tar."*
  bsdtar -xzf "data.tar."* --strip-components 1 -C "${srcdir}/${_epson2_src}-${CARCH}"
  rm -f "epsonscan2-non-free-plugin_${_scan_plug_ver}_${_arch_b}.deb" "data.tar."*

  find "${_pkgsrc}-${CARCH}" "${_epson2_src}-${CARCH}" -name '*.gz' -exec \
    gzip -fd {} \;
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share"
  rm -f "doc/${pkgname}/"{copyright,*Debian}

  mkdir -p "licenses/${pkgname}"
  mv -f "doc/${pkgname}/COPYING"* "licenses/${pkgname}"

  cd "iscan"
  find . -type f -name "*.bin" -exec \
    install -Dm644 "${srcdir}/${_epson2_src}-${CARCH}/usr/share/epsonscan2/{}" . \;
}

package() {
  cd "${srcdir}"
  cp -r "${_pkgsrc}-${CARCH}"/* "${pkgdir}"
  find "${pkgdir}" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}" -type d -exec chmod 755 "{}" \;
}
