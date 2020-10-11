# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgname=mdadm
pkgname=$_pkgname-kernel.org-git
pkgver=4.1.r89.g5f41845
pkgrel=1
pkgdesc="A tool for managing/monitoring Linux md device arrays, also known as Software RAID. Uses the kernel.org git repo as the upstream"
arch=(x86_64)
license=('GPL')
url="https://git.kernel.org/cgit/utils/mdadm"
conflicts=('mdadm' 'mkinitcpio<0.7')
provides=('mdadm')
makedepends=('git')
depends=('glibc')
replaces=('raidtools')
backup=('etc/mdadm.conf')
validpgpkeys=('6A86B80E1D22F21D0B26BA75397D82E0531A9C91') # Jes Sorensen
source=("git+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git"
        'mdadm.conf'
        'mdadm_udev_install')
sha256sums=('SKIP'
            '4ce1e90690282f98e4828e11576fbd61be65e97a2cdae6c7eac7035ea5ee53e5'
            '170b0e5d548416c0adb9df4e6941bea6bc33d843419c997e45ecaf9e36a58f38')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed "s/^$_pkgname\.//"
}

build() {
  cd "$_pkgname"

  make CXFLAGS="$CFLAGS" BINDIR=/usr/bin UDEVDIR=/usr/lib/udev
}

package() {
  cd "$_pkgname"

  make INSTALL=/usr/bin/install BINDIR=/usr/bin DESTDIR="$pkgdir" UDEVDIR=/usr/lib/udev install
  make SYSTEMD_DIR="$pkgdir"/usr/lib/systemd/system install-systemd
  install -D -m644 ../mdadm.conf "$pkgdir"/etc/mdadm.conf
  install -D -m644 ../mdadm_udev_install "$pkgdir"/usr/lib/initcpio/install/mdadm_udev
  ln -s /usr/lib/initcpio/install/mdadm_udev "$pkgdir"/usr/lib/initcpio/install/mdadm
}
