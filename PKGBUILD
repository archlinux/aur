# Maintainer: Anatol Pomozov
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=0.94.r2.g1cd6420
pkgrel=1
pkgdesc='GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
arch=(i686 x86_64)
url='http://www.dreamsourcelab.com/'
license=(GPL3)
depends=(boost-libs qt5-base libsigrok4dsl-git libsigrokdecode)
makedepends=(boost cmake)
source=(git://github.com/DreamSourceLab/DSView
        0001-Fix-compilation-error-found-at-Linux-Arch.patch
        0002-Use-usr-share-for-resource-files-bin-folder-is-for-b.patch
        0003-Fix-compile-error.patch
        udev.rules
        dsview.desktop)
sha1sums=('SKIP'
          'e5ae41c0157e8e318866be7785ff9bee3198d387'
          '0fe0fb09ce13383c26c39f016d23a37a9af82bef'
          '64fb34f100c4a94ab497581a871f006012727b5c'
          '50f23061fcd03e0aafdefb3b676f1846c036c856'
          '2354eb8d1140e8e3ce523122a52a5d07fa80f739')
install=dsview.install

pkgver() {
  cd DSView
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd DSView
  patch -p1 < "$srcdir/0001-Fix-compilation-error-found-at-Linux-Arch.patch"
  patch -p1 < "$srcdir/0002-Use-usr-share-for-resource-files-bin-folder-is-for-b.patch"
  patch -p1 < "$srcdir/0003-Fix-compile-error.patch"
}

build() {
  cd DSView/DSView

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_SKIP_RPATH=1 .

  # for f in $(find . -type f -name "*.png"); do echo "Processing $f ..."; convert $f -strip $f; done
  make
}

package() {
  cd DSView/DSView

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/dsview.desktop" "$pkgdir/usr/share/applications/dsview.desktop"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dsview.rules"
}
