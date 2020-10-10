# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=mdadm
pkgver=4.1
pkgrel=2
pkgdesc="A tool for managing/monitoring Linux md device arrays, also known as Software RAID"
arch=(x86_64)
license=('GPL')
url="https://git.kernel.org/cgit/utils/mdadm"
conflicts=('mkinitcpio<0.7')
makedepends=('git')
depends=('glibc')
replaces=('raidtools')
backup=('etc/mdadm.conf')
validpgpkeys=('6A86B80E1D22F21D0B26BA75397D82E0531A9C91') # Jes Sorensen
source=("git+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git#tag=${pkgname}-${pkgver}?signed"
        'mdadm.conf'
        'mdadm_udev_install')
sha256sums=('SKIP'
            '4ce1e90690282f98e4828e11576fbd61be65e97a2cdae6c7eac7035ea5ee53e5'
            '170b0e5d548416c0adb9df4e6941bea6bc33d843419c997e45ecaf9e36a58f38')

prepare() {
  cd mdadm

  git cherry-pick -n \
    a4f7290c20c2ff78328c9db0b18029165cfb05b2 \
    7039d1f8200b9599b23db5953934fdb43b0442e0 \
    486720e0c2418e7e2e0a16221f7c42a308622254 \
    9f4218274cd4a1e1f356a1617f9a1d09960cf255 \
    761e3bd9f5e3aafa95ad3ae50a637dc67c8774f0
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
  ln -s /usr/lib/initcpio/install/mdadm_udev "$pkgdir"/usr/lib/initcpio/install/mdadm
}
