# Maintainer: ajs124 < aur at ajs124 dot de>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Frederic Bezies <fredbezies@gmail.com>

pkgname=qemu-git
_gitname=qemu
pkgver=2.4.r39316.gb041114
pkgrel=1
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation. Git version."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
url="http://wiki.qemu.org/Index.html"
depends=('pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2'
         'gnutls>=2.4.1' 'bluez-libs' 'vde2' 'util-linux' 'curl' 'libsasl'
         'libgl' 'libpulse' 'libcap-ng' 'libaio' 'libseccomp' 'numactl'
         'libiscsi' 'spice' 'usbredir' 'dtc' 'snappy' 'ceph' 'lzo' 'libepoxy')
makedepends=('git' 'texi2html' 'perl' 'python2' 'spice-protocol')
optdepends=('ovmf: Tianocore UEFI firmware for qemu')
conflicts=('qemu' 'kvm' 'kvm-git' 'qemu-spice' 'libcacard' 'seabios' 'seabios-git')
provides=('qemu' 'qemu-kvm' 'qemu-spice' 'libcacard' 'seabios' 'seabios-git')
backup=('etc/qemu/target-x86_64.conf')
source=('git://git.qemu.org/qemu.git'
        '65-kvm.rules'
        'qemu.install')
sha256sums=('SKIP'
            '9c8a15c34461a9481a34ca9e0ab4ae3825eabe8fd863227f2445325413cd755c'
            '9970c3050e8dc6153c5955d018d114f9fcbc091843b85f9e7b247eb28f09ba10')
install='qemu.install'
options=('!strip')

pkgver() {
	cd "${srcdir}/$_gitname"
	echo "2.4.r$(git rev-list --count master).g$(git log -1 --format="%h")"
}

build() {
	cd $_gitname
	# qemu vs. make 4 == bad
  	export ARFLAGS="rv"
  	# http://permalink.gmane.org/gmane.comp.emulators.qemu/238740
  	# gtk gui breaks keymappings at the moment
 	./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list='pa alsa sdl' \
              --python=/usr/bin/python2 --smbd=/usr/bin/smbd \
              --enable-docs --libexecdir=/usr/lib/qemu \
              --disable-gtk --enable-linux-aio --enable-seccomp \
              --enable-spice --localstatedir=/var --disable-werror
  	make V=99
}

package() {
  cd $_gitname

  make DESTDIR="${pkgdir}" libexecdir="/usr/lib/qemu" install
  # remove conflicting /var/run directory
  rm -r "${pkgdir}/var"
  install -D -m644 "${srcdir}/65-kvm.rules" \
                   "${pkgdir}/usr/lib/udev/rules.d/65-kvm.rules"
  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s "${pkgdir}/usr/lib/qemu/qemu-bridge-helper"
  # add sample config
  mkdir -p ${pkgdir}/etc/qemu/
  echo "allow br0" > ${pkgdir}/etc/qemu/bridge.conf.sample
}
