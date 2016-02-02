# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview
pkgver=0.95
pkgrel=1
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('boost-libs' 'qt5-base' 'libsigrok4dsl' 'libsigrokdecode')
makedepends=('boost')
conflicts=('dslogic')
replaces=('dslogic')
source=("git+https://github.com/DreamSourceLab/DSView.git#tag=0.95"
        'path.patch'
        'udev.rules'
        'dsview.desktop')
md5sums=('SKIP'
         'f2b000eb19883bc16bca716b5da78da3'
         'af6d97ba0fbea628e320bdb4b469b766'
         '095886809795b40d663bfe4b79395811')
install=dsview.install

prepare() {
  cd "$srcdir/DSView/DSView"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_SKIP_RPATH=1 .

  patch -Np1 -i "$srcdir/path.patch"
}

build() {
  cd "$srcdir/DSView/DSView"

  cmake .
  make
}

package() {
  cd "$srcdir/DSView/DSView"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 "$srcdir/dsview.desktop" "$pkgdir/usr/share/applications/dsview.desktop"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dsview.rules"
}

# vim:set ts=2 sw=2 et:
