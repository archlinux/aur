# Maintainer: ajs124 < aur at ajs124 dot de>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-git
_gitname=qemu
pkgname=('qemu-git'
         'qemu-block-iscsi-git'
         'qemu-block-rbd-git'
         'qemu-block-gluster-git'
         'libcacard-git')
pkgver=2.4.r40384.g2d69736
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
        65-kvm.rules
        qemu.install
        qemu.sysusers)
sha256sums=('SKIP'
            '60dcde5002c7c0b983952746e6fb2cf06d6c5b425d64f340f819356e561e7fc7'
            '0df69a77645c9a05f98635773666b6212084525d7801ef8382242b06baebe5aa'
            'dd43e2ef062b071a0b9d0d5ea54737f41600ca8a84a8aefbebb1ff09f978acfb')

pkgver() {
	cd "${srcdir}/$_gitname"
	echo "2.4.r$(git rev-list --count master).g$(git log -1 --format="%h")"
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
              --localstatedir=/var --enable-tpm \
              --enable-modules --enable-{rbd,glusterfs,libiscsi,curl}
  make V=99
}

package_qemu-git() {
  pkgdesc='A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation. Git version.'
  depends=('glibc' 'pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2'
           'gnutls' 'bluez-libs' 'vde2' 'util-linux' 'libsasl' 'libgl'
           'seabios' 'libcap' 'libcap-ng' 'libaio' 'libseccomp' 'libcacard'
           'usbredir' 'lzo' 'snappy' 'gcc-libs' 'zlib' 'bzip2' 'nspr'
           'ncurses' 'libx11' 'libusb' 'libpulse' 'libssh2' 'curl')
  backup=('etc/qemu/target-x86_64.conf')
  optdepends=('ovmf: Tianocore UEFI firmware for qemu'
              'samba: SMB/CIFS server support'
              'qemu-block-iscsi: iSCSI block support'
              'qemu-block-rbd: RBD block support'
              'qemu-block-gluster: glusterfs block support')
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

  # add sample config
  echo 'allow br0' > etc/qemu/bridge.conf.sample

  # manual striping in scripts directory
  find usr/src/linux-${_kernver}/scripts -type f -perm -u+w 2>/dev/null|while read binary ; do
      case "$(file -bi "$binary")" in
        *application/x-executable*) # Binaries
        /usr/bin/strip $STRIP_BINARIES "$binary";;
      esac
    done

  # remove libcacard files
  rm -r usr/include/cacard
  rm usr/lib/libcacard*
  rm usr/lib/pkgconfig/libcacard.pc
  rm usr/bin/vscclient

  # remove splitted block modules
  rm usr/lib/qemu/block-{iscsi,rbd,gluster}.so
}

package_libcacard-git() {
  pkgdesc='Common Access Card (CAC) Emulation. Git version.'
  depends=('glibc' 'nss' 'nspr' 'glib2')
  conflicts=(libcacard)
  provides=(libcacard)

  cd "${pkgdir}"
  install -d usr/{bin,lib/pkgconfig,include/cacard}
  cp -a "${srcdir}"/qemu-${pkgver}/libcacard/*.h usr/include/cacard/
  cp -a "${srcdir}"/qemu-${pkgver}/libcacard.pc usr/lib/pkgconfig/
  cp -a "${srcdir}"/qemu-${pkgver}/.libs/vscclient usr/bin/
  cp -a "${srcdir}"/qemu-${pkgver}/.libs/libcacard.so* usr/lib/
}

package_qemu-block-iscsi-git() {
  pkgdesc='QEMU iSCSI block module. Git version.'
  depends=('glibc' 'glib2' 'libiscsi')
  conflicts=(qemu-block-iscsi)
  provides=(qemu-block-iscsi)

  install -D qemu-${pkgver}/block-iscsi.so "${pkgdir}"/usr/lib/qemu/block-iscsi.so
}

package_qemu-block-rbd-git() {
  pkgdesc='QEMU RBD block module. Git version.'
  depends=('glibc' 'glib2' 'ceph')
  conflicts=(qemu-block-rbd)
  provides=(qemu-block-rbd)

  install -D qemu-${pkgver}/block-rbd.so "${pkgdir}"/usr/lib/qemu/block-rbd.so
}

package_qemu-block-gluster-git() {
  pkgdesc='QEMU GlusterFS block module. Git version.'
  depends=('glibc' 'glib2' 'glusterfs')
  conflicts=(qemu-block-gluster)
  provides=(qemu-block-gluster)

  install -D qemu-${pkgver}/block-gluster.so "${pkgdir}"/usr/lib/qemu/block-gluster.so
}

# vim:set ts=2 sw=2 et:
