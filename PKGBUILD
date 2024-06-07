# Maintainer: Nicola Fontana <ntd@entidi.it>

pkgname=('etherlab-ethercat' 'etherlab-ethercat-tools')
pkgver=1.6.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://etherlab.org'
license=('GPL2')
makedepends=('linux-headers')
source=("https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "99-EtherCAT.rules")
sha512sums=('bf249c5f4fe582637ba75251dc97d224d4d669e4c6fd6593336792c7b7cbfd1378ece052aa46ca501a4a7916c785a8a454a70148266f94eaa7b5d518f36df1d3'
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
