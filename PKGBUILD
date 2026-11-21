# Maintainer: robertfoster
pkgname=onair-bin
_pkgname="${pkgname%-bin}"
pkgver=4.4.0 # renovate: datasource=github-releases depName=adswill/OnAir
pkgrel=1
pkgdesc="SDR receiver for digital TV (DVB-T/T2, DVB-S/S2, ATSC), DAB+, FM, DRM, ADS-B, GNSS and DMR"
arch=('x86_64' 'aarch64')
url="https://github.com/adswill/OnAir"
license=('GPL-3.0-only')
depends=('dbus' 'glfw' 'glibc' 'hackrf' 'hicolor-icon-theme' 'libgcc'
  'libstdc++' 'libusb' 'soapysdr' 'zlib')
optdepends=('zenity: file dialogs'
  'soapyrtlsdr: RTL-SDR support through SoapySDR'
  'soapyairspy: Airspy support through SoapySDR')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug' '!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb" "${_pkgname}_${pkgver}_arm64.deb")

prepare() {
  mkdir -p "${srcdir}/deb"
  bsdtar -xOf "${srcdir}/${_pkgname}_${pkgver}"_*.deb 'data.tar.*' |
    bsdtar -xf - -C "${srcdir}/deb"
}

package() {
  cp -a "${srcdir}/deb/usr" "${pkgdir}/"

  # the binaries hardcode RUNPATH and a lookup path to the Debian multiarch
  # directory holding the bundled SDR driver libraries, so keep it as shipped
  rm -r "${pkgdir}/usr/share/doc"
  install -Dm644 "${srcdir}/deb/usr/share/doc/OnAir/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -exec chmod 755 {} +
}

sha256sums_x86_64=('fb695493443ab3e95bf8a6af12afe12eb7531d1d0afa85a6bc7ea5a7b2e52e27')
sha256sums_aarch64=('87fdb2f2b13adb7f07cb62fa7d8ebc03278f7002bf1617cef20fabfaf8b74a1d')
