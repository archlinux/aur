# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-neutrinoepg
pkgver=0.3.6.r7.gc3615ff
_gitver=c3615ffcb0f5e5c2d380052fffd4a5d53293cde3
_vdrapi=2.6.3
pkgrel=7
pkgdesc="Neat EPG-Viewer for VDR"
url='https://github.com/vdr-projects/vdr-plugin-neutrinoepg'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=$_vdrapi")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://github.com/vdr-projects/vdr-plugin-${_plugname}.git#commit=${_gitver}")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  _last_release=0.3.6
  _last_release_commit=812eaeb5033c3cd349d043d4360c1867b161c263

  _count=$((`git rev-list --count HEAD` - `git rev-list --count $_last_release_commit`))
  if [ $_count -gt 0 ]; then
    printf "%s.r%s.g%s" $_last_release \
      $_count \
      `git rev-parse --short=7 HEAD`
  else
    printf "%s" $_last_release
  fi
}

build() {
  cd "$srcdir/vdr-plugin-$_plugname"
  make
}

package() {
  cd "$srcdir/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
