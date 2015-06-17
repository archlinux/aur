# Maintainer: Anatol Pomozov
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=0.3.r54.g71d0f5a
pkgrel=1
pkgdesc='GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
arch=(i686 x86_64)
url='http://www.dreamsourcelab.com/'
license=(GPL3)
depends=(boost-libs qt5-base libsigrok4dsl-git libsigrokdecode)
makedepends=(boost cmake)
source=(git://github.com/DreamSourceLab/DSView
        0001-Fix-compilation-error.patch
        0002-Instead-of-polluting-bin-use-usr-share-path-for-reso.patch
        udev.rules
        dsview.desktop)
md5sums=('SKIP'
         '1e65dd1e0a3154296f37429ff2f6e817'
         'ee5cc08bff5f6a23ef4ba5fdfbf956a1'
         'af6d97ba0fbea628e320bdb4b469b766'
         '095886809795b40d663bfe4b79395811')
install=dsview.install

pkgver() {
  cd "$srcdir/DSView"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/DSView"
  patch -p1 < "$srcdir/0001-Fix-compilation-error.patch"
  patch -p1 < "$srcdir/0002-Instead-of-polluting-bin-use-usr-share-path-for-reso.patch"
}

build() {
  cd "$srcdir/DSView/DSView"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_SKIP_RPATH=1 .
  make
}

package() {
  cd "$srcdir/DSView/DSView"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/dsview.desktop" "$pkgdir/usr/share/applications/dsview.desktop"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dsview.rules"
}
