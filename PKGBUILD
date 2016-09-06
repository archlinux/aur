# Maintainer: Stefan Husmann  <stefan.husmann@t-systems.com>
# Contributor: menta

pkgbase=tif22pnm
pkgname=('tif22pnm' 'png22pnm')
pkgver=0.14
pkgrel=2
pkgdesc="converter used by sam2p if available"
arch=('i686' 'x86_64')
url="http://pts.szit.bme.hu"
license=('GPL')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sam2p/$pkgname-$pkgver.tar.gz do.sh.patch)
sha256sums=('d59ea3f1fdd6802e66a44fbfa8979d4e61c9fd021de36675249a877392378e01'
            '3835af3f4f8db84744fef7e00ecbc1cca1c026e2f5794e0746af2cd0558e2127')

prepare() {
  # patching do.sh
  # Inspiration:
  # http://code.google.com/p/pdfsizeopt/issues/detail?id=48#c9 --> -lz flag
  # "undefined reference to symbol 'pow@@GLIBC_2.2.5'" --> -lm flag
  # https://aur.archlinux.org/packages.php?ID=7573
  cd "$srcdir/$pkgbase-$pkgver"
  patch -p0 < "$srcdir"/do.sh.patch
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  ./configure --prefix="$pkgdir"/usr
  ./do.sh compile 
}

package_png22pnm() {
  cd "$srcdir/$pkgbase-$pkgver"
  depends=('libpng')
  install -Dm755 png22pnm "$pkgdir"/usr/bin/png22pnm
}

package_tif22pnm() {
  cd "$srcdir/$pkgbase-$pkgver"
  depends=('libtiff')
  install -Dm644 README "$pkgdir"/usr/share/tif22pnm/README
  install -Dm755 tif22pnm "$pkgdir"/usr/bin/tif22pnm
}
