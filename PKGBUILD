# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Francois Rigaut <frigaut@gmail.com>

pkgname=yorick
pkgver=2_2_04
pkgrel=2
pkgdesc='Interpreted language for data processing'
arch=('x86_64' 'i686')
license=('BSD')
url='http://yorick.github.com/'
groups=('science' 'yorick-all')
depends=('rlwrap')
makedepends=('git' 'pkgconfig')
source=("https://github.com/LLNL/yorick/archive/y_$pkgver.tar.gz")
sha256sums=('4a4f3a18aed533cc5fadbb3d4bafb48f04834a22cbff6ad5c19d9dba74facbda')

prepare() {
  cd ${pkgname}-y_${pkgver}

  make prefix=/usr ysite
  make config

  echo 'Y_CFLAGS=-DHAVE_XFT' >> Make.cfg
  echo 'XINC=-I/usr/include/freetype2' >> Make.cfg
  echo 'XLIB=-lXft' >> Make.cfg
  echo 'X11LIB=$(XLIB) -lX11 -lfontconfig' >> Make.cfg

  # Wrapper script for rlwrap and yorick
  echo "#!/bin/sh" > wrap.sh
  echo "exec rlwrap -s 2000 -c /usr/lib/yorick/$pkgver/bin/yorick \$*" >> wrap.sh
}

build() {
  cd ${pkgname}-y_${pkgver}
  make
}

package() {
  cd ${pkgname}-y_${pkgver}
  make INSTALL_ROOT="$pkgdir" install
  install -DTm755 wrap.sh "$pkgdir/usr/bin/yorick"
}
