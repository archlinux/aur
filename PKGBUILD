# Maintainer: petRUShka <petrushkin at yandex ru>

pkgname=droidcam5
pkgver=5
pkgrel=1
_kver="`uname -r | cut -d"." -f1,2`-ARCH"
pkgdesc='A tool for using your android device as a wireless/usb webcam. Version compatible with Android 4.0.3/4.0.4 phones.'
arch=('i686' 'x86_64')
url='http://www.dev47apps.com/'
license=('custom')
depends=( 'bluez-libs' 'gtk2')
makedepends=( 'linux-headers' )
options=('!strip')
optdepends=('v4l-utils: Userspace tools and conversion library for Video 4 Linux'
            'xf86-video-v4l: X.org v4l video driver' )
install="$pkgname.install"

source=("$pkgname.desktop" )

md5sums=( '199d8f3dbc6697f06350b00de99f2274' )

## as of 2013-10-29 these hash sums worked. But as of 2014-02-03 somethings changed and
## the new hash sums are listed below.
## [[ "${CARCH}" = "i686" ]] && _arch="x86" && sha1sums+=('64fad1b28169f1f5a3cdd03175fac5973fe5d0ef')
## [[ "${CARCH}" = "x86_64" ]] && _arch="x64" && sha1sums+=('982ecb2fb2c30adc2fb7f3a2c250ce65b5d40777')

[[ "${CARCH}" = "i686" ]] && _arch="x86" && md5sums+=('73c6b9d853a0a6ab7c6d15174450a3f1')
[[ "${CARCH}" = "x86_64" ]] && _arch="x64" && md5sums+=('f937c3510615af68c007b8c72deadb14')

source+=("http://files.dev47apps.net/50/droidcam-v4l2-${_arch}.tar.gz")


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
