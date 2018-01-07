# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=librcc
pkgver=0.2.12
pkgrel=1
pkgdesc="Charset Conversion Library"
arch=(x86_64)
url="http://rusxmms.sourceforge.net/"
license=('GPL')
depends=('aspell' 'enca' 'libxml2' 'librcd')
makedepends=('patch' 'gtk2')
install=librcc.install
#source=(http://downloads.sourceforge.net/rusxmms/${pkgname}-${pkgver}.tar.bz2)
source=(http://darksoft.org/files/rusxmms/librcc-$pkgver.tar.bz2)
md5sums=('930de6cd64e5daa33cabed58261634bb')

build() {
  cd "$srcdir"/$pkgname-${pkgver}
  ./configure --prefix=/usr --disable-bdb
  make
}

package() {
  cd "$srcdir"/$pkgname-${pkgver}
  mkdir -p "$pkgdir"/etc/rcc
  mkdir -p "$pkgdir"/usr/lib/rcc/engines
  mkdir -p "$pkgdir"/usr/bin

  make DESTDIR="$pkgdir" install

  make -C examples
  make -C examples install DESTDIR="$pkgdir"
  rm -f "$pkgdir"/usr/bin/example*

  install -m 644 examples/rcc.xml "$pkgdir"/etc

  if [ -f "$pkgdir"/usr/bin/rcc-gtk2-config ]; then
      ln -s rcc-gtk2-config "$pkgdir"/usr/bin/rcc-config
  elif [ -f "$pkgdir"/usr/bin/rcc-gtk-config ]; then
      ln -s rcc-gtk-config "$pkgdir"/usr/bin/rcc-config
  else
      echo "#!/bin/bash" > "$pkgdir"/usr/bin/rcc-config
      echo "echo \"Configuration UI is not available!\"" >> "$pkgdir"/usr/bin/rcc-config
  fi
}
