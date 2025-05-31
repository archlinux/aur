# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: CodeXYZ <jesusbalbastro@gmail.com>
# Contributor: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <me@levitati.ng>
# Contributor: James An <james@jamesan.ca>
# Contributor: iliya guterman <amfernusus@gmail.com>

pkgbase=droidcam-git
pkgname=(droidcam-git v4l2loopback-dc-dkms-git)
_pkgbase=${pkgbase%-*}
_gitname=droidcam-linux-client
pkgver=v2.1.3.r4.g1d09ede
pkgrel=1
pkgdesc="A tool to turn your phone/tablet into a wireless/usb webcam"
arch=('x86_64')
url="https://github.com/amfern/droidcam-linux-client"
license=('GPL-2.0-or-later')
makedepends=('alsa-lib' 'ffmpeg' 'gtk3' 'libappindicator-gtk3' 'libjpeg-turbo' 'libusbmuxd' 'speex' 'git')
optdepends=('android-tools: for Android USB connection'
            'usbmuxd: for iOS USB connection')
source=("git+${url}.git#branch=rename-to-timer_delete_sync"
        "dkms.conf"
        "${_pkgbase}.conf")
sha256sums=('SKIP'
            '930bd848f8feb1898ab89aeba8cec99e4fdf37f79612b9a8d43f45673ff4e3e9'
            '1d4b3ff98b4af9de77a24d1b6fad6e004deadf1f157eb800aa878ba1e7693dac')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Generate the module loading configuration files
  echo "options v4l2loopback_dc width=640 height=480" >| "${pkgbase}.modprobe.conf"

  sed "s/@PKGVER@/${pkgver}/" -i dkms.conf

  cd "${_gitname}"
  sed 's|/opt/droidcam-icon.png|/usr/share/pixmaps/droidcam.png|' -i src/droidcam.c
  sed -e 's|/usr/local/bin/||' -e 's|/opt/droidcam-icon.png|droidcam|' -i droidcam.desktop
}

build() {
  cd "${_gitname}"

  # All JPEG* parameters are needed to use shared version of libturbojpeg instead of
  # static one.
  #
  # Also libusbmuxd requires an override while linking.
  make JPEG_DIR='/usr/lib' JPEG_INCLUDE='/usr/include' USBMUXD='-lusbmuxd-2.0'
}

package_droidcam-git() {
  depends=('alsa-lib' 'ffmpeg' 'glib2' 'glibc' 'gtk3' 'libappindicator-gtk3' 'libjpeg-turbo' 'libusbmuxd' 'libx11' 'pango' 'speex' 'V4L2LOOPBACK-MODULE')
  conflicts=('droidcam')
  provides=('droidcam')

  cd "${_gitname}"
  # Install droidcam program fpiles
  install -Dm755 "${_pkgbase}" "${_pkgbase}-cli" -t "${pkgdir}/usr/bin"
  install -Dm644 icon2.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${_pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/${_pkgbase}.conf" -t "${pkgdir}/etc/modules-load.d"
}

package_v4l2loopback-dc-dkms-git() {
  pkgdesc='v4l2-loopback kernel module - DroidCam version'
  arch=('any')
  depends=('dkms')
  provides=('V4L2LOOPBACK-MODULE')
  conflicts=('V4L2LOOPBACK-MODULE')
  backup=("etc/modprobe.d/${pkgbase}.conf")

  _pkgname='v4l2loopback-dc'

  # Install module loading configuration
  install -Dm644 "${pkgbase}.modprobe.conf" "${pkgdir}/etc/modprobe.d/${pkgbase}.conf"

  # Install module source
  cd "${_gitname}/v4l2loopback"
  install -Dm644 Makefile test.c v4l2loopback-dc.c "${srcdir}/dkms.conf" -t "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
}
