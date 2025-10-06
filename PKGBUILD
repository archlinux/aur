# Maintainer: Nicola Fontana <ntd@entidi.it>
pkgbase='etherlab-ethercat'
pkgname=('etherlab-ethercat' 'etherlab-ethercat-tools')
pkgver=1.6.8
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('linux-headers')
url='https://etherlab.org'
source=("ethercat-$pkgver.tar.bz2::https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "ethercat.sysusers"
        "ethercat.udev")
sha512sums=('3da61f7a2d50f01bc2907877cbd046861ad9fb3be0b38f0e8aa5ecbc3dece2c2802b5d56df8da5231467d3c80863fba855d56c4a1ad984442ddc611c1d40beb5'
            'b029d47d10850569f180801fdc6bb2209dc9014649615123fe677416586df1c5a4f0901bcbd2da73b0e48ce752fe2a732272afdbf2445edf9ed4740be1ada7d8'
            '3e1fa42373476780109af67ff14ca0b3275a3499bd2bf97e5284e05cae911a38ce8eec3fb1e46c42862f3f7b7741514afeaea26f1a6c12d1ed89d20f6ad09ed4')

build() {
  cd "ethercat-$pkgver"

  # By default, enable only `ec_generic` and `ec_ccat` modules
  ./configure \
    --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib --sysconfdir=/etc \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-kernel --enable-generic --enable-ccat \
    --enable-tool --enable-userlib --disable-initd
  make all modules
}

check() {
  cd "ethercat-$pkgver"
  make check
}

package_etherlab-ethercat() {
  pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
  license=('GPL-2.0-only')
  # XXX: I don't think 'linux-headers' is a runtime dependency
  depends=('linux' 'etherlab-ethercat-tools')

  cd "ethercat-$pkgver"
  # 1. Skip `depmod`: it will be executed automatically
  #    by pacman hooks on the target OS
  # 2. By default kernel modules are installed in `/lib`
  #    but archlinux expects them in `/usr/lib`
  make cmd_depmod=: INSTALL_MOD_PATH="$pkgdir/usr" modules_install
}

package_etherlab-ethercat-tools() {
  pkgdesc="Tools for IgH EtherCAT(R) Master component"
  license=('LGPL-2.1-only')
  backup=('etc/ethercat.conf')

  install -Dm 0644 ethercat.udev "$pkgdir/usr/lib/udev/rules.d/99-EtherCAT.rules"
  install -Dm 0644 ethercat.sysusers "$pkgdir/usr/lib/sysusers.d/ethercat.conf"

  cd "ethercat-$pkgver"
  make DESTDIR="$pkgdir/" install
}
