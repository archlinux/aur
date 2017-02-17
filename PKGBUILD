# Maintainer: ajs124 < aur at ajs124 dot de >, saren < saren at wtako dot net >
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-saren-git
_gitname=qemu
pkgname=('qemu-saren-git'
         'qemu-arch-extra-saren-git'
         'qemu-block-iscsi-saren-git'
         'qemu-block-rbd-saren-git'
         'qemu-block-gluster-saren-git'
         'qemu-guest-agent-saren-git')
pkgver=2.8.0.r51295.ad584d37f2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url='http://wiki.qemu.org/'
conflicts=('qemu' 'qemu-saren-git')
makedepends=('spice' 'spice-protocol' 'pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2'
             'gnutls' 'bluez-libs' 'vde2' 'util-linux' 'curl' 'libsasl'
             'libgl' 'libpulse' 'libcap-ng' 'libaio' 'libseccomp'
             'libiscsi' 'python2' 'virglrenderer'
             'usbredir' 'ceph' 'glusterfs' 'libssh2' 'lzo' 'snappy'
             'dtc' 'libepoxy' 'git' 'texi2html' 'perl' 'numactl')
source=(git://git.qemu.org/qemu.git
        qemu.sysusers
        qemu-ga.service
        65-kvm.rules
        qemu.install
        https://launchpadlibrarian.net/282321876/pulseaudio-microphone-workaround.patch)
sha256sums=('SKIP'
            'dd43e2ef062b071a0b9d0d5ea54737f41600ca8a84a8aefbebb1ff09f978acfb'
            '0b4f3283973bb3bc876735f051d8eaab68f0065502a3a5012141fad193538ea1'
            '60dcde5002c7c0b983952746e6fb2cf06d6c5b425d64f340f819356e561e7fc7'
            '0df69a77645c9a05f98635773666b6212084525d7801ef8382242b06baebe5aa'
            '57d87ba45340f9b7f4b70834fc35da25be72cf4092abcc5012e853aa7b37c83a')

_extra_arches=(aarch64 alpha arm armeb cris lm32 m68k microblaze microblazeel mips
mips64 mips64el mipsel mipsn32 mipsn32el or1k ppc ppc64 ppc64abi32 ppc64le s390x
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
  patch -p1 < ../pulseaudio-microphone-workaround.patch
  # qemu vs. make 4 == bad
  export ARFLAGS="rv"
  # http://permalink.gmane.org/gmane.comp.emulators.qemu/238740
  export CFLAGS+=' -fPIC'
  # gtk gui breaks keymappings at the moment
  ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list='pa alsa sdl' \
              --python=/usr/bin/python2 --smbd=/usr/bin/smbd \
              --enable-docs --libexecdir=/usr/lib/qemu \
              --enable-linux-aio --enable-seccomp --enable-spice \
              --localstatedir=/var \
              --enable-tpm --disable-werror \
              --enable-modules --enable-{rbd,glusterfs,libiscsi,curl}
  make V=99
}

package_qemu-saren-git() {
  pkgdesc='A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation. Git version. GTK support, Spice support and Pulseaudio microphone input delay workaround patch included.'
  depends=('spice' 'spice-protocol' 'pixman' 'libjpeg' 'libpng' 'sdl' 'libgl'
           'gnutls' 'bluez-libs'
           'usbredir' 'lzo' 'snappy' 'libpulse'
           'dtc' 'numactl' 'libnfs' 'libepoxy')
  optdepends=('ovmf: Tianocore UEFI firmware for qemu'
              'samba: SMB/CIFS server support'
              'qemu-arch-extra-saren-git: extra architectures support'
              'qemu-block-iscsi-saren-git: iSCSI block support'
              'qemu-block-rbd-saren-git: RBD block support'
              'qemu-block-gluster-saren-git: glusterfs block support')
  conflicts=('qemu' 'kvm' 'kvm-git' 'qemu-spice' 'seabios' 'seabios-git' 'qemu-git')
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

package_qemu-arch-extra-saren-git() {
  pkgdesc='QEMU with full support for non x86 architectures. Git version'
  depends=('glib2' 'qemu-saren-git')
  conflicts=('qemu-arch-extra' 'qemu-arch-extra-git')
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

package_qemu-block-iscsi-saren-git() {
  pkgdesc='QEMU iSCSI block module. Git version.'
  depends=('glib2' 'libiscsi')
  conflicts=('qemu-block-iscsi' 'qemu-block-iscsi-git')
  provides=(qemu-block-iscsi)

  install -D $_gitname/block-iscsi.so "${pkgdir}"/usr/lib/qemu/block-iscsi.so
}

package_qemu-block-rbd-saren-git() {
  pkgdesc='QEMU RBD block module. Git version.'
  depends=('glib2' 'ceph')
  conflicts=('qemu-block-rbd' 'qemu-block-rbd-git')
  provides=(qemu-block-rbd)

  install -D $_gitname/block-rbd.so "${pkgdir}"/usr/lib/qemu/block-rbd.so
}

package_qemu-block-gluster-saren-git() {
  pkgdesc='QEMU GlusterFS block module. Git version.'
  depends=('glib2' 'glusterfs')
  conflicts=('qemu-block-gluster' 'qemu-block-gluster-git')
  provides=(qemu-block-gluster)

  install -D $_gitname/block-gluster.so "${pkgdir}"/usr/lib/qemu/block-gluster.so
}

package_qemu-guest-agent-saren-git() {
  pkgdesc='QEMU Guest Agent. Git version'
  depends=('glib2')
  conflicts=('qemu-guest-agent' 'qemu-guest-agent-git')
  provides=(qemu-guest-agent)

  install -D $_gitname/qemu-ga "${pkgdir}"/usr/bin/qemu-ga
  install -D qemu-ga.service "${pkgdir}"/usr/lib/systemd/system/qemu-ga.service
}
