# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: George Kranis https://github.com/gkranis/vdr4arch
pkgname=vdr-eepg
pkgver=0.0.5_242_g32b4e66
_gitver=32b4e669bf8bc6e3336073616c121f10b8518fe8
_vdrapi=2.4.6
pkgrel=2
pkgdesc="Extended EPG (EEPG) plugin for VDR"
url="http://projects.vdr-developer.org/projects/plg-eepg"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://projects.vdr-developer.org/git/vdr-plugin-eepg.git#commit=$_gitver"
        "$pkgname-fix_sscanf.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('SKIP'
            'bb6213bbe4941b92ec2e6d9852d72d9a3186d99e9a0e65ee082f9cc971c10e51')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/eepg_//g'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  patch -p1 -i "$srcdir/$pkgname-fix_sscanf.patch"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
