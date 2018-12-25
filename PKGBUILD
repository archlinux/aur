# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-graphlcd
pkgver=1.0.0.r0.ga6c8e3d
_gitver=a6c8e3d4383ae164e26149888bbdc91cbd448ba8
_vdrapi=2.4.0
pkgrel=2
epoch=1
pkgdesc="VDR Plugin to support graphical LC displays"
url="http://projects.vdr-developer.org/projects/show/graphlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphlcd-base' 'ttf-dejavu' "vdr-api=${_vdrapi}")
optdepends=('serdisplib: Support more modern LCDs')
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-graphlcd.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '7cae4551e65a16f5d7680b2303495757')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  cd "$pkgdir/usr/share/vdr/plugins/graphlcd/fonts"
  rm *.ttf
  ln -s /usr/share/fonts/TTF/DejaVuSans-Bold.ttf .
  ln -s /usr/share/fonts/TTF/DejaVuSans-Bold.ttf VeraBd.ttf
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf .
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf Vera.ttf
  ln -s /usr/share/fonts/TTF/DejaVuSansCondensed.ttf .

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
