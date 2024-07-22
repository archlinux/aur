# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=cups-browsed
pkgname=$_pkgname-git
pkgver=2.0.0.r5.g14df3a00
pkgrel=1
pkgdesc="A helper daemon to browse the network for remote CUPS queues and IPP network printers"
arch=(x86_64)
url="https://github.com/OpenPrinting/$_pkgname"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libcups-git' 'libppd-git')
makedepends=('git' 'glib2-devel')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/cups/cups-browsed.conf')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always --tags | sed 's|-|.r|;s|-|.|'
}

prepare() {
  cd ${_pkgname}
  sed -i 's|usr/sbin|usr/bin|' daemon/cups-browsed.service
  ./autogen.sh
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --with-rcdir=no
}

build() {
  cd ${_pkgname}
  make
}

#check() {
#  cd ${_pkgname}
#  make check
#}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir/" install
  install -Dm644 daemon/cups-browsed.service -t "${pkgdir}"/usr/lib/systemd/system
  # use cups group from cups pkg FS#56818 (https://bugs.archlinux.org/task/56818)
  chgrp -R 209 "${pkgdir}"/etc/cups
  install -Dm644 "${srcdir}"/$_pkgname/NOTICE "${pkgdir}"/usr/share/licenses/$pkgname/LLVM-exception
}
