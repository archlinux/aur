# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
 
pkgname=linux-steam-integration
pkgver=0.2
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
source=("https://github.com/solus-project/linux-steam-integration/releases/download/v${pkgver}/linux-steam-integration-${pkgver}.tar.xz"
        "move-steam-lsi.sh"
        "remove-steam-lsi.sh"
        "steam-lsi.hook")
md5sums=('bde97f0ee9995baa7f3bd2750b93198e'
         '26e6bf6604d7b31d40b27d87de797ec2'
         'acf726dbec295c8275c09d7d1995e9b1'
         'd6e67475f32c37156a04fb608fd3d518')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  args="\
  --sysconfdir=/etc \
  --localstatedir=/var \
  --prefix=/usr \
  --enable-frontend \
  --enable-silent-rules"
  ./configure CFLAGS="-g -O1 $CFLAGS" $args "$@"
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/bin/steam $pkgdir/usr/bin/steam_lsi
  install -D -m 644 $srcdir/steam-lsi.hook $pkgdir/usr/share/libalpm/hooks/steam-lsi.hook
  install -d $pkgdir/usr/lib/steam
  install -D -m 755 $srcdir/*move-steam-lsi.sh $pkgdir/usr/lib/steam/
}

# vim:set ts=2 sw=2 et:
