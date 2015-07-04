# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: 6D666EC8

pkgname=rtl-sdr-git
pkgrel=1
pkgver=20130801
pkgdesc="Tuner for DVB-T sticks based on the Realtek RTL2832U, which can be used as a cheap SDR, since the chip allows transferring the raw I/Q samples to the host."
arch=('i686' 'x86_64')
url="http://sdr.osmocom.org/trac/wiki/rtl-sdr"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=('rtl-sdr')

_gitroot="git://git.osmocom.org/rtl-sdr.git"
_gitname="rtl-sdr"

pkgver() {
    date +%Y%m%d
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DDETACH_KERNEL_DRIVER=ON -Wno-dev ../
  make
}

package() {
  cd "$srcdir/$_gitname-build/build/"
  make DESTDIR=${pkgdir} install
  install -D -m644 $srcdir/$_gitname-build/rtl-sdr.rules $pkgdir/usr/lib/udev/rules.d/10-rtl-sdr.rules
}

# vim:set ts=2 sw=2 et:
