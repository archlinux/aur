# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vnsiserver
pkgver=1.8.0.r13.g47a90dd
_gitver=47a90dd9298753083a9a6482bb9990ea9a88aa7a
_vdrapi=2.6.3
epoch=2
pkgrel=5
url="https://github.com/mdre77/vdr-plugin-vnsiserver"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="VDR plugin to handle Kodi clients"
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://github.com/mdre77/vdr-plugin-$_plugname.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/vnsiserver/allowed_hosts.conf')
sha256sums=('SKIP'
            '0e03e0df28b8210e3813536c7945b94e4c13ac775eb2c8d25403f90aa8f3c74c')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/var/lib/vdr/plugins"
  cp -r vnsiserver "$pkgdir/var/lib/vdr/plugins"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
