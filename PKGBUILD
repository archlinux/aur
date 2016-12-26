# Maintainer: ValdikSS <iam@valdikss.org.ru>

pkgname=lib32-libusb0
pkgver=0.1.12
pkgrel=9
pkgdesc="Library to enable user space application programs to communicate with USB devices. 0.x branch. Debian's binary."
arch=('x86_64')
url="http://libusb.sourceforge.net/"
license=('LGPL')
depends=('sh')
provides=('lib32-libusb-compat')
#replaces=('lib32-libusb-compat')
conflicts=('lib32-libusb-compat')
_debianver_="0.1.12-25"
_debianver="0.1-4_$_debianver_"
source_x86_64=("http://ftp.debian.org/debian/pool/main/libu/libusb/libusb-${_debianver}_i386.deb"
              "http://ftp.debian.org/debian/pool/main/libu/libusb/libusb-dev_${_debianver_}_i386.deb")
md5sums_x86_64=('316254e4ae2ff97f520948ffbb4af1ad'
                '9f3e584547a8643a3efd6d3901f846cb')

noextract=("${source[@]%%::*}")

prepare() {
  ar x ${srcdir}/libusb-dev_${_debianver_}*.deb
  mv ${srcdir}/data.tar.xz ${srcdir}/data-dev.tar.xz
  ar x libusb-${_debianver}*.deb
}

package() {
  tar axvf ${srcdir}/data.tar.xz -C ${pkgdir}/
  tar axvf ${srcdir}/data-dev.tar.xz -C ${pkgdir}/
  #mkdir -p ${pkgdir}/usr/lib32
  mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32
  mv ${pkgdir}/usr/lib32/x86_64-linux-gnu/* ${pkgdir}/usr/lib32 || true
  mv ${pkgdir}/usr/lib32/i386-linux-gnu/* ${pkgdir}/usr/lib32 || true
  mv ${pkgdir}/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib32 || true
  mv ${pkgdir}/lib/i386-linux-gnu/* ${pkgdir}/usr/lib32 || true
  rm ${pkgdir}/usr/lib32/libusb.so
  ln -s libusb-0.1.so.4 ${pkgdir}/usr/lib32/libusb.so
  rm -r ${pkgdir}/lib/i386-linux-gnu ${pkgdir}/lib/x86_64-linux-gnu \
        ${pkgdir}/usr/lib32/i386-linux-gnu ${pkgdir}/usr/lib32/x86_64-linux-gnu || true
  rm -rf ${pkgdir}/lib/
  rm -rf ${pkgdir}/usr/bin/libusb-config ${pkgdir}/usr/include/usb.h
}
