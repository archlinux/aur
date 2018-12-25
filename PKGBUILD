# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-ddci2
pkgver=1.0.5
_gitver=a5a7ab1cb6be3ebddb8af77cc18313d75404ed81
_vdrapi=2.4.0
pkgrel=2
pkgdesc="Support for stand alone CI by Digital Devices for VDR 2.1.6 and higher."
url="https://github.com/jasmin-j/vdr-plugin-ddci2"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://github.com/jasmin-j/vdr-plugin-ddci2.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '5dc8a287efe1419aaf1162cb6a6f28f3')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  _last_release=1.0.5
  _last_release_commit=a5a7ab1cb6be3ebddb8af77cc18313d75404ed81

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
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
