# Original Contributor: Vinzenz Vietzke <vinz@archlinux.us>
# Modified by: Farhan Yousasf <farhany@gmail.com>
# Modified by: c0mmando <c0mmand0_88@yahoo.com.ar>
# Maintainer: beest <gnubeest@gmail.com>

pkgname=atari800
pkgver=3.1.0
pkgrel=1
pkgdesc="An emulator of the Atari 800/800XL/130XE/5200 with various extensions"
arch=('i686' 'x86_64' 'armv6h')
url="http://atari800.sourceforge.net/"
license=('GPL')
depends=('libpng' 'sdl')
optdepends=(
  'xboxdrv: XBox/360gamepad driver - supports a multitude of controllers ,like PS3 USB controller'
  'qtsixa: utility to configure and use sixaxis controller via bluetooth'
  'jstest-gtk: simple GTK2-based joystick tester and calibrator'
)
makedepends=('unzip')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz \
  http://sourceforge.net/projects/atari800/files/ROM/Original%20XL%20ROM/xf25.zip)
install=atari800.install
md5sums=('354f8756a7f33cf5b7a56377d1759e41' \
         '4dc3b6b4313e9596c4d474785a37b94d')

build()
{
  # This emulator has a few linux compatible targets. Edit the target
  # and depends variables if you'd like a different target.
  # Valid choices are: default , android , falcon , javanvm , javanvm-basic , ps2 , windx , x11 
  # see -> ./configure --target --help
  #default=autodetect graphics and sound 
  _target=default
  
  # Pass the reponse to the configure script
  
  cd ${srcdir}/${pkgname}-${pkgver}/src
  ./configure --target=${_target} --prefix=/usr
  make
}

package() 
{
  cd ${srcdir}/${pkgname}-${pkgver}/src
  make DESTDIR=${pkgdir} install

  # Copy the required ROMs and disks to /usr/share/atari800
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/${pkgname}
  for _n in *.ROM *.XFD *.ATR; do
    install -m644 ${_n} ${pkgdir}/usr/share/${pkgname}/
  done
}
