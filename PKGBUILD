# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>


pkgname=librcc
_pkgname=librcc-debian
pkgver=0.2.12
_pkgver=0.2.12-0.1
pkgrel=2
pkgdesc="Charset Conversion Library"
arch=('i686' 'x86_64' 'aarch64')
url="http://rusxmms.sourceforge.net/"
license=('LGPL-2.1-only')
depends=('aspell' 'enca' 'libxml2' 'librcd' 'gtk2' 'gtk3')
source=("https://salsa.debian.org/debian/librcc/-/archive/debian/${_pkgver}/${_pkgname}-${_pkgver}.tar.gz")
sha256sums=('e2f1d7dae80ab8e943917085d978e3ce2d1d45abf4a9c0b2e06631648646166c')

build() {
  cd "$srcdir"/${_pkgname}-${_pkgver}
  ./configure --prefix=/usr --disable-bdb
  make
}

package() {
  cd "$srcdir"/${_pkgname}-${_pkgver}
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
