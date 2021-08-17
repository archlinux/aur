# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

# noudev changes:
# - disable eudev dependency
# - disable udev in _CONFIGUREOPTS
# - explicitly disable all udev options when building lvm2
# - add 'provides' and 'conflicts' fields for packages

pkgbase=lvm2-noudev
pkgname=('lvm2-noudev' 'device-mapper-noudev')
_tag='91a82455813bebce0949cb681369f370ce3105d5' # git rev-parse v${pkgver//./_}
pkgver=2.03.13
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://sourceware.org/lvm2/'
license=('GPL2' 'LGPL2.1')
makedepends=('git' 'thin-provisioning-tools')
validpgpkeys=('88437EF5C077BD113D3B7224228191C1567E2C17'  # Alasdair G Kergon <agk@redhat.com>
              'D501A478440AE2FD130A1BE8B9112431E509039F') # Marian Csontos <marian.csontos@gmail.com>
source=("git+https://sourceware.org/git/lvm2.git#tag=${_tag}?signed"
        'lvm2_install'
        '11-dm-initramfs.rules')
sha256sums=('SKIP'
            'ed78acdec013bc22df253e51a474d4beab2f9204bbabde34b83d56149bb435d4'
            'e10f24b57582d6e2da71f7c80732a62e0ee2e3b867fe84591ccdb53e80fa92e0')

_backports=(
)

prepare() {
  cd lvm2/

  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git show "${_c}" -- ':(exclude)WHATS_NEW' | git apply
  done
}

build() {
  local _CONFIGUREOPTS=(
    CONFIG_SHELL=/bin/bash
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --localstatedir=/var
    --enable-cmdlib
    --enable-dmeventd
    --enable-lvmpolld
    --enable-pkgconfig
    --enable-readline
    --with-cache=internal
    --with-default-dm-run-dir=/run
    --with-default-locking-dir=/run/lock/lvm
    --with-default-pid-dir=/run
    --with-default-run-dir=/run/lvm
    --with-systemdsystemunitdir=no
    --with-thin=internal
    --with-udev-prefix=/usr
  )

  # build system requires bash:
  # https://www.redhat.com/archives/linux-lvm/2020-January/msg00004.html
  # https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Defining-Variables.html
  export CONFIG_SHELL=/bin/bash

  cp -a lvm2/ lvm2-initramfs/

  cd lvm2/

  ./configure \
    "${_CONFIGUREOPTS[@]}" \
    --enable-udev-systemd-background-jobs=no
  make

  # Build legacy udev rule for initramfs
  cd ../lvm2-initramfs
  ./configure \
    "${_CONFIGUREOPTS[@]}" \
    --enable-udev-systemd-background-jobs=no
  cd udev
  make 69-dm-lvm-metad.rules
}

package_device-mapper-noudev() {
  pkgdesc="Device mapper userspace library and tools"
  url="http://sourceware.org/dm/"
  depends=('glibc')
  conflicts=('device-mapper')
  provides=("device-mapper=$pkgver" 'libdevmapper.so'
    'libdevmapper-event.so')

  cd lvm2/

  make DESTDIR="${pkgdir}" install_device-mapper
  # extra udev rule for device-mapper in initramfs
  install -D -m0644 "${srcdir}/11-dm-initramfs.rules" "${pkgdir}/usr/lib/initcpio/udev/11-dm-initramfs.rules"
}

package_lvm2-noudev() {
  pkgdesc="Logical Volume Manager 2 utilities"
  depends=('bash' "device-mapper>=${pkgver}"
    'util-linux-libs' 'libblkid.so' 'readline' 'libreadline.so'
    'thin-provisioning-tools')
  conflicts=('lvm' 'mkinitcpio<0.7' 'lvm2')
  provides=('lvm2')
  backup=('etc/lvm/lvm.conf'
    'etc/lvm/lvmlocal.conf')
  options=('!makeflags')

  cd lvm2/

  make DESTDIR="${pkgdir}" install_lvm2
  # /etc directories
  install -d "${pkgdir}"/etc/lvm/{archive,backup}
  # mkinitcpio hook
  install -D -m0644 "${srcdir}/lvm2_install" "${pkgdir}/usr/lib/initcpio/install/lvm2"
  # extra udev rule for non-systemd initramfs
  install -D -m0644 "${srcdir}/lvm2-initramfs/udev/69-dm-lvm-metad.rules" "${pkgdir}/usr/lib/initcpio/udev/69-dm-lvm-metad.rules"
}
