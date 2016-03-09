# Maintainer: AwesomeHaircut <jesusbalbastro at gmail com>

pkgname=droidcam
pkgver=6.0
pkgrel=3
_kver="`uname -r | cut -d"." -f1,2`-ARCH"
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('x86_64')
url='http://www.dev47apps.com/'
license=('custom')
depends=( 'bluez-libs' 'gtk2')
makedepends=( 'linux-headers' )
options=('!strip')
optdepends=('v4l-utils: Userspace tools and conversion library for Video 4 Linux'
            'xf86-video-v4l: X.org v4l video driver' )
install="$pkgname.install"

source=("$pkgname.desktop" )

sha1sums=( 'f85b3f34f98908bd1327df0ea0e650dcbdcb07e9')

## as of 2015-11-11 only x64 is available for 6.0
[[ "${CARCH}" = "x86_64" ]] && _arch="x64" && sha1sums+=('0c1d6c7b0298e5ec935aa1a93a80529d8a02c9a9')

source+=("http://files.dev47apps.net/600/droidcam-v4l2-${_arch}.tar.gz")

package() {
  # Install droidcam binary file
  cd $pkgdir
  mkdir -p "$pkgdir"/usr/bin
  install -m755 "$srcdir"/${pkgname} "$pkgdir"/usr/bin/${pkgname}
  install -m755 "$srcdir"/${pkgname}-cli "$pkgdir"/usr/bin/${pkgname}-cli

  # Install the desktop icon and ".desktop" files
  install -dm0755 "${pkgdir}/usr/share/"{applications,pixmaps}
  install -m0644 "${srcdir}/icon2.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  mkdir -p "$pkgdir"/usr/lib/modules-load.d/
  printf "videodev\nv4l2loopback\nv4l2loopback_dc" \
         > "$pkgdir"/usr/lib/modules-load.d/droidcam.conf

  mkdir -p "$pkgdir"/etc/modprobe.d/
  printf "options v4l2loopback_dc width=320 height=240" \
         > "$pkgdir"/etc/modprobe.d/droidcam.conf

  # Install doc
  install -dm0755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m0644 "${srcdir}/README" "${pkgdir}/usr/share/licenses/$pkgname/README"

  # Install modules
  cd $srcdir/v4l2loopback
  sed -i -e "s,vdev->current_norm,//vdev->current_norm,g" "$srcdir"/v4l2loopback/*.c
  make
  _extramodules="extramodules-$(uname -r | cut -f-2 -d'.')-$(uname -r|sed -e 's/.*-//g')"
  MODPATH="${pkgdir}/usr/lib/modules/${_extramodules}/"
  install -Dm644 v4l2loopback-dc.ko "$MODPATH/v4l2loopback_dc.ko"
}
