pkgname='qemu-static'
pkgver=2.7.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation."
depends=('qemu')
makedepends=('perl' 'python2'
	     'glibc-static' 'glib2-static' 'pcre-static')
options=(!strip)
source=(http://wiki.qemu.org/download/qemu-${pkgver}.tar.bz2)
md5sums=('08d4d06d1cb598efecd796137f4844ab')

build() {
  cd "${srcdir}/qemu-${pkgver}"
  export LDFLAGS="-L/usr/lib"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --static --python=/usr/bin/python2 --disable-werror \
              --disable-docs --disable-gtk --disable-vnc --disable-kvm --disable-libssh2 \
              --enable-user --disable-system \
              --disable-fdt --disable-libnfs --disable-glusterfs --disable-libiscsi \
              --disable-gcrypt --disable-nettle
  make
}

package() {
  cd "${srcdir}/qemu-${pkgver}"
  make DESTDIR="${pkgdir}" libexecdir="/usr/lib/qemu" install
  # provided by seabios package
  rm "${pkgdir}/usr/share/qemu/bios.bin"
  rm "${pkgdir}/usr/share/qemu/acpi-dsdt.aml"
#  rm "${pkgdir}/usr/share/qemu/q35-acpi-dsdt.aml"
  # remove conflicting /var/run directory
  rm -r "${pkgdir}/var"
  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s "${pkgdir}/usr/lib/qemu/qemu-bridge-helper"
  # add sample config
  mkdir -p $pkgdir/etc/qemu
  echo "allow br0" > ${pkgdir}/etc/qemu/bridge.conf.sample
  # strip scripts directory
    find "${pkgdir}/usr/src/linux-${_kernver}/scripts"  -type f -perm -u+w 2>/dev/null | while read binary ; do
      case "$(file -bi "$binary")" in
        *application/x-executable*) # Binaries
        /usr/bin/strip $STRIP_BINARIES "$binary";;
      esac
    done
  # remove libcacard files
  rm -rf ${pkgdir}/usr/lib/libcacard*
  rm -rf ${pkgdir}/usr/lib/pkgconfig/libcacard.pc
  rm -rf ${pkgdir}/usr/bin/vscclient
  rm -rf ${pkgdir}/{etc,usr/{lib,share}}
  cd ${pkgdir}/usr/bin/
  ls -1 | while read f; do
    mv "$f" "$f-static"
  done
}
