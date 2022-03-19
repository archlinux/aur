# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=mdadm-patched-intel-rst
pkgver=4.2
pkgrel=1
pkgdesc='A tool for managing/monitoring Linux md device arrays, also known as Software RAID (patched to work properly with Intel RST FakeRAID)'
arch=('x86_64')
provides=('mdadm')
conflicts=('mdadm')
license=('GPL')
url='https://git.kernel.org/pub/scm/utils/mdadm'
makedepends=('git' 'patch')
depends=('glibc' 'systemd')
replaces=('raidtools')
backup=('etc/mdadm.conf')
validpgpkeys=('6A86B80E1D22F21D0B26BA75397D82E0531A9C91') # Jes Sorensen
source=("git+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git#tag=mdadm-${pkgver}?signed"
        'disable-werror.patch'
        'assembly-rules-imsm.patch'
		'mdadm.conf'
        'mdadm_udev_install')
sha256sums=('SKIP'
            '85c98b8fe880bdd365fc0e400af10c2e5d0c439d338e055f66c16162f9282846'
            '3d882f33b8c56cf7d5c8882a332104b3a228ee42a0ba005f9c9905c2c2ca23a2'
            '4ce1e90690282f98e4828e11576fbd61be65e97a2cdae6c7eac7035ea5ee53e5'
            'b6782029bdae2d7f87ea0e332bb90f72a7792e933580e37602e81e2f1bb82a9c')
prepare() {
  cd mdadm
  patch -Np0 -i ${srcdir}/disable-werror.patch
  patch -Np0 -i ${srcdir}/assembly-rules-imsm.patch
}

build() {
  cd mdadm

  make CXFLAGS="$CFLAGS" BINDIR=/usr/bin UDEVDIR=/usr/lib/udev 
}

package() {
  cd mdadm

  make INSTALL=/usr/bin/install BINDIR=/usr/bin DESTDIR="$pkgdir" UDEVDIR=/usr/lib/udev install
  make SYSTEMD_DIR="$pkgdir"/usr/lib/systemd/system install-systemd
  install -D -m644 ../mdadm.conf "$pkgdir"/etc/mdadm.conf
  install -D -m644 ../mdadm_udev_install "$pkgdir"/usr/lib/initcpio/install/mdadm_udev
  ln -s mdadm_udev "$pkgdir"/usr/lib/initcpio/install/mdadm
}
