# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dslogic
pkgver=0.4
pkgrel=6
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('boost-libs' 'qt4' 'libsigrok4dslogic' 'libsigrokdecode')
makedepends=('boost')
conflicts=('dslogic')
source=("git+https://github.com/DreamSourceLab/DSLogic.git#commit=7c8b0b19d3c049497612a21500340c0e52dc9a92"
        'decode.patch'
        'path.patch'
        'udev.rules'
        'dslogic.desktop')
md5sums=('SKIP'
         '241f8b2a57576edf82aad808ee23169d'
         '82097feb211342f1f6f6344a9660aaf2'
         'af6d97ba0fbea628e320bdb4b469b766'
         'de092f197a97096aaf05da997cd55ea9')
install=dslogic.install

prepare() {
  cd "$srcdir/DSLogic/DSLogic-gui"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DFORCE_QT4=1 -DCMAKE_SKIP_RPATH=1 .

  patch -Np1 -i "$srcdir/decode.patch"
  patch -Np1 -i "$srcdir/path.patch"
}

build() {
  cd "$srcdir/DSLogic/DSLogic-gui"

  make
}

package() {
  cd "$srcdir/DSLogic/DSLogic-gui"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 "$srcdir/dslogic.desktop" "$pkgdir/usr/share/applications/dslogic.desktop"
  install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/20-dslogic.rules"
}

# vim:set ts=2 sw=2 et:
