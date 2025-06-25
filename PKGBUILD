# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: CodeXYZ <jesusbalbastro@gmail.com>
# Contributor: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <me@levitati.ng>
# Contributor: James An <james@jamesan.ca>

pkgbase=droidcam
pkgname=(droidcam v4l2loopback-dc-dkms)
_name=droidcam-linux-client
pkgver=2.1.4
pkgrel=1
epoch=1
pkgdesc="A tool to turn your phone/tablet into a wireless/usb webcam"
arch=('x86_64')
url="https://github.com/dev47apps/droidcam-linux-client"
license=('GPL-2.0-or-later')
makedepends=('alsa-lib' 'ffmpeg' 'gtk3' 'libappindicator-gtk3' 'libjpeg-turbo' 'libusbmuxd' 'speex')
optdepends=('android-tools: for Android USB connection'
            'usbmuxd: for iOS USB connection')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "dkms.conf"
        "${pkgbase}.conf")
sha256sums=('785c2d760b410b90b78a4f9604656e462a5c2eb9c1a351c61237dd57c36c0a4a'
            '20de9d14877732f2f75c21bdd4c335c71dcaeccab4ce348c6c0a210f622ceed2'
            '1d4b3ff98b4af9de77a24d1b6fad6e004deadf1f157eb800aa878ba1e7693dac')

prepare() {
  # Generate the module loading configuration files
  echo "options v4l2loopback_dc width=640 height=480" >| "${pkgbase}.modprobe.conf"

  sed "s/@PKGVER@/${pkgver}/" -i dkms.conf

  cd "${_name}-${pkgver}"
  sed 's|/opt/droidcam-icon.png|/usr/share/pixmaps/droidcam.png|' -i src/droidcam.c
  sed -e 's|/usr/local/bin/||' -e 's|/opt/droidcam-icon.png|droidcam|' -i droidcam.desktop
}

build() {
  cd "${_name}-${pkgver}"

  # All JPEG* parameters are needed to use shared version of libturbojpeg instead of
  # static one.
  #
  # Also libusbmuxd requires an override while linking.
  make JPEG_DIR='/usr/lib' JPEG_INCLUDE='/usr/include' USBMUXD='-lusbmuxd-2.0'
}

package_droidcam() {
  depends=('alsa-lib' 'ffmpeg' 'glib2' 'glibc' 'gtk3' 'libappindicator-gtk3' 'libjpeg-turbo' 'libusbmuxd' 'libx11' 'pango' 'speex' 'V4L2LOOPBACK-MODULE')

  cd "${_name}-${pkgver}"
  # Install droidcam program files
  install -Dm755 "${pkgname}" "${pkgname}-cli" -t "${pkgdir}/usr/bin"
  install -Dm644 icon2.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/${pkgname}.conf" -t "${pkgdir}/etc/modules-load.d"
}

package_v4l2loopback-dc-dkms() {
  pkgdesc='v4l2-loopback kernel module - DroidCam version'
  arch=('any')
  depends=('dkms')
  provides=('V4L2LOOPBACK-MODULE')
  backup=("etc/modprobe.d/${pkgbase}.conf")

  _pkgname='v4l2loopback-dc'

  # Install module loading configuration
  install -Dm644 "${pkgbase}.modprobe.conf" "${pkgdir}/etc/modprobe.d/${pkgbase}.conf"

  # Install module source
  cd "${_name}-${pkgver}/v4l2loopback"
  install -Dm644 Makefile test.c v4l2loopback-dc.c "${srcdir}/dkms.conf" -t "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
}
