# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-graphlcd
pkgver=20130127
_gitver=5b5bf594f026fbcba2e31b423b43a2e5e45fd471
_vdrapi=2.2.0
pkgrel=13
pkgdesc="VDR Plugin to support graphical LC displays"
url="http://projects.vdr-developer.org/projects/show/graphlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphlcd-base' 'ttf-dejavu' "vdr-api=${_vdrapi}")
optdepends=('serdisplib: Support more modern LCDs')
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-graphlcd.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '7cae4551e65a16f5d7680b2303495757')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git log -1 --pretty=format:%ad --date=short | sed 's/-//g'
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  cd "$pkgdir/usr/share/vdr/plugins/graphlcd/fonts"
  rm *.ttf
  ln -s /usr/share/fonts/TTF/DejaVuSans-Bold.ttf .
  ln -s /usr/share/fonts/TTF/DejaVuSans-Bold.ttf VeraBd.ttf
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf .
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf Vera.ttf
  ln -s /usr/share/fonts/TTF/DejaVuSansCondensed.ttf .

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
