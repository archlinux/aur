# Maintainer: "Jameson Pugh <imntreal@gmail.com>"

pkgname=firmware-tools
pkgver=2.1.14
pkgrel=3
pkgdesc="Scripts and tools to manage firmware and BIOS updates"
arch=('any')
url="http://linux.dell.com/repo/firmware/"
license=('GPL' 'OSL')
depends=('python2' 'python2-libgnome')
makedepends=('make' 'gawk')
source=("http://linux.dell.com/libsmbios/download/firmware-tools/firmware-tools-${pkgver}/firmware-tools-${pkgver}.tar.bz2")
sha256sums=('ae3bb3df48ad17e3169e5559aed1e9b09e378e024396236c7e4f2acf76c773b2')

#grep '\..-' will work with any locale
PYTHON3VER=$(pacman -Qi python | grep '\..-' | sed -e 's/^.*: //' -e 's/-.*$//g' | awk -F '.' '{print $1"."$2}')
PYTHON2VER=$(pacman -Qi python2 | grep '\..-' | sed -e 's/^.*: //' -e 's/-.*$//g' | awk -F '.' '{print $1"."$2}')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  #UGLY HACK - Python 3 to Python 2
  #sed -i -e 's/^PYTHON.=.*$/PYTHON = \/usr\/bin\/python2/' -e "s/${PYTHON3VER}/${PYTHON2VER}/g" Makefile
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  for i in ${pkgdir}/usr/bin/*
  do
    sed -i 's/^.*\/usr\/bin\/python.*$/#!\/usr\/bin\/python2/' $i
  done
  cd "${pkgdir}/usr/bin"
  ln -s firmwaretool inventory_firmware
  ln -s firmwaretool bootstrap_firmware
  ln -s firmwaretool update_firmware
}
