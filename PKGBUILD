# Maintainer: robertfoster
pkgname=onair-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.9 # renovate: datasource=github-releases depName=adswill/OnAir
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

sha256sums_x86_64=('3d54a5843afbf6ecf994907d6e6b01f4d78cdc2e820cf2d38ec6f1846ca972f3')
sha256sums_aarch64=('7b09d4b54046d321ccb00a6cf0f356606bb35313509fa644a30f55211966bb3c')
