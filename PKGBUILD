# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=nspluginwrapper
pkgver=1.3.2
pkgrel=1
pkgdesc="Cross-platform NPAPI compatible plugin viewer"
arch=('x86_64')
url="http://freshmeat.net/projects/nspluginwrapper/"
license=('GPL')
depends=('curl' 'lib32-libxt' 'lib32-gcc-libs' 'gtk2' 'lib32-gtk2')
makedepends=('gcc-multilib')
source=(http://web.mit.edu/davidben/Public/$pkgname/$pkgname-$pkgver.tar.gz
        nspluginwrapper-native-windows.patch)
sha256sums=('f3a40d160601520d36b6f5c342e1e9751b2bdc70dff5e2e880e1d18ed8830201'
            '3796b66f53448f4668e70aec97a3d74db2b2fcd308b36f87373405547cae38b1')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Patch taken from the openSuSE src.rpm
  patch -p0 -i "$srcdir/nspluginwrapper-native-windows.patch"

  ./configure --with-lib32=lib32 --with-lib64=lib
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir"/usr/lib/mozilla/plugins/
  ln -s /usr/lib/nspluginwrapper/x86_64/linux/npwrapper.so "$pkgdir"/usr/lib/mozilla/plugins/
}

# vim:set ts=2 sw=2 et:
