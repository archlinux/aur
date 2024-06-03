# Maintainer: Nicola Fontana <ntd@entidi.it>

pkgbase='etherlab-ethercat'
pkgname=("$pkgbase" 'etherlab-ethercat-tools')
pkgver=1.5.2.r408.g1c7f2b9b
pkgrel=1
arch=('i686' 'x86_64')
url='https://etherlab.org/en/ethercat/'
license=('GPL2')
makedepends=('linux-headers')
source=("$pkgbase::git+https://gitlab.com/etherlab.org/ethercat.git#branch=stable-1.6"
        "0001-Remove-dev_base_lock-for-linux-6.9.0.patch"
        "99-EtherCAT.rules")
sha512sums=('SKIP'
            'b8800df5e1bf33ffbec5f8001f54bfc5f684abad1fbea080904cd4d9e3e268b9e12efbde3c03c92f413900374df2233fa98aeb1fa01b75d4c12127d4e092a4a1'
            'b3baca5c546af8d57fe59e30d3acd63310a128fc938436b4a151e12fe2fde75029cf0f47b0ac2edc676e762a4cf7ac308b8229594a5d2c8301a02c0e8f623569')


prepare() {
  cd "$pkgbase"
  patch --forward --strip=1 --input=../0001-Remove-dev_base_lock-for-linux-6.9.0.patch
}

pkgver() {
  cd "$pkgbase"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgbase"
  ./bootstrap
  # Only build with the generic driver
  # TODO:
  # - whenever 16516c3a8eac is merged, remove `--disable-8139too`
  # - whenever 9ee6693fb3ff is merged, add `--disable-initd`
  ./configure \
    --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib --sysconfdir=/etc \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
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
