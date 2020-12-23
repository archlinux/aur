# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Ole Ernst <olebowle[at]gmx[dot]com
pkgbase=vdr-streamdev
pkgname=(vdr-streamdev-{client,server})
pkgver=0.6.1.r36.ge2a9b97
_gitver=e2a9b979d3fb92967c7a6a8221e674eb7e55c813
_vdrapi=2.4.6
pkgrel=4
pkgdesc="implementation of the VTP (Video Transfer Protocol)"
url="http://projects.vdr-developer.org/projects/show/plg-streamdev"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgbase//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-streamdev.git#commit=$_gitver"
        "50-$_plugname-server.conf")
md5sums=('SKIP'
         '8c352d8ee7401eeb34fe5ab82e791a21')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  _last_release=0.6.1
  _last_release_commit=40704cdcbc012e15e9e814d8fe64303f13988f56

  _count=$((`git rev-list --count HEAD` - `git rev-list --count $_last_release_commit`))
  if [ $_count -gt 0 ]; then
    printf "%s.r%s.g%s" $_last_release \
      $_count \
      `git rev-parse --short HEAD`
  else
    printf "%s" $_last_release
  fi
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make -j1
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
