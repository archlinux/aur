# Maintainer: tuftedocelot@fastmail.fm
# Maintainer: Patryk Kowalczyk <patryk at kowalczyk dot ws>
pkgname=qemu-spice
_pkgname=qemu
pkgver=2.4.0
pkgrel=2
#rc=-rc3
pkgdesc="Latest stable QEMU with KVM spice usbredir virtfs smartcard seccomp iscsi tpm glusterfs fdt and RDMA live migration"
arch=(i686 x86_64 armv7h)
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
depends=('pixman' 'libjpeg' 'libpng' 'libsasl' 'curl' 'sdl' 'alsa-lib' 'nss' 'glib2' 'gnutls>=2.4.1' 'bluez-libs' 'vde2' 'libcap-ng' 'tpm-tools' 'librdmacm' 'libcacard>=2.0.0' 'spice-protocol' 'snappy' 'lzo2'
'util-linux' 'libpulse' 'seabios>=1.7.5' 'spice>=0.12.2' 'libiscsi>=1.9' 'libaio' 'libseccomp' 'libusb' 'glusterfs' 'dtc')
makedepends=('texi2html' 'perl' 'python2')
backup=('etc/qemu/target-x86_64.conf')
install=${pkgname}.install
conflicts=('qemu')
provides=('qemu')
replaces=('kvm' 'qemu' 'qemu-kvm' 'qemu-kvm-spice')
backup=('etc/qemu/target-x86_64.conf')
source=(http://wiki.qemu.org/download/${_pkgname}-${pkgver}${rc}.tar.bz2
	65-kvm.rules
)
options=(!strip)

build()
{
	cd "${srcdir}/${_pkgname}-${pkgver}${rc}"

	./configure --prefix=/usr \
		--python=/usr/bin/python2 \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/qemu \
		--audio-drv-list=alsa,sdl,oss,pa \
		--localstatedir=/var \
		--enable-kvm \
		--enable-spice \
		--enable-guest-agent \
		--enable-sdl \
		--enable-linux-aio \
		--enable-virtfs \
		--enable-smartcard-nss \
		--enable-libiscsi \
		--enable-libssh2 \
		--enable-tpm \
		--enable-glusterfs \
		--enable-rdma \
		--enable-snappy \
		--enable-coroutine-pool \
		--enable-lzo \
		--disable-xen \
		--enable-docs 

	make
}
	#  	--enable-usb-redir
	#	--enable-fdt - dtc compiler	

package()
{
	cd "${srcdir}/${_pkgname}-${pkgver}${rc}"
	make DESTDIR="${pkgdir}" install
	rm "${pkgdir}/usr/share/qemu/bios.bin"

if [ "$CARCH" == "x86_64" ]; then
	# symbolic link for backwards compatibility
	ln -s qemu-system-x86_64 "${pkgdir}/usr/bin/qemu-kvm"
	# symbolic link for to qemu binary for emulator apps
	ln -s qemu-system-x86_64 "${pkgdir}/usr/bin/qemu"
	# symbolic link for to qemu binary for emulator apps
	ln -s qemu-system-x86_64 "${pkgdir}/usr/bin/kvm"
fi

	# install udev rules
	install -D -m644 "${srcdir}/65-kvm.rules" \
	"${pkgdir}/usr/lib/udev/rules.d/65-kvm.rules"

	# bridge_helper needs suid
	# https://bugs.archlinux.org/task/32565
	chmod u+s "${pkgdir}/usr/lib/qemu/qemu-bridge-helper"
	# add sample config
	mkdir -p ${pkgdir}/etc/qemu/
	echo "allow br0" > ${pkgdir}/etc/qemu/bridge.conf.sample

	# strip scrpts directory

	#find "${pkgdir}/usr/bin"  -type f -perm -u+w 2>/dev/null | while read binary ; do
	find "${pkgdir}/usr/src/linux-${_kernver}/scripts"  -type f -perm -u+w 2>/dev/null | while read binary ; do
	case "$(file -bi "$binary")" in
		*application/x-executable*) # Binaries
		/usr/bin/strip $STRIP_BINARIES "$binary";;
	esac
	done
	 # remove libcacard files
  	rm -rf ${pkgdir}/usr/lib/libcacard* 
	rm -rf ${pkgdir}/usr/include/cacard # cacard
	 # remove seabios files
	rm -rf ${pkgdir}/usr/share/qemu/acpi-dsdt.aml 
        rm -rf ${pkgdir}/usr/share/qemu/q35-acpi-dsdt.aml
	 # remove cacard files
  	rm -rf ${pkgdir}/usr/lib/pkgconfig/libcacard.pc
  	rm -rf ${pkgdir}/usr/bin/vscclient
	
	rm "${pkgdir}/usr/share/qemu/bios-256k.bin"
	rm "${pkgdir}/usr/share/qemu/vgabios-cirrus.bin"
	rm "${pkgdir}/usr/share/qemu/vgabios-qxl.bin"
	rm "${pkgdir}/usr/share/qemu/vgabios-stdvga.bin"
	rm "${pkgdir}/usr/share/qemu/vgabios-vmware.bin"
	rmdir "${pkgdir}/var/run"
}
md5sums=('186ee8194140a484a455f8e3c74589f4'
         'b316a066d2f1bb57d8f5b7ea1d0d1caf')
