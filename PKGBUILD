# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

# noudev changes:
# - disable eudev dependency
# - disable udev in _CONFIGUREOPTS
# - explicitly disable all udev options when building lvm2
# - enable options only for udev rules
# - add 'provides' and 'conflicts' fields for packages
# - lvm2_hook: add vgchange command

pkgbase=lvm2-noudev
pkgname=('lvm2-noudev' 'device-mapper-noudev')
pkgver=2.02.184
pkgrel=4
arch=('x86_64')
url='https://sourceware.org/lvm2/'
license=('GPL2' 'LGPL2.1')
makedepends=('git' 'thin-provisioning-tools')
groups=('base')
validpgpkeys=('88437EF5C077BD113D3B7224228191C1567E2C17'  # Alasdair G Kergon <agk@redhat.com>
              'D501A478440AE2FD130A1BE8B9112431E509039F') # Marian Csontos <marian.csontos@gmail.com>
source=("git+https://sourceware.org/git/lvm2.git#tag=v${pkgver//./_}?signed"
        'lvm2_install'
        'lvm2_hook'
        '11-dm-initramfs.rules')
sha256sums=('SKIP'
            'cc51940a8437f3c8339bb9cec7e929b2cc0852ffc8a0b2463e6f67ca2b9950f6'
            '2ecaabfa13dd09d0e3d7b3439147fbd93e3c87a418b676fa55647f9319ada667'
            'e10f24b57582d6e2da71f7c80732a62e0ee2e3b867fe84591ccdb53e80fa92e0')

build() {
  local _CONFIGUREOPTS=(
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --localstatedir=/var
    --enable-applib
    --enable-cmdlib
    --enable-dmeventd
    --enable-lvmetad
    --enable-lvmpolld
    --enable-pkgconfig
    --enable-readline
    --enable-use-lvmetad
    --with-cache=internal
    --with-default-dm-run-dir=/run
    --with-default-locking-dir=/run/lock/lvm
    --with-default-pid-dir=/run
    --with-default-run-dir=/run/lvm
    --with-systemdsystemunitdir=no
    --with-thin=internal
    --with-udev-prefix=/usr
  )

  cp -a lvm2/ lvm2-initramfs/

  cd lvm2/

  ./configure "${_CONFIGUREOPTS[@]}" --enable-udev-systemd-background-jobs=no --enable-udev_rules=no --enable-udev_sync=no --enable-udev-rule-exec-detection=no
  make

  # Build legacy udev rule for initramfs
  cd ../lvm2-initramfs
  ./configure "${_CONFIGUREOPTS[@]}" --enable-udev-systemd-background-jobs=no --enable-udev_rules --enable-udev_sync
  cd udev
  make 69-dm-lvm-metad.rules
}

package_device-mapper-noudev() {
  pkgdesc="Device mapper userspace library and tools"
  url="http://sourceware.org/dm/"
  depends=('glibc')
  conflicts=('device-mapper')
  provides=("device-mapper=$pkgver")

  cd lvm2/

  make DESTDIR="${pkgdir}" install_device-mapper
  # extra udev rule for device-mapper in initramfs
  install -D -m644 "${srcdir}/11-dm-initramfs.rules" "${pkgdir}/usr/lib/initcpio/udev/11-dm-initramfs.rules"
}

package_lvm2-noudev() {
  pkgdesc="Logical Volume Manager 2 utilities"
  depends=('bash' "device-mapper>=${pkgver}" 'libeudev' 'libutil-linux' 'readline' 'thin-provisioning-tools')
  conflicts=('lvm' 'mkinitcpio<0.7' 'lvm2')
  provides=('lvm2')
  backup=('etc/lvm/lvm.conf'
    'etc/lvm/lvmlocal.conf')
  options=('!makeflags')

  cd lvm2/

  make DESTDIR="${pkgdir}" install_lvm2
  # install applib
  make -C liblvm DESTDIR="${pkgdir}" install
  # /etc directories
  install -d "${pkgdir}"/etc/lvm/{archive,backup}
  # mkinitcpio hook
  install -D -m644 "${srcdir}/lvm2_hook" "${pkgdir}/usr/lib/initcpio/hooks/lvm2"
  install -D -m644 "${srcdir}/lvm2_install" "${pkgdir}/usr/lib/initcpio/install/lvm2"
  # extra udev rule for lvmetad in non-systemd initramfs
  install -D -m644 "${srcdir}/lvm2-initramfs/udev/69-dm-lvm-metad.rules" "${pkgdir}/usr/lib/initcpio/udev/69-dm-lvm-metad.rules"
}
