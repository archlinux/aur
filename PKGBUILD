# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-radio
pkgver=1.1.0
_vdrapi=8
pkgrel=14
pkgdesc="Display an background image while the vdr is switched to radio channels"
url='https://github.com/vdr-projects/vdr-plugin-radio'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::https://github.com/vdr-projects/vdr-plugin-${_plugname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-vdr-2.7.1-compat.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('8833594eb1a2d9377a8b59828cd8e259c980a0eae3a01c126def67c9d71ff7bc'
            '5fada0001317aec49ef1101b450c1bb826a7c76180db5bcd4c3706d1c748bb21'
            'f4d789b518e9343fd554035f494157b4f8970ec653b2849260e0a442bcd8ee64')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  # https://www.vdr-portal.de/forum/index.php?thread/136437-announce-vdr-version-2-7-1-freigegeben/&postID=1374283#post1374283
  patch -p1 -i "${srcdir}/${pkgname}-vdr-2.7.1-compat.patch"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  #Install all stillpictures
  mkdir -p "$pkgdir/usr/share/vdr/plugins/$_plugname"
  install -Dm644 config/mpegstill/* "$pkgdir/usr/share/vdr/plugins/$_plugname"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
