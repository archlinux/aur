# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
# Contributor: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgbase=dfatmo
pkgname=('dfatmo' 'vdr-dfatmo' 'kodi-addon-dfatmo')
pkgver=0.5.0
_vdrapi=2.4.0
pkgrel=2
epoch=1
url="https://github.com/durchflieger/${pkgbase}"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('libusbx' 'python2' "vdr-api=${_vdrapi}" 'zip')
source=("https://github.com/durchflieger/${pkgbase}/archive/v${pkgver}.tar.gz"
        '45-df10ch.rules'
        "50-dfatmo.conf")
md5sums=('6de5945600b0f2bea6af52ccf8f1cc32'
         'c5e0bf17e88febc7e86c7e435f5eea5f'
         'f8f2376c860c78f522e40b1afd02d38c')
prepare() {
  cd "${srcdir}/DFAtmo-${pkgver}"
  sed -i "s/python-config/python2-config/" Makefile
  sed -i 's/static const char \*libusb/const char \*libusb/g' df10choutputdriver.c
}

build() {
  cd "${srcdir}/DFAtmo-${pkgver}"

  #Compile dfatmo
  CFLAGS+=' -fPIC'
  make DFATMOINSTDIR='/usr' ATMODRIVER=atmodriver.so

  #Compile vdr plugin
  make DFATMOINSTDIR='/usr' vdrplugin
}

package_dfatmo() {
  pkgdesc="Analyzes the video picture and generates output data for so called 'Atmolight' controllers"
  replaces=('dfatmo-driver')
  conflicts=('dfatmo-driver')
  depends=('libusbx' 'python2')

  cd "${srcdir}/DFAtmo-${pkgver}"
  make DFATMOINSTDIR="${pkgdir}/usr" ATMODRIVER=atmodriver.so dfatmoinstall
}

package_vdr-dfatmo() {
  pkgdesc="VDR plugin to drive a colored back lighting for TVs"
  depends=('gcc-libs' 'dfatmo' "vdr-api=${_vdrapi}")
  _plugname=$(echo $pkgname | sed 's/vdr-//g')
  backup=("etc/vdr/conf.avail/50-$_plugname.conf")

  cd "${srcdir}/DFAtmo-${pkgver}"
  make VDRDESTDIR="${pkgdir}" vdrinstall
  install -Dm644 "${srcdir}/45-df10ch.rules" "${pkgdir}/usr/lib/udev/rules.d/45-df10ch.rules"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}

package_kodi-addon-dfatmo() {
  pkgdesc="VDR plugin to drive a colored back lighting for TVs"
  arch=('any')
  replaces=('xbmc-addon-dfatmo')
  conflicts=('xbmc-addon-dfatmo')
  depends=('dfatmo' 'kodi')

  cd "${srcdir}/DFAtmo-${pkgver}"
  make XBMCDESTDIR="$pkgdir/usr/share/kodi/addons/script.dfatmo" xbmcinstall
}
