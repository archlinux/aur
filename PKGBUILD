# $Id$
# Maintainer: Marc Aldorasi <m101010a at gmail dot com>

_pkgbasename=swh-plugins
pkgname=lib32-$_pkgbasename
pkgver=0.4.15
pkgrel=6
pkgdesc="Steve Harris' LADSPA plug-ins suite"
arch=('x86_64')
url="http://plugin.org.uk/"
license=('GPL')
install=lib32-swh-plugins.install
depends=('lib32-fftw' 'lib32-ladspa')
makedepends=('lib32-libxml2' 'perl-xml-parser')
source=("http://plugin.org.uk/releases/$pkgver/$_pkgbasename-$pkgver.tar.gz"
        'mbeq_crash_fix.patch')
md5sums=('2fbdccef2462ea553901acd429fa3573'
         'a60422c8dea95bee6f9adcdc70dff7e0')

prepare() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  # Arch64 fix;
  # -fPIC seems to be the only option
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CFLAGS"

  # fix Firefox crash on x64 when
  # plugin is in use by ALSA;
  # see https://bugs.archlinux.org/task/24579
  patch -Np1 -i "$srcdir/mbeq_crash_fix.patch"
}

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr
  #sed -i 's|^plugindir = /usr/lib/ladspa$|plugindir = /usr/lib32/ladspa|' Makefile
  #sed -i 's|metadata||' Makefile
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  make DESTDIR="$pkgdir/" install

  cd "$pkgdir"
  rm -rf usr/share
  mv usr/lib usr/lib32
}

# vim:set ts=2 sw=2 et:
