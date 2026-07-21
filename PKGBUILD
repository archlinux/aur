# Maintainer: Nicola Fontana <ntd@entidi.it>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
pkgbase='etherlab-ethercat'
pkgname=('etherlab-ethercat' 'etherlab-ethercat-tools')
pkgver=1.6.10
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('linux-headers')
url='https://etherlab.org'
source=("ethercat-$pkgver.tar.bz2::https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "0001-Fix-227-support-C-20.patch"
        "ethercat.sysusers"
        "ethercat.udev")
sha512sums=('308fe72513318afd7fab9a08d8df36df6fa18016565ad9c150b38a0293549db5aea1f26d4ffd28799f37d01af90ad4435a7d3bed8865bc9686495f0406c883f0'
            'b14fa21e4dabd659bc16291704268e4894436ba0bbdfe58a243b327b773153111d0f73b82558f75326eecdf00dd9885c314af183d9085b5cb8c6da79bf20fcce'
            'b029d47d10850569f180801fdc6bb2209dc9014649615123fe677416586df1c5a4f0901bcbd2da73b0e48ce752fe2a732272afdbf2445edf9ed4740be1ada7d8'
            '3e1fa42373476780109af67ff14ca0b3275a3499bd2bf97e5284e05cae911a38ce8eec3fb1e46c42862f3f7b7741514afeaea26f1a6c12d1ed89d20f6ad09ed4')

prepare() {
  cd "ethercat-$pkgver"
  patch -Np1 -i ../0001-Fix-227-support-C-20.patch
}

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
  depends=('bash' 'gcc-libs' 'glibc')

  install -Dm 0644 ethercat.udev "$pkgdir/usr/lib/udev/rules.d/99-EtherCAT.rules"
  install -Dm 0644 ethercat.sysusers "$pkgdir/usr/lib/sysusers.d/ethercat.conf"

  cd "ethercat-$pkgver"
  make DESTDIR="$pkgdir/" install
}
