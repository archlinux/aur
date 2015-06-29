# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Eric Bélanger <eric@archlinux.org> ([core] package)
# Maintainer: Thomas Bächler <thomas@archlinux.org> ([core] package)

pkgbase=lvm2-git
pkgname=('lvm2-git' 'device-mapper-git')
pkgver=2.02.120.r33.g43224f2
pkgrel=1
arch=('i686' 'x86_64')
url="http://sourceware.org/lvm2/"
license=('GPL2' 'LGPL2.1')
makedepends=('git' 'systemd' 'thin-provisioning-tools')
groups=('base')
validpgpkeys=('88437EF5C077BD113D3B7224228191C1567E2C17')
source=('git://git.fedorahosted.org/git/lvm2.git'
        lvm2_install
        lvm2_hook
        sd-lvm2_install
        11-dm-initramfs.rules
        lvm2-make-sockets-static.patch)
sha1sums=('SKIP'
          '40ef991650555b904e73bcc3f344d736722e27ca'
          'ff0fdf0a3005a41acd4b36865056109effc3474b'
          '86c18852409dc03f38bdd734ac3e7b54bed9c4ce'
          'f6a554eea9557c3c236df2943bb6e7e723945c41'
          'b084512af42f2e16cdccd8b7ee4de27b574d1f94')

pkgver() {
	cd lvm2/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
  cd lvm2/
  # enable lvmetad
  sed -i 's|use_lvmetad = 0|use_lvmetad = 1|' conf/example.conf.in
  # make systemd sockets static
  patch -p1 -i "${srcdir}/lvm2-make-sockets-static.patch"
}

build() {
  CONFIGUREOPTS="--prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
      --with-udev-prefix=/usr --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --with-default-pid-dir=/run --with-default-dm-run-dir=/run --with-default-run-dir=/run/lvm \
      --enable-pkgconfig --enable-readline --enable-dmeventd --enable-cmdlib --enable-applib \
      --enable-udev_sync --enable-udev_rules --with-default-locking-dir=/run/lock/lvm \
      --enable-lvmetad --with-thin=internal --with-cache=internal"

  cp -a lvm2 lvm2-initramfs

  cd lvm2

  ./configure $CONFIGUREOPTS --enable-udev-systemd-background-jobs
  make

  # Build legacy udev rule for initramfs
  cd ../lvm2-initramfs
  ./configure $CONFIGUREOPTS --enable-udev-systemd-background-jobs=no
  cd udev
  make 69-dm-lvm-metad.rules  
}

package_device-mapper-git() {
  pkgdesc="Device mapper userspace library and tools - git checkout"
  url="http://sourceware.org/dm/"
  depends=('glibc' 'systemd')
  conflicts=('device-mapper')
  provides=("device-mapper=${pkgver}")

  cd lvm2/
  make DESTDIR="${pkgdir}" install_device-mapper
  # extra udev rule for device-mapper in initramfs
  install -D -m644 "${srcdir}/11-dm-initramfs.rules" "${pkgdir}/usr/lib/initcpio/udev/11-dm-initramfs.rules"
  # Install dmeventd socket and service
  make DESTDIR="${pkgdir}" install_systemd_units
  rm -f "${pkgdir}/usr/lib/systemd/system/"{blk-availability.service,lvm2-*}
  install -d -m755 "${pkgdir}/usr/lib/systemd/system/sockets.target.wants"
  ln -sf ../dm-event.socket "${pkgdir}/usr/lib/systemd/system/sockets.target.wants/dm-event.socket"
}

package_lvm2-git() {
  pkgdesc="Logical Volume Manager 2 utilities - git checkout"
  depends=('bash' "device-mapper-git>=${pkgver}" 'systemd' 'readline' 'thin-provisioning-tools')
  conflicts=('lvm' 'mkinitcpio<0.7' 'lvm2')
  provides=("lvm2=${pkgver}")
  backup=('etc/lvm/lvm.conf')
  options=('!makeflags')
  install=lvm2.install

  cd lvm2/
  make DESTDIR="${pkgdir}" install_lvm2
  # install applib
  make -C liblvm DESTDIR="${pkgdir}" install
  # /etc directories
  install -d "${pkgdir}"/etc/lvm/{archive,backup}
  # mkinitcpio hook
  install -D -m644 "${srcdir}/lvm2_hook" "${pkgdir}/usr/lib/initcpio/hooks/lvm2"
  install -D -m644 "${srcdir}/lvm2_install" "${pkgdir}/usr/lib/initcpio/install/lvm2"
  install -D -m644 "${srcdir}/sd-lvm2_install" "${pkgdir}/usr/lib/initcpio/install/sd-lvm2"
  # extra udev rule for lvmetad in non-systemd initramfs
  install -D -m644 "${srcdir}/lvm2-initramfs/udev/69-dm-lvm-metad.rules" "${pkgdir}/usr/lib/initcpio/udev/69-dm-lvm-metad.rules"
  # systemd support
  make DESTDIR="${pkgdir}" install_systemd_units
  rm -f "${pkgdir}/usr/lib/systemd/system/"dm-*
  install -d -m755 "${pkgdir}/usr/lib/systemd/system/sysinit.target.wants"
  ln -sf ../lvm2-lvmetad.socket "${pkgdir}/usr/lib/systemd/system/sysinit.target.wants/lvm2-lvmetad.socket"
  make DESTDIR="${pkgdir}" install_systemd_generators
}
