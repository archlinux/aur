# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
 
pkgname=linux-steam-integration-git
_pkgname=linux-steam-integration
pkgver=0.2.r4.g6659905
pkgrel=1
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/solus-project/linux-steam-integration"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('gtk3' 'steam')
makedepends=('git')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
provides=('linux-steam-integration')
conflicts=('linux-steam-integration')
install=linux-steam-integration.install
source=("git+https://github.com/solus-project/linux-steam-integration.git"
        "move-steam-lsi.sh"
        "remove-steam-lsi.sh"
        "steam-lsi.hook")
md5sums=('SKIP'
         '26e6bf6604d7b31d40b27d87de797ec2'
         'acf726dbec295c8275c09d7d1995e9b1'
         'd6e67475f32c37156a04fb608fd3d518')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  ./autogen.sh --enable-frontend 
}

build() {
  cd $srcdir/$_pkgname
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/bin/steam $pkgdir/usr/bin/steam_lsi
  install -D -m 644 $srcdir/steam-lsi.hook $pkgdir/usr/share/libalpm/hooks/steam-lsi.hook
  install -d $pkgdir/usr/lib/steam
  install -D -m 755 $srcdir/*move-steam-lsi.sh $pkgdir/usr/lib/steam/
}

# vim:set ts=2 sw=2 et:
