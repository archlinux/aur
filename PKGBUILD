# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-hddarchive
epoch=1
pkgver=0.0.1.r6.gd014d52
_gitver=d014d52dcb3790bd1ba38fe7b6fb0c4136364148
_vdrapi=2.4.0
pkgrel=2
pkgdesc="Brings the archive-hdd functionality to VDR."
url="http://projects.vdr-developer.org/projects/show/plg-hddarchive"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('bash' 'gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
install="$pkgname.install"
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-hddarchive.git#commit=$_gitver"
        'hddarchive-default_settings.diff')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '9982fc924c8300567052b239b4535228')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  _last_release=0.0.1
  _last_release_commit=edf6617c323c8ff173201531c10debf199b4dec5

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
  patch -p1 -i "$srcdir/hddarchive-default_settings.diff"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm755 vdr_move_to_hdd.sh "$pkgdir/usr/lib/vdr/bin/vdr_move_to_hdd.sh"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
