# Maintainer: Nicola Fontana <ntd@entidi.it>

pkgname=('etherlab-ethercat' 'etherlab-ethercat-tools')
pkgver=1.6.1
pkgrel=1
arch=('i686' 'x86_64')
url='https://etherlab.org'
license=('GPL2')
makedepends=('linux-headers')
source=("ethercat-$pkgver.tar.bz2::https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "99-EtherCAT.rules")
sha512sums=('2a4970bc79a029dd3effe6d086308aa9691d37a3c6466d6b6f5fe316c603f778941002e417f201afcdb0174fe8fe218a79c6a4e8a485d55daf43de2c3a576005'
            'b3baca5c546af8d57fe59e30d3acd63310a128fc938436b4a151e12fe2fde75029cf0f47b0ac2edc676e762a4cf7ac308b8229594a5d2c8301a02c0e8f623569')


build() {
  cd "ethercat-$pkgver"
  # Only include the generic driver
  # TODO:
  # - whenever 9ee6693fb3ff is merged, add `--disable-initd`
  ./configure \
    --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib --sysconfdir=/etc \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-kernel --enable-generic \
    --enable-tool --enable-userlib
  make all modules
}

check() {
  cd "ethercat-$pkgver"
  make check
}

package_etherlab-ethercat() {
  pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
  depends=('etherlab-ethercat-tools')
  install='etherlab-ethercat.install'

  install -Dt "$pkgdir/etc/udev/rules.d/" -m0644 99-EtherCAT.rules

  cd "ethercat-$pkgver"
  # By default kernel modules are installed in `/lib`
  # but archlinux expects them in `/usr/lib`
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install
  rm -f "$pkgdir"/usr/lib/modules/*/modules.*
}

package_etherlab-ethercat-tools() {
  pkgdesc="Tools for IgH EtherCAT(R) Master component"

  cd "ethercat-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dt "$pkgdir/etc/systemd/system/" -m644 script/ethercat.service
}
