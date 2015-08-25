# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=hungry-sniffer
pkgname=${_pkgname}-git
pkgver=v1.0.r19.ga00c891
pkgrel=1
pkgdesc="Modular Sniffer with Plugins for new protocols"
arch=(i686 x86_64)
url="https://github.com/arthurzam/${_pkgname}"
license=('GPL2')
depends=('libpcap' 'jsoncpp' 'qt5-base' 'libcap' 'python')
source=("${_pkgname}::git+git://github.com/arthurzam/${_pkgname}.git")
sha1sums=('SKIP')
install=hungry-sniffer.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
build() {
  cd "${srcdir}/${_pkgname}"
  qmake-qt5 -spec linux-g++ -o Makefile hungry-sniffer.pro
  make
}
 
package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm 755 protocols/libhungry-sniffer-protocols.so "$pkgdir"/usr/share/hungry-sniffer/plugins/01_base.so
  install -Dm 755 hungry-sniffer-options/libhungry-sniffer-options.so "$pkgdir"/usr/share/hungry-sniffer/plugins/50_options.so

  chgrp 155 "${pkgdir}/usr/bin/hungry-sniffer"
  chmod 754 "${pkgdir}/usr/bin/hungry-sniffer"
}

