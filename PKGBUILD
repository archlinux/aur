# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-fritzbox
pkgver=1.5.3
_vdrapi=2.6.3
pkgrel=26
pkgdesc="Connects to the Fritz!Box to inform you about incoming and outgoing calls"
url="https://github.com/jowi24/vdr-fritz"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('boost-libs>=1.57.0' 'libgcrypt' "vdr-api=${_vdrapi}")
makedepends=('boost')
_plugname=${pkgname//vdr-/}
source=("https://github.com/jowi24/vdr-fritz/releases/download/$pkgver/$pkgname-$pkgver.tgz"
        "$pkgname-libnetpp-boost-1.67-fix.patch::https://github.com/jowi24/libnetpp/commit/212847f0efaeffee8422059b8e202d844174aaf3.patch"
        "$pkgname-libnetpp-add-missing-map.patch::https://github.com/jowi24/libnetpp/commit/fd5d3a23d8855745452bf5d8867c79cef6c489a7.patch"
        "$pkgname-detach_thread.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('d09471c229206e268216828c1a2d2bb7a15fc26530e0cb67bfbdb8ba934e2b0e'
            '8f5796a9dc725c627cc556fecd271f24f6a0a5c7fbc0a64df807cd4f3c6efa3a'
            '3a3642b4bdde2e9b14f596d0806b472abe6c63e474947c6a8379d8bd2806e8a8'
            '64af3529c3ea466911ee89f4848019421716a53526ee74a534ed713ccc5625ba'
            'f80efa7827c89f30d0ce25df00e6bb0efdf0e8fe68e9ca15c7f15caea731ba33')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"

  patch -p1 -d "libnet++" -i "${srcdir}/$pkgname-libnetpp-boost-1.67-fix.patch"
  patch -p1 -d "libnet++" -i "${srcdir}/$pkgname-libnetpp-add-missing-map.patch"
  patch -p1 -i "$srcdir/$pkgname-detach_thread.patch"
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
