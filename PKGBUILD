# $Id: PKGBUILD 246530 2015-09-17 21:02:15Z foutrelis $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>
#pkgbase=qemu
#pkgname=('qemu'
#         'qemu-arch-extra'
#         'qemu-block-iscsi'
#         'qemu-block-rbd'
#         'qemu-block-gluster'
#         'qemu-guest-agent'
#         'libcacard')
pkgname='qemu-minimal'
pkgver=2.4.0
pkgrel=4
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url='http://wiki.qemu.org/'
#makedepends=('pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2'
#             'gnutls' 'bluez-libs' 'vde2' 'util-linux' 'curl' 'libsasl'
#             'libgl' 'libpulse' 'seabios' 'libcap-ng' 'libaio' 'libseccomp'
#             'libiscsi' 'libcacard' 'spice' 'spice-protocol' 'python2'
#             'usbredir' 'ceph' 'glusterfs' 'libssh2' 'lzo' 'snappy')
makedepends=('libjpeg' 'glib2'
             'util-linux' 'curl' 'libsasl'
             'seabios' 'libcap-ng' 'libaio' 'libseccomp'
             'python2'
             'libssh2' 'lzo' 'snappy')
conflicts=('qemu')
source=(http://wiki.qemu.org/download/${pkgname:0:-8}-${pkgver}.tar.bz2
        qemu.sysusers
        qemu-ga.service
        65-kvm.rules)
md5sums=('186ee8194140a484a455f8e3c74589f4'
         '49778d11c28af170c4bebcc648b0ace1'
         '44ee242d758f9318c6a1ea1dae96aa3a'
         '33ab286a20242dda7743a900f369d68a')

_extra_arches=(aarch64 alpha arm armeb cris lm32 m68k microblaze microblazeel mips
mips64 mips64el mipsel mipsn32 mipsn32el or32 ppc ppc64 ppc64abi32 ppc64le s390x
sh4 sh4eb sparc sparc32plus sparc64 moxie ppcemb tricore unicore32 xtensa xtensaeb)
_extra_blob=(QEMU,cgthree.bin QEMU,tcx.bin bamboo.dtb openbios-ppc
openbios-sparc32 openbios-sparc64 palcode-clipper petalogix-ml605.dtb
petalogix-s3adsp1800.dtb ppc_rom.bin s390-ccw.img s390-zipl.rom slof.bin
spapr-rtas.bin u-boot.e500)

prepare() {
  for _p in *.patch; do
    [[ -e "$_p" ]] || continue
    msg2 "Patching $_p"
    patch -p1 -d ${pkgname:0:-8}-${pkgver} < "$_p"
  done
}

build ()
{
  cd ${pkgname:0:-8}-${pkgver}
  # qemu vs. make 4 == bad
  export ARFLAGS="rv"
  # http://permalink.gmane.org/gmane.comp.emulators.qemu/238740
  export CFLAGS+=' -fPIC'
  # gtk gui breaks keymappings at the moment
#  ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list='pa alsa sdl' \
#              --python=/usr/bin/python2 --smbd=/usr/bin/smbd \
#              --enable-docs --libexecdir=/usr/lib/qemu \
#              --disable-gtk --enable-linux-aio --enable-seccomp \
#              --enable-spice --localstatedir=/var \
#              --enable-tpm \
#              --enable-modules --enable-{rbd,glusterfs,libiscsi,curl}
  ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list='' \
              --python=/usr/bin/python2 --smbd=/usr/bin/smbd \
              --enable-docs --libexecdir=/usr/lib/qemu \
              --disable-gtk --enable-linux-aio --enable-seccomp \
              --disable-spice --localstatedir=/var \
              --enable-tpm \
              --enable-modules --enable-curl
  make V=99
}

package() {
  pkgdesc='A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation. This is a stripped-down version of the official package and requires only the bare essentials for running on a headless server.'
#  depends=('glibc' 'pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2'
#           'gnutls' 'bluez-libs' 'vde2' 'util-linux' 'libsasl' 'libgl'
#           'seabios' 'libcap' 'libcap-ng' 'libaio' 'libseccomp' 'libcacard'
#           'spice' 'usbredir' 'lzo' 'snappy' 'gcc-libs' 'zlib' 'bzip2' 'nspr'
#           'ncurses' 'libx11' 'libusb' 'libpulse' 'libssh2' 'curl')
  depends=('glibc' 'libjpeg' 'glib2'
         'util-linux' 'libsasl'
         'seabios' 'libcap' 'libcap-ng' 'libaio' 'libseccomp'
         'lzo' 'snappy' 'gcc-libs' 'zlib' 'bzip2' 'nspr'
         'ncurses' 'libssh2' 'curl'
         )
  replaces=('qemu-kvm')
#  optdepends=('samba: SMB/CIFS server support'
#              'qemu-arch-extra: extra architectures support'
#              'qemu-block-iscsi: iSCSI block support'
#              'qemu-block-rbd: RBD block support'
#              'qemu-block-gluster: glusterfs block support')
  optdepends=('samba: for SMB Server support')
  options=(!strip)
  install=qemu.install

  make -C ${pkgname:0:-8}-${pkgver} DESTDIR="${pkgdir}" libexecdir="/usr/lib/qemu" install

  cd "${pkgdir}"

  # provided by seabios package
  rm usr/share/qemu/bios.bin
  rm usr/share/qemu/acpi-dsdt.aml
  rm usr/share/qemu/q35-acpi-dsdt.aml
  rm usr/share/qemu/bios-256k.bin
  rm usr/share/qemu/vgabios-cirrus.bin
  rm usr/share/qemu/vgabios-qxl.bin
  rm usr/share/qemu/vgabios-stdvga.bin
  rm usr/share/qemu/vgabios-vmware.bin

  # remove conflicting /var/run directory
  rm -r var

  # systemd stuff
  install -D -m644 "${srcdir}/65-kvm.rules" usr/lib/udev/rules.d/65-kvm.rules
  install -D -m644 "${srcdir}/qemu.sysusers" usr/lib/sysusers.d/qemu.conf

  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s usr/lib/qemu/qemu-bridge-helper

#  # remove libcacard files
#  rm -r usr/include/cacard
#  rm usr/lib/libcacard*
#  rm usr/lib/pkgconfig/libcacard.pc
#  rm usr/bin/vscclient
#
#  # remove splitted block modules
#  rm usr/lib/qemu/block-{iscsi,rbd,gluster}.so

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

package_qemu-arch-extra() {
  pkgdesc='QEMU with full support for non x86 architectures'
  depends=('glibc' 'gcc-libs' 'glib2' 'qemu')
  options=(!strip)

  cd qemu-${pkgver}
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

package_qemu-block-iscsi() {
  pkgdesc='QEMU iSCSI block module'
  depends=('glibc' 'glib2' 'libiscsi')

  install -D qemu-${pkgver}/block-iscsi.so "${pkgdir}"/usr/lib/qemu/block-iscsi.so
}

package_qemu-block-rbd() {
  pkgdesc='QEMU RBD block module'
  depends=('glibc' 'glib2' 'ceph')

  install -D qemu-${pkgver}/block-rbd.so "${pkgdir}"/usr/lib/qemu/block-rbd.so
}

package_qemu-block-gluster() {
  pkgdesc='QEMU GlusterFS block module'
  depends=('glibc' 'glib2' 'glusterfs')

  install -D qemu-${pkgver}/block-gluster.so "${pkgdir}"/usr/lib/qemu/block-gluster.so
}

package_qemu-guest-agent() {
  pkgdesc='QEMU Guest Agent'
  depends=('glibc' 'gcc-libs' 'glib2')

  install -D qemu-${pkgver}/qemu-ga "${pkgdir}"/usr/bin/qemu-ga
  install -D qemu-ga.service "${pkgdir}"/usr/lib/systemd/system/qemu-ga.service
}

package_libcacard() {
 pkgdesc='Common Access Card (CAC) Emulation'
 depends=('glibc' 'nss' 'nspr' 'glib2')

  cd "${pkgdir}"
  install -d usr/{bin,lib/pkgconfig,include/cacard}
  cp -a "${srcdir}"/qemu-${pkgver}/libcacard/*.h usr/include/cacard/
  cp -a "${srcdir}"/qemu-${pkgver}/libcacard.pc usr/lib/pkgconfig/
  cp -a "${srcdir}"/qemu-${pkgver}/.libs/vscclient usr/bin/
  cp -a "${srcdir}"/qemu-${pkgver}/.libs/libcacard.so* usr/lib/
}


# vim:set ts=2 sw=2 et:
