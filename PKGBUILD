# Maintainer: Nicola Fontana <ntd@entidi.it>

pkgbase='etherlab-ethercat'
pkgname=("$pkgbase" 'etherlab-ethercat-tools')
pkgver=1.5.2.r232.g34dcf04d
pkgrel=1
arch=('i686' 'x86_64')
url='https://etherlab.org/en/ethercat/'
license=('GPL2')
makedepends=('linux-headers')
source=("$pkgbase::git+https://gitlab.com/etherlab.org/ethercat.git#branch=stable-1.5"
        "99-EtherCAT.rules")
sha512sums=('SKIP'
            'b3baca5c546af8d57fe59e30d3acd63310a128fc938436b4a151e12fe2fde75029cf0f47b0ac2edc676e762a4cf7ac308b8229594a5d2c8301a02c0e8f623569')


pkgver() {
  cd "$pkgbase"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgbase"
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
  cd "$pkgbase"
  make check
}

package_etherlab-ethercat() {
  pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
  depends=('etherlab-ethercat-tools')
  install='etherlab-ethercat.install'

  install -Dt "$pkgdir/etc/udev/rules.d/" -m0644 99-EtherCAT.rules

  cd "$pkgbase"
  # By default kernel modules are installed in `/lib`
  # but archlinux expects them in `/usr/lib`
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install
  rm -f "$pkgdir"/usr/lib/modules/*/modules.*
}

package_etherlab-ethercat-tools() {
  pkgdesc="Tools for IgH EtherCAT(R) Master component"

  cd "$pkgbase"
  make DESTDIR="$pkgdir/" install
  install -Dt "$pkgdir/etc/systemd/system/" -m644 script/ethercat.service
}
