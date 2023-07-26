# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: ValdikSS <iam@valdikss.org.ru>

pkgname=libusb0
pkgver=0.1.12
pkgrel=7
pkgdesc="Library to enable user space application programs to communicate with USB devices. 0.x branch. Debian's binary."
arch=('i686' 'x86_64')
url="https://libusb.info/"
license=('LGPL')
depends=('sh')
provides=('libusb-compat')
#replaces=('libusb-compat')
conflicts=('libusb-compat')
_debianver_="0.1.12-32"
_debianver="0.1-4_$_debianver_"
source_i686=("https://ftp.debian.org/debian/pool/main/libu/libusb/libusb-${_debianver}_i386.deb"
             "https://ftp.debian.org/debian/pool/main/libu/libusb/libusb-dev_${_debianver_}_i386.deb")
sha256sums_i686=('005227e6f783eb3cd422e58c3a49e4578c8ba90641dee6ad24f9aa7060a89276'
              '4a5b7a2f05f1bb9cc0ac608304ec1b321931dd1bdbf9252e91c9beda8af7ed94')
source_x86_64=("https://ftp.debian.org/debian/pool/main/libu/libusb/libusb-${_debianver}_amd64.deb"
              "https://ftp.debian.org/debian/pool/main/libu/libusb/libusb-dev_${_debianver_}_amd64.deb")
sha256sums_x86_64=('ecc251e8af96904290669233988a91e195670bb432396c408e01489c9efff993'
                '5974e30179cd079c1763b29fd97a8cc859ae5ff888f298c15082e2adb276f45e')

noextract=("${source[@]%%::*}")

prepare() {
  ar x ${srcdir}/libusb-dev_${_debianver_}*.deb
  mv ${srcdir}/data.tar.xz ${srcdir}/data-dev.tar.xz
  ar x libusb-${_debianver}*.deb
}

package() {
  tar axvf ${srcdir}/data.tar.xz -C ${pkgdir}/
  tar axvf ${srcdir}/data-dev.tar.xz -C ${pkgdir}/
  mkdir -p ${pkgdir}/usr/lib
  mv ${pkgdir}/usr/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib || true
  mv ${pkgdir}/usr/lib/i386-linux-gnu/* ${pkgdir}/usr/lib || true
  mv ${pkgdir}/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib || true
  mv ${pkgdir}/lib/i386-linux-gnu/* ${pkgdir}/usr/lib || true
  rm ${pkgdir}/usr/lib/libusb.so
  ln -s libusb-0.1.so.4 ${pkgdir}/usr/lib/libusb.so
  rm -r ${pkgdir}/lib/i386-linux-gnu ${pkgdir}/lib/x86_64-linux-gnu \
        ${pkgdir}/usr/lib/i386-linux-gnu ${pkgdir}/usr/lib/x86_64-linux-gnu || true
  rm -rf ${pkgdir}/lib/
}
