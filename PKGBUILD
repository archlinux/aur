# Maintainer: robertfoster
pkgname=onair-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.8 # renovate: datasource=github-releases depName=adswill/OnAir
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

sha256sums_x86_64=('de61e6f8298ce80cda3d2317c60fbffd0f4ec52a41ff33f941eca4c9ec9229e8')
sha256sums_aarch64=('f33fd95af2fa4bf022fb9a96e295756357b6a0a3416e1af1a26b9886267ea6ac')
