# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=irmplircd
pkgver=20180103
_gitver=d7994146cd1950ff2673edf382d2148b37f78a18
pkgrel=1
pkgdesc="zeroconf LIRC daemon that reads IRMP events from the USB IR Remote Receiver"
url="https://github.com/realglotzi/irmplircd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs')
makedepends=('git')
backup=("etc/irmp_stm32.map")
install=irmplircd.install
source=("git+https://github.com/realglotzi/irmplircd.git#commit=$_gitver"
        'irmplircd.tmpfiles'
        'irmplircd.service'
        '80-irmp.rules')
md5sums=('SKIP'
         'febf25c154a7d36f01159e84f26c2d9a'
         'cfa3ab62473580d8f12aa1eea751ef19'
         'b0d56a3b2ff1fdbd387ce4dd562ddc7f')

pkgver() {
  cd "${srcdir}/irmplircd"
  git log -1 --pretty=format:%ad --date=short | sed 's/-//g'
}

build() {
  cd "${srcdir}/irmplircd"
  CFLAGS+=" -Ic_hashmap"
  make
}

package() {
  cd "${srcdir}/irmplircd"
  make BINDIR="${pkgdir}/usr/bin" SHAREDIR="${pkgdir}/usr/share" install

  install -Dm644 "${srcdir}/irmplircd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/irmplircd.conf"
  install -Dm644 "${srcdir}/80-irmp.rules" "$pkgdir/usr/lib/udev/rules.d/80-irmp.rules"
  install -Dm644 "${srcdir}/irmplircd.service" "$pkgdir/usr/lib/systemd/system/irmplircd.service"

  mkdir -p "${pkgdir}/etc"
  echo -n > "${pkgdir}/etc/irmp_stm32.map"
}
