# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-femon
pkgver=2.4.0
_vdrapi=5
pkgrel=13
pkgdesc="DVB Frontend Status Monitor plugin"
url="https://github.com/rofafor/vdr-plugin-femon"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/rofafor/vdr-plugin-femon/archive/v$pkgver.tar.gz"
        "${pkgname}-Removal-of-deprecated-interface-functions.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('bbcda3ebb98074f4569613b9ee3be99f7156d5cf63c9641e4fe7511c4b421286'
            '41ca399de45020d6daf29faef5091da20ed5e3e0fab340cd69e48281d0d0e081')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  # https://www.vdr-portal.de/forum/index.php?thread/136437-announce-vdr-version-2-7-1-freigegeben/&postID=1374078#post1374078
  patch -p1 -i "${srcdir}/${pkgname}-Removal-of-deprecated-interface-functions.patch"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make GITTAG=''
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
