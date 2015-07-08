# Maintainer: Josh Cartwright <joshc@eso.teric.us>
# Based on extra/qemu maintained by Tobias Powalowski <tpowa@archlinux.org>
pkgname=qemu-fdt
pkgver=1.5.0
pkgrel=2
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
makedepends=('texi2html' 'perl' 'python2')
depends=('pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2' 'gnutls>=2.4.1' 'bluez-libs' 'vde2' 'util-linux' 'curl' 'libsasl' 'libgl' 'libpulse' 'seabios' 'libcap-ng' 'dtc')
conflicts=('qemu')
backup=('etc/qemu/target-x86_64.conf')
install=qemu.install
source=(http://wiki.qemu.org/download/qemu-${pkgver}.tar.bz2
        define-fdt-types.patch
        65-kvm.rules)
options=(!strip)

prepare()
{
  cd "${srcdir}/qemu-${pkgver}"
  sed -i -e 's/lib64/lib/g' ldscripts/x86_64.ld
  # fix building with newer dtc versions
  # http://lists.gnu.org/archive/html/qemu-devel/2013-05/msg00856.html
  patch -Np1 -i ${srcdir}/define-fdt-types.patch
}

build ()
{
  cd "${srcdir}/qemu-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --audio-drv-list=oss,alsa,sdl,pa \
              --python=/usr/bin/python2 \
              --enable-docs --enable-mixemu --libexecdir=/usr/lib/qemu \
              --enable-fdt
              make
}

package() {
  cd "${srcdir}/qemu-${pkgver}"
  make DESTDIR="${pkgdir}" libexecdir="/usr/lib/qemu" install
  rm "${pkgdir}/usr/share/qemu/bios.bin"

  install -D -m644 "${srcdir}/65-kvm.rules" \
                   "${pkgdir}/usr/lib/udev/rules.d/65-kvm.rules"
  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s "${pkgdir}/usr/lib/qemu/qemu-bridge-helper"
  # add sample config
  echo "allow br0" > ${pkgdir}/etc/qemu/bridge.conf.sample
  # strip scripts directory
    find "${pkgdir}/usr/src/linux-${_kernver}/scripts"  -type f -perm -u+w 2>/dev/null | while read binary ; do
      case "$(file -bi "$binary")" in
        *application/x-executable*) # Binaries
        /usr/bin/strip $STRIP_BINARIES "$binary";;
      esac
    done

}
md5sums=('b6f3265b8ed39d77e8f354f35cc26e16'
         'ead7109d56d11f736297c730af85a114'
         'b316a066d2f1bb57d8f5b7ea1d0d1caf')
