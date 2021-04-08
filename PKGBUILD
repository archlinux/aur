# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=equalx
pkgver=0.7.1
pkgrel=5
pkgdesc='Makes you easily write equations in LaTeX and preview them in real-time'
arch=('x86_64')
url="http://equalx.sourceforge.net/"
license=('GPL3')
depends=('exempi' 'ghostscript' 'hicolor-icon-theme' 'poppler' 'qt5-base' 'texlive-core')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        qt-5.11.patch)
sha256sums=('7f62e580206bc0e8e83a39bf4161bf6a6b0cd268507d5e1ad0781eeba1191f8b'
            '39bc412cde6f911e032adcbf1316a2d8f10500a46456739972f42d639504af6a')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../qt-5.11.patch
  sed -i '/Icon=/cIcon=equalx' resources/equalx.desktop
}

build() {
  cd $pkgname-$pkgver
  qmake
  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 equalx "$pkgdir"/usr/bin/equalx

  for _symbol in $(find resources/symbols -type f); do
    install -Dm644 $_symbol "$pkgdir"/usr/share/equalx/$_symbol
  done

  install -Dm644 resources/equalx.desktop \
    "$pkgdir"/usr/share/applications/equalx.desktop

  for _size in 16 22 24 32 48 64 128; do
    install -Dm644 resources/icons/equalx/equalx-${_size}x${_size}.png \
      "$pkgdir"/usr/share/icons/hicolor/${_size}x${_size}/apps/equalx.png
  done

  install -Dm644 resources/icons/equalx/equalx.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/equalx.svg

  install -Dm644 equalx.1 "$pkgdir"/usr/share/man/man1/equalx.1
}
