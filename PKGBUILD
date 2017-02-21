# Maintainer: ajs124 < aur at ajs124 dot de>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=('qemu-minimal-git')
_gitname=qemu
pkgname=('qemu-minimal-git')
pkgver=2.8.0.r51295.ad584d37f2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url='http://wiki.qemu.org/'
makedepends=('glib2' 'pixman'
             'gnutls' 'util-linux' 'curl' 'libsasl'
             'libcap-ng' 'libaio' 'libseccomp'
             'python2' 'usbredir' 'lzo'
             'dtc' 'git' 'texi2html' 'perl')
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
petalogix-s3adsp1800.dtb ppc_rom.bin s390-ccw.img slof.bin
spapr-rtas.bin u-boot.e500)

pkgver() {
	cd "${srcdir}/$_gitname"
	echo "$(git describe | sed 's/^v//' | cut -c -5).r$(git rev-list --count master).$(git log -1 --format=%h)"
}

build() {
  cd $_gitname
  # qemu vs. make 4 == bad
  export ARFLAGS="rv"
  # http://permalink.gmane.org/gmane.comp.emulators.qemu/238740
  export CFLAGS+=' -fPIC'
  # gtk gui breaks keymappings at the moment
  ./configure --prefix=/usr --sysconfdir=/etc \
              --python=/usr/bin/python2 --smbd=/usr/bin/smbd \
              --disable-docs --libexecdir=/usr/lib/qemu \
              --disable-gtk --enable-linux-aio --enable-seccomp \
              --localstatedir=/var \
              --enable-tpm --enable-curl \
              --enable-modules --enable-curl --disable-werror \
              --target-list=x86_64-softmmu --disable-libiscsi --disable-bluez --audio-drv-list=alsa,pa
  make V=99
}

package() {
  pkgdesc='A generic and open source processor emulator. This is a stripped-down version for running on a headless server. Contains x86_64 emulator only.'
  depends=('gnutls' 'dtc' 'usbredir' 'lzo')
  optdepends=('ovmf: Tianocore UEFI firmware for qemu'
              'samba: SMB/CIFS server support'
              'qemu-arch-extra-git: extra architectures support'
              'qemu-block-iscsi-git: iSCSI block support'
              'qemu-block-rbd-git: RBD block support'
              'qemu-block-gluster-git: glusterfs block support')
  conflicts=('qemu' 'qemu-git' 'qemu-minimal' 'kvm' 'kvm-git' 'qemu-spice' 'seabios' 'seabios-git')
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
  
  # vim:set ts=2 sw=2 et:
