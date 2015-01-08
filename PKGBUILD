# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=afterstep-git
_name=AfterStep
_pkgname=afterstep
pkgver=2.2.12.r12.gbfb4126
pkgrel=2
pkgdesc="A Window Manager based on NextStep Interface"
arch=('i686' 'x86_64')
url="http://www.afterstep.org"
license=('GPL')
depends=('gtk2>=2.18.6' 'libpng' 'libtiff' 'readline' 'freetype2' 'dbus-core' 'librsvg')
makedepends=('libxt')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!emptydirs' 'staticlibs')
source=("$_pkgname::git+https://github.com/sashavasko/afterstep-devel.git"
        desktop_entry.patch)
md5sums=('SKIP'
         '90cb380546b5d64208f13ab4f473f56d')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  patch -p0 -i ../desktop_entry.patch
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make V=0
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 $_name.desktop "$pkgdir/usr/share/xsessions/$_name.desktop"
  
  # fix permission
  chmod 644 "$pkgdir"/usr/lib/*.a
}
