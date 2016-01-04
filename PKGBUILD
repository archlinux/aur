# Maintainer: willemw <willemw12@gmail.com>
# Contributor: totoloco <totoloco at gmail dot com>

_pkgname=pmus
pkgname=$_pkgname-git
pkgver=0.42.r351.g786cbfd
pkgrel=1
pkgdesc="Practical Music Search is a highly configurable, ncurses-based client for MPD"
arch=('i686' 'x86_64')
url="https://ambientsound.github.io/pms/"
license=('GPL')

# Enable boost_regex
#makedepends=('boost')
#depends=('boost-libs' 'intltool' 'libmpdclient' 'ncurses')

makedepends=('git' 'pandoc')
depends=('intltool' 'libmpdclient' 'ncurses')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/ambientsound/pms.git)
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --long --tags --match "[0-9]*" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  # Enable boost_regex
  #sed -i 's|^./configure[ ]*$|./configure --enable-regex --prefix=/usr|' rebuild.sh

  sed -i 's|^./configure[ ]*$|./configure --prefix=/usr|' rebuild.sh
}

build() {
  cd $pkgname

  # A fix for "undefined reference" errors: remove -D_FORTIFY_SOURCE=2 and -O2 from build flags
  CPPFLAGS="$(echo $CPPFLAGS | sed "s|-D_FORTIFY_SOURCE=\w||g")"                   
  CFLAGS="$(echo $CFLAGS | sed "s|-O\w||g")"
  CXXFLAGS="$(echo $CXXFLAGS | sed "s|-O\w||g")"

  ./rebuild.sh
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -dm755 "$pkgdir/usr/share/pms/examples"
  install -m644 examples/* "$pkgdir/usr/share/pms/examples"
}

