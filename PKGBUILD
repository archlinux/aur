# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-epg2vdr
pkgver=1.1.101
_vdrapi=2.4.1
pkgrel=1
pkgdesc="Used to retrieve EPG data into the VDR"
url="http://projects.vdr-developer.org/projects/plg-epg2vdr"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('jansson' 'libmariadbclient' 'libutil-linux' 'python' 'tinyxml2' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://projects.vdr-developer.org/git/vdr-plugin-epg2vdr.git/snapshot/vdr-plugin-$_plugname-$pkgver.tar.bz2"
        "$pkgname-python3.8-compat.patch"
)
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/epg2vdr/epg.dat')
sha256sums=('9f756baa0e9c20571885d8f729c4b13dbb961bd99103f8df2a941ba15b656a41'
            'bcf1a51393a7e612a11cf5eee3d7f439913d3b0faceab49786b771556804cb42')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  patch -p1 -i ${srcdir}/$pkgname-python3.8-compat.patch
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make GIT_REV=''
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
