# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-dtapiservice-bin
pkgver=5.2.6.135
pkgrel=1
_sdkver=2025.12.0
pkgdesc="DTAPI daemon that manages a range of DekTec demodulator boards"
arch=('x86_64')
url="https://www.dektec.com/downloads/SDK/#linux"
license=('LicenseRef-custom')
depends=('gcc-libs' 'glibc' 'dektec-drivers-dkms')
options=('!strip')
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz")
sha256sums=('8173c420ec3c707164143588fd3e5c3ef98501a2c46e23a06440db8bb3059975')

prepare() {
  cd "${srcdir}/LinuxSDK/DtapiService"

  # Local variables for the binary file and skip lines
  local binary="DtapiService.bin"
  local skip=$(awk '/^__START_OF_TARFILE__/ { print NR + 1; exit 0; }' "${binary}")
  
  # Untar all files included in the DtapiService.bin file
  tail -n +${skip} "${binary}" | bsdtar -xzv

  # Replace '/usr/sbin' with '/usr/bin' in the service file
  sed -i "s|ExecStart=/usr/sbin/DtapiServiced|ExecStart=/usr/bin/DtapiServiced|" DtapiServiced.service

  # Copy the 64-bit service binary to a generic name
  cp "${srcdir}/LinuxSDK/DtapiService/DtapiService64" "${srcdir}/LinuxSDK/DtapiService/DtapiServiced"
}

package() {
  install -Dm755 "${srcdir}/LinuxSDK/DtapiService/DtapiServiced" "${pkgdir}/usr/bin/DtapiServiced"
  install -Dm644 "${srcdir}/LinuxSDK/DtapiService/DtapiServiced.service" "${pkgdir}/usr/lib/systemd/system/DtapiServiced.service"
  install -Dm644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
