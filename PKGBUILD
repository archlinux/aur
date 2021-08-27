# Maintainer: Nicola Fontana <ntd@entidi.it>
#
# IgH EtherCAT master does not release tarballs. Instead, it merges
# whatever stable into the `stable-1.5` branch.
# To get the `_count` number, I use `git describe | cut -f2 -d-` in a
# local clone.
_commit=b68abbfb04f4e66e89d6e57af18166bd523cdcec
_count=209
pkgname=('etherlab-ethercat' 'etherlab-ethercat-tools')
pkgver=1.5.r$_count
pkgrel=2
arch=('i686' 'x86_64')
url='https://etherlab.org/en/ethercat/'
license=('GPL2')
makedepends=('linux-headers')
source=("https://gitlab.com/etherlab.org/ethercat/-/archive/$_commit/ethercat-$_commit.tar.bz2"
        "99-EtherCAT.rules")
sha512sums=('88dabc2018329a4da59906c82479fbd1bf63ab15fbc891a8f10c8b9fec0f6e3fda656465f83e3914e8955a1104df5a5be81143d162f84e9cd7df4526771b20d9'
            'b3baca5c546af8d57fe59e30d3acd63310a128fc938436b4a151e12fe2fde75029cf0f47b0ac2edc676e762a4cf7ac308b8229594a5d2c8301a02c0e8f623569')


build() {
  cd "$srcdir/ethercat-$_commit"
  ./bootstrap
  # Only build the generic driver
  ./configure \
    --prefix=/usr --sysconfdir=/etc \
    --sbindir=/usr/bin --libdir=/usr/lib \
    --enable-kernel --enable-generic --disable-8139too \
    --enable-tool --enable-userlib
  make all modules
}

check() {
  cd "$srcdir/ethercat-$_commit"
  make check
}

package_etherlab-ethercat() {
  pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
  depends=('etherlab-ethercat-tools')
  install='etherlab-ethercat.install'

  cd "$srcdir/ethercat-$_commit"
  # By default kernel modules are installed in `/lib`
  # but archlinux expects them in `/usr/lib`
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install
  rm -f "$pkgdir"/usr/lib/modules/*/modules.*
  install -Dt "$pkgdir/etc/udev/rules.d/" -m0644 "$srcdir/99-EtherCAT.rules"
}

package_etherlab-ethercat-tools() {
  pkgdesc="Tools for IgH EtherCAT(R) Master component"

  cd "$srcdir/ethercat-$_commit"
  make DESTDIR="$pkgdir/" install
  install -Dt "$pkgdir/etc/systemd/system/" -m644 script/ethercat.service
}
