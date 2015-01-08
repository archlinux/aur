# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=glasswm
pkgver=0.9.0
pkgrel=1
pkgdesc="Small windowmanager forked from aewm++"
arch=(x86_64 i686)
url="https://github.com/RiJo/glass"
license=('GPL')
depends=('gcc-libs' 'libxext')
makedepends=('gendesk>=0.6' 'git')
source=("$pkgname::git+https://github.com/RiJo/glass.git"
	build.patch)
md5sums=('SKIP'
         'a9373dcb2b18869b3088f5ce3fae4b4e')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name Glass
  gendesk -f -wm --pkgname "${pkgname}_kdm" --exec "$pkgname" --name Glass
  cd $pkgname
  patch -Np1 -b -z .orig -i ../build.patch
}

build() {
  cd $pkgname
  mkdir bin
  make CCFLAGS="$CCFLAGS"
}

package() {
  cd $pkgname
  install -Dm755 "bin/glass" "$pkgdir/usr/bin/glass"
  install -Dm644 "$srcdir/${pkgname}.desktop" \
    "$pkgdir/usr/share/xsessions/${pkgname}.desktop"
  install -Dm644 "$srcdir/${pkgname}_kdm.desktop" \
    "$pkgdir/usr/share/apps/kdm/sessions/${pkgname}_kdm.desktop"
}
