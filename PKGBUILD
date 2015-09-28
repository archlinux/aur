# Maintainer: ajs124 < aur at ajs124 dot de>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-git
_gitname=qemu
pkgname=('qemu-git'
         'qemu-arch-extra-git'
         'qemu-block-iscsi-git'
         'qemu-block-rbd-git'
         'qemu-block-gluster-git'
         'qemu-guest-agent-git')
pkgver=2.5.r41275.g9e07142
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url='http://wiki.qemu.org/'
makedepends=('pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2'
             'gnutls' 'bluez-libs' 'vde2' 'util-linux' 'curl' 'libsasl'
             'libgl' 'libpulse' 'libcap-ng' 'libaio' 'libseccomp'
             'libiscsi' 'python2'
             'usbredir' 'ceph' 'glusterfs' 'libssh2' 'lzo' 'snappy'
             'dtc' 'libepoxy' 'git' 'texi2html' 'perl' 'numactl')
source=(git://git.qemu.org/qemu.git
        qemu.sysusers
        qemu-ga.service
        65-kvm.rules
        qemu.install)
sha256sums=('SKIP'
            'dd43e2ef062b071a0b9d0d5ea54737f41600ca8a84a8aefbebb1ff09f978acfb'
            '0b4f3283973bb3bc876735f051d8eaab68f0065502a3a5012141fad193538ea1'
            '60dcde5002c7c0b983952746e6fb2cf06d6c5b425d64f340f819356e561e7fc7'
            '0df69a77645c9a05f98635773666b6212084525d7801ef8382242b06baebe5aa')

_extra_arches=(aarch64 alpha arm armeb cris lm32 m68k microblaze microblazeel mips
mips64 mips64el mipsel mipsn32 mipsn32el or32 ppc ppc64 ppc64abi32 ppc64le s390x
sh4 sh4eb sparc sparc32plus sparc64 moxie ppcemb tricore unicore32 xtensa xtensaeb)
_extra_blob=(QEMU,cgthree.bin QEMU,tcx.bin bamboo.dtb openbios-ppc
openbios-sparc32 openbios-sparc64 palcode-clipper petalogix-ml605.dtb
petalogix-s3adsp1800.dtb ppc_rom.bin s390-ccw.img s390-zipl.rom slof.bin
spapr-rtas.bin u-boot.e500)

pkgver() {
	cd "${srcdir}/$_gitname"
	echo "2.5.r$(git rev-list --count master).g$(git log -1 --format="%h")"
}

build() {
  cd $_gitname
  # qemu vs. make 4 == bad
  export ARFLAGS="rv"
  # http://permalink.gmane.org/gmane.comp.emulators.qemu/238740
  export CFLAGS+=' -fPIC'
  # gtk gui breaks keymappings at the moment
  ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list='pa alsa sdl' \
              --python=/usr/bin/python2 --smbd=/usr/bin/smbd \
              --enable-docs --libexecdir=/usr/lib/qemu \
              --disable-gtk --enable-linux-aio --enable-seccomp \
              --localstatedir=/var \
              --enable-tpm \
              --enable-modules --enable-{rbd,glusterfs,libiscsi,curl}
  make V=99
}

package_qemu-git() {
  pkgdesc='A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation. Git version.'
  depends=('pixman' 'libjpeg' 'libpng' 'sdl' 'libgl'
           'gnutls' 'bluez-libs'
           'usbredir' 'lzo' 'snappy' 'libpulse' 
           'dtc' 'numactl' 'libnfs' 'libepoxy')
  optdepends=('ovmf: Tianocore UEFI firmware for qemu'
              'samba: SMB/CIFS server support'
              'qemu-arch-extra-git: extra architectures support'
              'qemu-block-iscsi-git: iSCSI block support'
              'qemu-block-rbd-git: RBD block support'
              'qemu-block-gluster-git: glusterfs block support')
  conflicts=('qemu' 'kvm' 'kvm-git' 'qemu-spice' 'seabios' 'seabios-git')
  provides=('qemu' 'qemu-kvm' 'qemu-spice' 'seabios' 'seabios-git')

  options=(!strip)
  install=qemu.install

  make -C $_gitname DESTDIR="${pkgdir}" libexecdir="/usr/lib/qemu" install

  cd "${pkgdir}"
  # remove conflicting /var/run directory
  rm -r var

  # systemd stuff
  install -D -m644 "${srcdir}/65-kvm.rules" usr/lib/udev/rules.d/65-kvm.rules
  install -D -m644 "${srcdir}/qemu.sysusers" usr/lib/sysusers.d/qemu.conf

  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s usr/lib/qemu/qemu-bridge-helper

  # remove splitted block modules
  rm usr/lib/qemu/block-{iscsi,rbd,gluster}.so

  # remove guest agent
  rm usr/bin/qemu-ga

  # remove extra arch
  for _arch in "${_extra_arches[@]}"; do
    rm -f usr/bin/qemu-${_arch} usr/bin/qemu-system-${_arch}
  done
  for _blob in "${_extra_blob[@]}"; do
    rm usr/share/qemu/${_blob}
  done
}

package_qemu-arch-extra-git() {
  pkgdesc='QEMU with full support for non x86 architectures. Git version'
  depends=('glib2' 'qemu-git')
  conflicts=(qemu-arch-extra)
  provides=(qemu-arch-extra)
  options=(!strip)

  cd $_gitname
  install -dm755 "${pkgdir}"/usr/bin
  for _arch in "${_extra_arches[@]}"; do
    install -m755 ${_arch}-*/qemu-*${_arch} "${pkgdir}"/usr/bin
  done

  cd pc-bios
  for _blob in "${_extra_blob[@]}"; do
    install -Dm644 ${_blob} "${pkgdir}"/usr/share/qemu/${_blob}
  done

  # manually stripping
  find "${pkgdir}"/usr/bin -type f -exec strip {} \;
}

package_qemu-block-iscsi-git() {
  pkgdesc='QEMU iSCSI block module. Git version.'
  depends=('glib2' 'libiscsi')
  conflicts=(qemu-block-iscsi)
  provides=(qemu-block-iscsi)

  install -D $_gitname/block-iscsi.so "${pkgdir}"/usr/lib/qemu/block-iscsi.so
}

package_qemu-block-rbd-git() {
  pkgdesc='QEMU RBD block module. Git version.'
  depends=('glib2' 'ceph')
  conflicts=(qemu-block-rbd)
  provides=(qemu-block-rbd)

  install -D $_gitname/block-rbd.so "${pkgdir}"/usr/lib/qemu/block-rbd.so
}

package_qemu-block-gluster-git() {
  pkgdesc='QEMU GlusterFS block module. Git version.'
  depends=('glib2' 'glusterfs')
  conflicts=(qemu-block-gluster)
  provides=(qemu-block-gluster)

  install -D $_gitname/block-gluster.so "${pkgdir}"/usr/lib/qemu/block-gluster.so
}

package_qemu-guest-agent-git() {
  pkgdesc='QEMU Guest Agent. Git version'
  depends=('glib2')
  conflicts=(qemu-guest-agent)
  provides=(qemu-guest-agent)

  install -D $_gitname/qemu-ga "${pkgdir}"/usr/bin/qemu-ga
  install -D qemu-ga.service "${pkgdir}"/usr/lib/systemd/system/qemu-ga.service
}

# vim:set ts=2 sw=2 et:
