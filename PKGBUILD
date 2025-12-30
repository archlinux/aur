# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=afterstep-git
_name=AfterStep
_pkgname=afterstep
pkgver=2.2.12.r45.gf6da4b79
pkgrel=1
pkgdesc="A Window Manager based on NextStep Interface"
arch=('i686' 'x86_64')
url="http://www.afterstep.org"
license=('GPL')
depends=('gtk2>=2.18.6' 'libpng' 'libtiff' 'readline' 'freetype2' 'dbus' 'librsvg')
makedepends=('libxt' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!emptydirs' 'staticlibs')
source=("$_pkgname::git+https://github.com/afterstep/afterstep.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  # https://github.com/afterstep/afterstep/pull/7
  sed -i 's/ar clq/ar cq/g' */*.in */*/*.in
}

build() {
  cd $_pkgname
  # gcc changes
  export CFLAGS="$CFLAGS -Wno-incompatible-pointer-types -Wno-implicit-function-declaration -Wno-implicit-int -std=gnu17"
  ./configure --prefix=/usr --mandir=/usr/share/man
  # j1 for https://github.com/afterstep/afterstep/issues/8
  make V=0 -j1
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 $_name.desktop.final "$pkgdir/usr/share/xsessions/$_name.desktop"
  
  # fix permission
  chmod 644 "$pkgdir"/usr/lib/*.a
}
