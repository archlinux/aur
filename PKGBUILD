# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-fritzbox
pkgver=1.5.3
_vdrapi=2.4.0
pkgrel=18
pkgdesc="Connects to the Fritz!Box to inform you about incoming and outgoing calls"
url="https://github.com/jowi24/vdr-fritz"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('boost-libs>=1.57.0' 'commoncpp2' 'libgcrypt' "vdr-api=${_vdrapi}")
makedepends=('boost')
_plugname=${pkgname//vdr-/}
source=("https://github.com/jowi24/vdr-fritz/releases/download/$pkgver/$pkgname-$pkgver.tgz"
        "libnetpp-boost-1.67-fix.patch::https://github.com/jowi24/libnetpp/commit/212847f0efaeffee8422059b8e202d844174aaf3.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('14a81f5c5fd0f871e9294964c1bf21fc'
         'ebf28bb6267256cdfa8c4fe6dc18f2b8'
         'a46d5cab7444a60d0ca9657d0785a8a0')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"

  patch -p1 -d "libnet++" -i "${srcdir}/libnetpp-boost-1.67-fix.patch"
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
