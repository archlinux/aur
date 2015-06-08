# Contributor: Stefan Husmann  <stefan.husmann@t-systems.com>
# Contributor: menta 
pkgname=tif22pnm
pkgver=0.14
pkgrel=1
pkgdesc="converter used by sam2p if available"
arch=('i686' 'x86_64')
depends=('libpng' 'libtiff')
url="http://pts.szit.bme.hu"
license=('GPL')
provides=(tif22pnm)
source=(http://sam2p.googlecode.com/files/$pkgname-$pkgver.tar.gz do.sh.patch)
md5sums=('7bb776bb2eca962f5237ea2cc6dcf85d'
         '94a5d88cb8ddd234a6117a906c9d5a28')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # patching do.sh
  # Inspiration:
  # http://code.google.com/p/pdfsizeopt/issues/detail?id=48#c9 --> -lz flag
  # "undefined reference to symbol 'pow@@GLIBC_2.2.5'" --> -lm flag
  # https://aur.archlinux.org/packages.php?ID=7573
  cp "$srcdir/do.sh.patch" do.sh.patch
  patch -p0 < do.sh.patch
  rm do.sh.patch

  ./configure --prefix=$pkgdir/usr
  ./do.sh compile 
}
package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d $pkgdir/usr/share/tif22pnm
  install -d $pkgdir/usr/bin
  install -m644 README $pkgdir/usr/share/tif22pnm
  install -m755 tif22pnm $pkgdir/usr/bin
  install -m755 png22pnm $pkgdir/usr/bin
}
