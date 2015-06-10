# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=avrdude-osuisp2-svn
pkgver=2
pkgrel=2
pkgdesc="Download/upload/manipulate the ROM and EEPROM contents of AVR microcontrollers (with OSU-ISP.2 patch)"
arch=('i686' 'x86_64')
url='http://beaversource.oregonstate.edu/projects/osuisp2/'
license=('GPL')
makedepends=('subversion')
depends=('libusb-compat' 'readline')
conflicts=('avrdude')

_svntrunk='https://code.oregonstate.edu/svn/osuisp2/avrdude/'
_svnmod='avrdude'

build() {

  cd "$srcdir"
  msg "Connecting to SVN server..."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  chmod +x bootstrap configure

  ./bootstrap
  ./configure --mandir=/usr/share/man \
              --prefix=/usr \
              --sysconfdir=/etc

  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR=${pkgdir} install
}
