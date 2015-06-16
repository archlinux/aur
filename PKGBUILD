# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-xvdr
pkgver=0.9.9_64_gb300fc3
_gitver=b300fc3572f31ec3ed73929bc0b4044f2b144161
_vdrapi=2.2.0
pkgrel=2
url="https://github.com/pipelka/vdr-plugin-xvdr"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="VDR plugin to handle XBMC clients"
depends=('gcc-libs' "vdr-api=${_vdrapi}")
optdepends=('vdr-wirbelscan: Support channel searches with XBMC')
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://github.com/pipelka/vdr-plugin-xvdr.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=('var/lib/vdr/plugins/xvdr/allowed_hosts.conf'
        'var/lib/vdr/plugins/xvdr/xvdr.conf'
        "etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '5927a0c16043a43af28d0a07b88a8dc4')

pkgver() {
  cd "${srcdir}/vdr-plugin-xvdr"
  git describe --tags | sed 's/xvdr-//g;s/-/_/g'
}

build() {
  cd "${srcdir}/vdr-plugin-xvdr"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-xvdr"
  make DESTDIR="${pkgdir}" install install-conf

  chown -R 666:666 "$pkgdir/var/lib/vdr"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
