# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-plex
pkgver=0.4.0
_vdrapi=5
pkgrel=13
pkgdesc="Plex plugin for Linux VDR"
url="https://github.com/chriszero/vdr-plugin-plex"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('poco' 'pcre' "vdr-api=${_vdrapi}" 'vdr-skindesigner')
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${url}/commit/6affa0ca83115dc92be2e020fe4af376b45217dc.diff"
        "${pkgname}-vdr-2.7.1-compat.patch"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('c04ecd342b73af31590be540a2c57f18'
         '96055215b9f0f667433780e1903bae83'
         'd7af2fb0b70260d059bd2ed9fee2a3e1'
         '6cae9281ef39d6c64569580fbffefe11')

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  patch -p1 -i "${srcdir}/6affa0ca83115dc92be2e020fe4af376b45217dc.diff"
  patch -p1 -i "${srcdir}/${pkgname}-vdr-2.7.1-compat.patch"
  # raise standart for Poco using std::literals
  sed 's,std=c++11,std=c++14,' -i Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  sed -i '/^VERSION :=/d' Makefile
  make GIT_REV=''
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
