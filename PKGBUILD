# Maintainer: robertfoster
pkgname=onair-bin
_pkgname="${pkgname%-bin}"
pkgver=4.0.0 # renovate: datasource=github-releases depName=adswill/OnAir
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

sha256sums_x86_64=('8b699afd1199b298967c3aa5283e87301c8700a5920049265dc706413b4376a8')
sha256sums_aarch64=('b5e1d08850e42918441479531706ad99a9d5d80601ffc8c5d488dd4ec935a2fc')
