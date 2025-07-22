# Maintainer: Pablo "3l H4ck3r C0mf0r7/PABLEXWorld" Omar Dantur <pablexworld13@gmail.com>
# Contributor: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
pkgname="kinect-audio-setup-k4w-motorfix"
pkgver=0.5
pkgrel=4
pkgdesc='Tools to download and apply USB Audio Class firmware for Kinect and use it as microphone, patched for Kinect for Windows, updated to use the non-beta Kinect firmware that also enables motor control, for use in libfreenect/OpenNI'
arch=('x86_64' 'i686')
url='https://git.ao2.it/kinect-audio-setup.git'
license=('WTFPL' 'BSD')
depends=('libusb' 'systemd-libs')
makedepends=('make' 'gcc' 'msitools' 'cabextract')
provides=('kinect-audio-setup')
conflicts=('kinect-audio-setup')
_pkg='kinect-audio-setup'

source=("git+${url}#tag=v${pkgver}"
        'https://download.microsoft.com/download/E/C/5/EC50686B-82F4-4DBF-A922-980183B214E6/KinectRuntime-v1.8-Setup.exe'
        'Kinect-for-Windows.patch'
        'LICENSE')
sha256sums=('SKIP'
            'f4d4143fb0f0a8d276889c077bfc8af42bfe99c128cadab5e316bf015a9858e9'
            'b5eaedb8190480a2905a6fde13529eb4c03e15724d271d6d023d55ccf6c0e1c7'
            'd23efd383bc03aa8cdeac33be24a9c915f05ad92d20f4070e7160bdcff7f4a8c')

UPLOADER_PATH='/usr/bin/kinect_upload_fw'
FIRMWARE_PATH='/usr/lib/firmware/kinect_uac_firmware.bin'

prepare() {
  msg2 "$(gettext "Applying Kinect for Windows patch...")"
  patch -d kinect-audio-setup -p1 < Kinect-for-Windows.patch
  msg2 "$(gettext "Extracting the firmware out of Kinect Runtime...")"
  dd bs=1 skip=622624 count=115650048 if=KinectRuntime-v1.8-Setup.exe of=AttachedContainer.cab status=progress
  cabextract -F a2 AttachedContainer.cab
  msiextract a2
  msg2 "$(gettext "Generating the udev rules file...")"
  cp "${srcdir}/${_pkg}/contrib/55-kinect_audio.rules.in" "${srcdir}/55-kinect-audio.rules"
  "${srcdir}/${_pkg}/kinect_patch_udev_rules" "$FIRMWARE_PATH" "$UPLOADER_PATH" "${srcdir}/55-kinect-audio.rules"
}

build() {
  cd "${_pkg}/kinect_upload_fw"
  make kinect_upload_fw
}

package() {
  FW_FILE="${srcdir}/Program Files/Microsoft Kinect Drivers/Service/UAC.bin"
  install -Dm644 "$FW_FILE" "${pkgdir}${FIRMWARE_PATH}"
  install -Dm755 "${srcdir}/${_pkg}/kinect_upload_fw/kinect_upload_fw" "${pkgdir}${UPLOADER_PATH}"
  install -Dm644 "${srcdir}/55-kinect-audio.rules" "${pkgdir}/usr/lib/udev/rules.d/55-kinect-audio.rules"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkg}/LICENSE"
}
