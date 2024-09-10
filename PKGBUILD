# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=dektec-dtapiservice-bin
pkgver=5.1.2.121
pkgrel=4
_sdkver=2024.06.1
pkgdesc="The DTAPI service is a Linux daemon (service) that manages DekTec's range of demodulator boards."
arch=('i686' 'x86_64')
url="https://www.dektec.com/downloads/SDK/#linux"
license=('LicenseRef-custom')
depends=('gcc-libs' 'glibc' 'dektec-drivers-dkms')
makedepends=()
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz")
sha256sums=('903772f0ef251dad1871e6110bd17409dab502ad7c1e49dfcf2882df3f082d98')

prepare() {
  cd LinuxSDK/DtapiService
  # Untar all files included in the DtapiService.bin file
  _binary="DtapiService.bin"
  _skip=$(awk '/^__START_OF_TARFILE__/ { print NR + 1; exit 0; }' ${_binary})
  tail -n +${_skip} ${_binary} | bsdtar -xzv
  # Replace '/usr/sbin' with '/usr/bin'
  sed -i "s|ExecStart=/usr/sbin/DtapiServiced|ExecStart=/usr/bin/DtapiServiced|" DtapiServiced.service
}

package() {
  # 32-bit systems
  _op_mode=$(getconf LONG_BIT)
  if [ ${_op_mode} == '32' ]; then
    cp "${srcdir}/LinuxSDK/DtapiService/DtapiService32" "${srcdir}/LinuxSDK/DtapiService/DtapiServiced"
  fi
  # 64-bit systems
  if [ ${_op_mode} == '64' ]; then
    cp "${srcdir}/LinuxSDK/DtapiService/DtapiService64" "${srcdir}/LinuxSDK/DtapiService/DtapiServiced"
  fi

  install -Dm755 "${srcdir}/LinuxSDK/DtapiService/DtapiServiced" "${pkgdir}/usr/bin/DtapiServiced"
  install -Dm644 "${srcdir}/LinuxSDK/DtapiService/DtapiServiced.service" "${pkgdir}/usr/lib/systemd/system/DtapiServiced.service"
  install -Dm644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
