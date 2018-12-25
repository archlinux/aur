# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-upnp
pkgver=1.0.0.r14.g11a035a
_gitver=11a035aa4ec2b55faaef1eaa48b7726a28422048
_vdrapi=2.4.0
pkgrel=2
pkgdesc="extends the VDR with the possibility to act as an UPnP/DLNA Media Server (DMS)"
url="http://projects.vdr-developer.org/projects/plg-softhddevice"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libupnp' 'tntdb' 'tntnet' "vdr-api=${_vdrapi}")
makedepends=('boost' 'git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-$_plugname.git#commit=$_gitver"
        'upnp-vdr2.1.2compat.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/upnp/channelTitle.conf')
md5sums=('SKIP'
         '9aa486e95f113ac1791d5faffde27f5e'
         '145e9e822d1d734c4dcb294db4bb88d4')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  _last_release=1.0.0
  _last_release_commit=529f178bd15a361baf1e83837b1e872be14795a6

  _count=$((`git rev-list --count HEAD` - `git rev-list --count $_last_release_commit`))
  if [ $_count -gt 0 ]; then
    printf "%s.r%s.g%s" $_last_release \
      $_count \
      `git rev-parse --short HEAD`
  else
    printf "%s" $_last_release
  fi
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  patch -p1 -i "$srcdir/upnp-vdr2.1.2compat.diff"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
