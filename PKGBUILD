# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Francois Rigaut <frigaut@gmail.com>

pkgname=yorick
pkgver=2.2
pkgrel=1
pkgdesc='Interpreted language for data processing'
arch=('x86_64' 'i686')
license=('BSD')
url='http://yorick.github.com/'
groups=('science' 'yorick-all')
depends=('rlwrap')
makedepends=('git' 'pkgconfig')
source=('git://github.com/dhmunro/yorick.git#commit=01e228e'
        'https://raw.githubusercontent.com/mdcb/python-gist/master/patch/yorick-cvs-pwin-border.patch'
        'https://raw.githubusercontent.com/frigaut/frigaut-arch-abs-files/master/yorick-cvs-xft-2012sep11.patch')
md5sums=('SKIP'
         '4e486a0593cdedae8e44355d0b627abb'
         '3cbd67fed39230c6a859ae601c1557f5')

prepare() {
  cd yorick

  patch -p1 -i ../yorick-cvs-xft-2012sep11.patch

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

# vim:set ts=2 sw=2 et:
