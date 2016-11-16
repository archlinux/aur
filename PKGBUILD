# Maintainer: Markus Meissner <coder@safemailbox.de>

pkgname=asus-fan-dkms-git 
pkgver=v0.9.1.r29.g472c42d
pkgrel=1
_realname=asus-fan
_modname=asus_fan
pkgdesc="Kernel module allowing to control (both) fan inside various ASUS laptops"
arch=('i686' 'x86_64')
url="http://github.com/daringer/asus-fan"
md5sums=('SKIP')
license=('GPL')
depends=('dkms')
install=asus-fan-dkms-git.install
conflicts=('asus-fan-dkms')
makedepends=('git')

source=("${pkgname}::git+https://github.com/daringer/asus-fan.git")

pkgver() {
	  cd "${srcdir}/${pkgname}"
	  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    }

package() {
  cd "${srcdir}/${pkgname}"

  #mkdir -p ${pkgdir}/usr/sbin 
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install misc/asus-fan-create-symlinks.sh ${pkgdir}/usr/bin/asus-fan-create-symlinks.sh
  install misc/systemd/asus-fan.service ${pkgdir}/usr/lib/systemd/system/asus-fan.service

  echo "Installing asus-fan.service for systemd"

  ksrcdir="/usr/src/${_modname}-git"
  mkdir -p ${pkgdir}${ksrcdir}
  make -f Makefile.dkms DESTDIR=${pkgdir}${ksrcdir} src_install 
}

