# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Ole Ernst <olebowle[at]gmx[dot]com
pkgbase=vdr-streamdev
pkgname=(vdr-streamdev-{client,server})
pkgver=0.6.1_24_g7b17f77
_gitver=7b17f7725cd3bd97dd3921d96575c50a86e3fac2
_vdrapi=2.2.0
pkgrel=2
pkgdesc="implementation of the VTP (Video Transfer Protocol)"
url="http://projects.vdr-developer.org/projects/show/plg-streamdev"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgbase//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-streamdev.git#commit=$_gitver"
        "http://projects.vdr-developer.org/attachments/download/1844/vdr-plugin-streamdev-filter-patch.diff"
        "http://projects.vdr-developer.org/attachments/download/1853/vdr-plugin-streamdev-filter-patch2.diff"
        "50-$_plugname-server.conf")
md5sums=('SKIP'
         'a1e4b3807ede87b810abc973666a88eb'
         'e0ddaa269ce0727dd2e434a417b42bf5'
         '8c352d8ee7401eeb34fe5ab82e791a21')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git tag -a 0.6.1 -m 'Added Tag' 40704cdcbc012e15e9e814d8fe64303f13988f56 2> /dev/null
  git describe --tags | sed 's/-/_/g'
}

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  patch -p1 -i "$srcdir/vdr-plugin-streamdev-filter-patch.diff"
  patch -p1 -i "$srcdir/vdr-plugin-streamdev-filter-patch2.diff"
  sed -i 's/m_Buffer\[4096\]/m_Buffer\[8192\]/' client/filter.c
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make
}

package_vdr-streamdev-client() {
  pkgdesc+=': client-side'
  replaces=('vdr-streamdev')
  conflicts=('vdr-streamdev')
  backup=("etc/vdr/conf.avail/50-$_plugname-client.conf")
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install-client

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname-client]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname-client.conf"
}

package_vdr-streamdev-server() {
  pkgdesc+=': server-side'
  replaces=('vdr-streamdev')
  conflicts=('vdr-streamdev')
  backup=("etc/vdr/conf.avail/50-$_plugname-server.conf"
          'var/lib/vdr/plugins/streamdev-server/streamdevhosts.conf')
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install-server

  install -Dm644 streamdev-server/streamdevhosts.conf "$pkgdir/var/lib/vdr/plugins/streamdev-server/streamdevhosts.conf"
  chown -R 666:666 "$pkgdir/var/lib/vdr"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname-server.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname-server.conf"
}