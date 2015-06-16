# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-undelete
pkgver=0.0.7
_vdrapi=2.2.0
pkgrel=20
pkgdesc="allows to undelete accidentally deleted VDR recordings"
url="http://projects.vdr-developer.org/projects/plg-undelete"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1060/$pkgname-$pkgver.tgz"
        "undelete-newmakefile-vdr-1.7.36.tgz::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=32684"
        'undelete-vdr2.1.2compat.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('667493335e0b1629e72de86a4cc7e558'
         'e3b79c3d5474e84bc5e7c624553f87a0'
         '78999207fa6a1d3714d493d09cc096c2'
         'd37975ef3acb4bcf41c74e56606ad0c1')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/undelete-vdr2.1.2compat.diff"
  cp "$srcdir/undelete/Makefile" .
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
