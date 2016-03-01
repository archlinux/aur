# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: ast261
pkgname=vdr-burn
pkgver=0.2.2
epoch=1
_vdrapi=2.2.0
pkgrel=1
pkgdesc="VDR plugin to create DVDs"
url="https://projects.vdr-developer.org/projects/plg-burn"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gd' 'boost' 'libcdio' 'imlib2' 'dvd+rw-tools' 'dvdauthor' 'mjpegtools' 'vamps' 'lxdvdrip' 'projectx' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://projects.vdr-developer.org/attachments/download/1252/${pkgname}-${pkgver}.tgz"
        "burn-vdr-2.2.diff"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('d9a9cdad05fee7a87690717c7859de44'
         '2a5c6acd9256fa3fd9c47888a27a76ad'
         '52067c131e66d8a767fdc2aeb76842d6')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -i "$srcdir/burn-vdr-2.2.diff"
  sed -i 's/ProjectX.jar/projectx\/ProjectX.jar/g' ${_plugname}/vdrburn-dvd.conf
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Copy resource files
  mkdir -p "$pkgdir/usr/bin"
  cp *.sh "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/var/lib/vdr/plugins/${_plugname}"
  cp -a burn "$pkgdir/var/lib/vdr/plugins"
  
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
  
  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
