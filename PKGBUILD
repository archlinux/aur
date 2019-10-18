# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Francois Rigaut <frigaut@gmail.com>

pkgname=yorick
pkgver=2_2_04
pkgrel=1
pkgdesc='Interpreted language for data processing'
arch=('x86_64' 'i686')
license=('BSD')
url='http://yorick.github.com/'
groups=('science' 'yorick-all')
depends=('rlwrap')
makedepends=('git' 'pkgconfig')
source=("https://github.com/LLNL/yorick/archive/y_$pkgver.tar.gz")
md5sums=('f46ba063992d496114db6c0a8df0f9c4')

prepare() {
  cd yorick

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
  make -C yorick
}

package() {
  make -C yorick INSTALL_ROOT="$pkgdir" install
  install -DTm755 yorick/wrap.sh "$pkgdir/usr/bin/yorick"
}
