# Maintainer: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
pkgname='kinect-audio-setup'
pkgver=0.5
pkgrel=4
pkgdesc='Tools to download and apply USB Audio Class firmware for Kinect and use it as microphone'
arch=('x86_64' 'i686')
url='https://git.ao2.it/kinect-audio-setup.git'
license=('WTFPL' 'BSD')
depends=('libusb' 'systemd-libs')
makedepends=('make' 'gcc' 'p7zip>=9.20')

source=("git+${url}#tag=v${pkgver}"
        'http://download.microsoft.com/download/F/9/9/F99791F2-D5BE-478A-B77A-830AD14950C3/KinectSDK-v1.0-beta2-x86.msi'
        'LICENSE')
sha256sums=('SKIP'
            '817764591cff7acc3d678c5bc65dc8724b3d243611c1010dab2c18d0dedd4221'
            'd23efd383bc03aa8cdeac33be24a9c915f05ad92d20f4070e7160bdcff7f4a8c')

UPLOADER_PATH='/usr/bin/kinect_upload_fw'
FIRMWARE_PATH='/usr/lib/firmware/kinect_uac_firmware.bin'

prepare() {
  msg2 "$(gettext "Extracting the firmware out of Kinect SDK...")"
  7z e -y -r "KinectSDK-v1.0-beta2-x86.msi" "UACFirmware.*" > /dev/null
  msg2 "$(gettext "Generating the udev rules file...")"
  cp "${srcdir}/${pkgname}/contrib/55-kinect_audio.rules.in" "${srcdir}/55-kinect-audio.rules"
  "${srcdir}/${pkgname}/kinect_patch_udev_rules" "$FIRMWARE_PATH" "$UPLOADER_PATH" "${srcdir}/55-kinect-audio.rules"
}

build() {
  cd "${pkgname}/kinect_upload_fw"
  make kinect_upload_fw
}

package() {
  FW_FILE=$(ls "${srcdir}"/UACFirmware.* | cut -d ' ' -f 1)
  install -Dm644 "$FW_FILE" "${pkgdir}${FIRMWARE_PATH}"
  install -Dm755 "${srcdir}/${pkgname}/kinect_upload_fw/kinect_upload_fw" "${pkgdir}${UPLOADER_PATH}"
  install -Dm644 "${srcdir}/55-kinect-audio.rules" "${pkgdir}/usr/lib/udev/rules.d/55-kinect-audio.rules"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
